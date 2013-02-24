#! /bin/bash
# Script to create .rst documentation branch inside a project

######### VARIABLES

PROJECT=$1

REMOTE=""
SECTIONS=""
BRANCH_DOC="doc"
# used in sphinxinit
DIRS="_build _deploy _downloads _images _static"
KEEP=".gitkeep"
# used in main program
MASTER="master"
CONFPY=""

# ===============function to initialize Sphinx in a folder=====================

sphinxinit () {
  echo -e "$(tput setaf 1)\n -- Initializing Sphinxdoc in folder \"${PWD##*/}\" -- \n$(tput sgr0)"

  # add sphinx to documents folder
  sphinx-quickstart

  # create directories and keep for git
  for DIR in $DIRS ; do
    if [[ ! -d $DIR ]] ; then
      mkdir $DIR
    fi
    touch $DIR/$KEEP
  done

  # edit conf.py: use sphinxdoc theme, remove index navigation link
  sed -i "s/html_theme = 'default'/html_theme = 'sphinxdoc'/" ./conf.py
  sed -i "s/\#html_use_index = True/html_use_index = False/" ./conf.py
  
  # make initial index html
  make clean html
  # edit sphinxdoc.css
  if [[ -e "_build/html/_static/sphinxdoc.css" ]] ; then
    cp _build/html/_static/sphinxdoc.css _static/
    touch _static/.gitignore
    sed -i "s/  margin: 0px 80px 0px 80px/# margin: 0px 80px 0px 80px/" ./_static/sphinxdoc.css
  fi
  # add entries for pseudo-dynamic deployment
  touch _static/index.php
  echo 'php_flag engine off' > _static/.htaccess
  # make fresh index html
  make clean html
}

# =============================================================================

######### PRE-EXECUTION TESTS

# test for no project name entered
if [[ $PROJECT = "" ]] ; then
  # project folder may be open already
  if [[ ! -d .git ]] ; then
    echo "Not in a project, or no project name given. Exiting ... "
    exit
  else
    PROJECT=${PWD##*/}
  fi
else
  # test for project folder does not exist
  if [[ -d $PROJECT ]] ; then
    # test for project folder is not a git repository
    if [[ -d $PROJECT/.git ]] ; then
      # now open project folder
      cd $PROJECT
    else
      echo "Folder \"$PROJECT\" is not a git repository. Exiting ... "
      exit
    fi
  else
    echo "Project folder \"$PROJECT\" does not exist. Exiting ... "
    exit
  fi
fi

echo "Project is \"$PROJECT\""

# test for project has a remote, otherwise document deployment will not work
set -- $(git remote -v)
REMOTE=$2
if [[ $REMOTE = "" ]] ; then
  echo "Project \"$PROJECT\" has no remote. Exiting ... "
  exit
fi

echo "Remote for project is $REMOTE"

########## MAIN PROGRAM

mkdir -p $BRANCH_DOC
if [[ ! -d $BRANCH_DOC/.git ]] ; then

  cd $BRANCH_DOC

  # create doc folder with branch $BRANCH_DOC
  git init
  git commit --allow-empty -m "empty first commit"
  set -- $(git branch)
  git branch -m $2 $BRANCH_DOC
  git remote add origin $REMOTE
  echo "BRANCH is \"$(git branch -a)\""
  git fetch origin

  # if no sections specified, look for a file \"sections\" listing sections
  if [[ -e sections ]] ; then
    SECTIONS+=" "$(<sections)
  fi

  # initialize main or subsections folders
  if [[ $SECTIONS = "" ]] ; then
    sphinxinit
  else
    CONFPY='\n\n''intersphinx_mapping = {'
    mkdir _deploy
    mkdir _static
    touch conf.py
    for SECT in $SECTIONS ; do
      if [[ ! -d $SECT ]] ; then
        mkdir $SECT
        ln -s ${PWD}/_deploy ${PWD}/$SECT/_deploy
        ln -s ${PWD}/_static ${PWD}/$SECT/_static
      fi
      cd $SECT
      sphinxinit
      cd ..
      if [[ $SECT != $MASTER ]] ; then
        CONFPY=${CONFPY}'\n'"   '$SECT': ('$SECT', '../_deploy/$SECT/objects.inv'),"
      fi
    done
    CONFPY=${CONFPY}'\n'"}"
    if [[ $SECT == $MASTER ]] ; then
      echo -e ${CONFPY} >> $MASTER/conf.py
    fi
  fi

  cd ..

fi

######### NORMAL EXIT

cd ..

echo
echo "Finished creating directories and files for project \"$PROJECT\"."
echo
echo "Edit main \".gitignore\" file to ignore \"_build\", \"_deploy\" folders."
if [[ ! $SECTIONS = "" ]] ; then
  echo "Edit master index to reference"
  echo "$SECTIONS"
fi
echo "Start each indexable document with a numeric digit."
echo "Edit index files to glob \"[0-9]*\"."
exit

# Authors: Gerald Lovel, gerald@lovels.us