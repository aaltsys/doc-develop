# Script to deploy .rst documents in a git repository to github gh-pages

######### VARIABLES

PROJECT=$1

REMOTE=""
SECTIONS=""
BRANCH_DEPLOY="gh-pages"
FILE_SPHINX="conf.py"
DIR_DOC="doc"
DIR_DOWNLOADS="_downloads"
DIR_DEPLOY="_deploy"
DIR_INCLUDE="_static"
MAKE_METHOD="html"

# ===========function to build  github deployment in a folder==================

# Compile fresh output for one or more books and copy to deployment folder
makedeployment () {
  make clean $MAKE_METHOD
  cp -R _build/$MAKE_METHOD/* $DIR_OUT

  # Add downloads if they exist
  if [ -d $DIR_DOWNLOADS ] ; then
    cp -R $DIR_DOWNLOADS $DIR_OUT
  fi

  # Add static content
  if [ -d $DIR_INCLUDE ] ; then
    cp -R $DIR_INCLUDE/* $DIR_OUT
  fi
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

# Test for embedded documentation folder inside project
if [[ ! -e $FILE_SPHINX ]] ; then
  # test for documentation is sphinx
  if [[ -e $DIR_DOC/$FILE_SPHINX ]] ; then
    PROJECT=$PROJECT/$DIR_DOC
    cd $DIR_DOC
  else
    echo "No sphinxdoc configuration or document folder missing, exiting ..."
    exit
  fi
fi

########## MAIN PROGRAM

# Read CNAME owner for github deployment, in case there is one
OWNER=$(<cnameowner)

# if no sections specified, look for a file "sections" listing sections
if [[ -e sections ]] ; then
  SECTIONS+=" "$(<sections)
fi

# in the event it is missing, create a git project deployment folder
if [[ ! -d $DIR_DEPLOY ]] ; then
  mkdir -p $DIR_DEPLOY
fi
if [ ! -d $DIR_DEPLOY/.git ] ; then
  cd $DIR_DEPLOY
  git init
  git commit --allow-empty -m "empty first commit"
  set -- $(git branch)
  git branch -m $2 $BRANCH_DEPLOY
  git remote add origin $REMOTE
  echo "BRANCH is \"$(git branch -a)\""
  echo "REMOTE is: "
  echo $(git remote -v)
  git fetch origin
  # Checkout git branch "gh-pages" in the current repository deployment
  git checkout -b $BRANCH_DEPLOY
  cd ..
fi

# Prevent jekyll markup interpretation of deployment directory
touch "$DIR_DEPLOY/.nojekyll"

# Clean the deployment folder and pull the repository branch
rm -rf $DIR_DEPLOY/*
cd $DIR_DEPLOY
git pull origin $BRANCH_DEPLOY
cd ..

# Compile fresh output for one or more books and copy to deployment folder

if [[ "$SECTIONS" = "" ]] ; then
  DIR_OUT=$DIR_DEPLOY
  makedeployment
else
  for SECT in $SECTIONS ; do
    if [ -d $SECT ] ; then
      cd $SECT
        DIR_OUT=$DIR_DEPLOY/$SECT
        mkdir -p $DIR_OUT
        makedeployment
      cd ..
    fi
  done
  if [[ -d 'master' ]] ; then
    cp $DIR_DEPLOY/master/. $DIR_DEPLOY
  fi
fi

# if CNAME owner != remote deployer, remove CNAME
if [ "$REMOTE" == "${REMOTE/$OWNER/}" ] ; then
  rm $DIR_DEPLOY/CNAME
fi

# Deploy the repository branch
if [ -d $DIR_DEPLOY ] ; then
  cd $DIR_DEPLOY
  git add .
  git commit -a -m "Deployed documentation"
  git push -u origin $BRANCH_DEPLOY
  cd ..
fi

######### NORMAL EXIT

echo "Deployed! Be sure that your source changes are commited and pushed as well."

# Authors: Gerald Lovel, gerald@lovels.us

# 12/17/2012 - GARL -- Added copy master folder contents to $DIR_DEPLOY root