#! /bin/bash
# Script to deploy .rst documents in a git repository

######### VARIABLES

PROJECT=$1

OWNER=""
REMOTE=""
SECTIONS=""
BRANCH_DEPLOY=""
MASTER="master"
DEPLOY="deploy"
FILE_SPHINX="conf.py"
DIR_DOC="doc"
DIR_DOWNLOADS="_downloads"
DIR_DEPLOY="_deploy"
DIR_STATIC="_static"
DIR_INCLUDE="_include"
MAKE_METHOD="html"
GITHUB="gh-pages"
HEROKU="master"

# ===========function to build  github deployment in a folder==================

# Compile fresh output for one or more books and copy to deployment folder
makedeployment () {
  make clean $MAKE_METHOD
  cp -R _build/$MAKE_METHOD/* $DIR_OUT

  # Add downloads if they exist
  if [[ -d $DIR_DOWNLOADS ]] ; then
    cp -R $DIR_DOWNLOADS $DIR_OUT
  fi

  # Add static content (static is link shared with all sections, include is not)
  if [[ -d $DIR_STATIC ]] ; then
    cp -R $DIR_STATIC/* $DIR_OUT
  fi
  if [[ -d $DIR_INCLUDE ]] ; then
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
    exit 1
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
      exit 1
    fi
  else
    echo "Project folder \"$PROJECT\" does not exist. Exiting ... "
    exit 1
  fi
fi

echo "Project is \"$PROJECT\""

# test for project has a remote, otherwise document deployment will not work
set -- $(git remote -v)
REMOTE=$2
if [[ $REMOTE = "" ]] ; then
  echo "Project \"$PROJECT\" has no remote. Exiting ... "
  exit 1
fi

echo "Remote for project is $REMOTE"

# Test for embedded documentation folder inside project
if [[ ! -e $FILE_SPHINX ]] ; then
  # test for documentation is sphinx
  if [[ -e $DIR_DOC/$FILE_SPHINX ]] ; then
    PROJECT=$PROJECT/$DIR_DOC
    cd $DIR_DOC
  else
    echo "No sphinxdoc configuration or document folder missing, Exiting ..."
    exit 1
  fi
fi

# in the event it is missing, create a git project deployment folder
if [[ ! -d $DIR_DEPLOY ]] ; then
  mkdir -p $DIR_DEPLOY
fi
if [[ ! -d $DIR_DEPLOY/.git ]] ; then
  cd $DIR_DEPLOY
  git init
  git commit --allow-empty -m "empty first commit"
  set -- $(git branch)
  git branch -m $2 $DEPLOY
  git remote add origin $REMOTE
  echo "BRANCH is \"$(git branch -a)\""
  git fetch origin
  # git checkout -B $DEPLOY
  # Save directory in git and Prevent jekyll markup interpretation
  touch .gitkeep
  touch .gitignore
  touch .nojekyll
  git add .
  git commit -m "hidden control files"
  cd ..
fi

# set branch name for deploy pull and push
case $REMOTE in
  *"github"*)  
    BRANCH_DEPLOY=$GITHUB
    ;;
  *"heroku"*)
    BRANCH_DEPLOY=$HEROKU
    ;;
  **)
    echo "No target branch for the deployment. Exiting ..."
    exit 1
    ;;
esac
  
########## MAIN PROGRAM

echo "  --- MAIN PROGRAM ---"

# Read CNAME owner for github deployment, in case there is one
if [[ -e cnameowner ]] ; then
  OWNER=$(<cnameowner)
fi

# if no sections specified, look for a file "sections" listing sections
if [[ -e sections ]] ; then
  SECTIONS+=" "$(<sections)
fi

# Clean the deployment folder and pull the repository branch
rm -rf $DIR_DEPLOY/*
cd $DIR_DEPLOY
# fatal error returned if remote site does not include the deploy branch
TEST=$(git branch -a)
if [[ "$TEST" != "${TEST/$BRANCH_DEPLOY/}" ]] ; then
  git pull -f origin $BRANCH_DEPLOY:$DEPLOY
fi 
cd ..

# Compile fresh output for one or more books and copy to deployment folder
if [[ "$SECTIONS" = "" ]] ; then
  DIR_OUT=$DIR_DEPLOY
  makedeployment
else
  for SECT in $SECTIONS ; do
    if [[ -d $SECT ]] ; then
      cd $SECT
        DIR_OUT=$DIR_DEPLOY/$SECT
        mkdir -p $DIR_OUT
        makedeployment
      cd ..
    fi
  done
  if [[ $SECT == $MASTER ]] ; then
    cp -r $DIR_DEPLOY/$MASTER/* $DIR_DEPLOY
    if [[ -e $DIR_DEPLOY/$MASTER/CNAME ]] ; then
      rm $DIR_DEPLOY/$MASTER/CNAME
    fi
  fi
fi

# if CNAME owner != remote deployer, remove CNAME
if [[ "$REMOTE" == "${REMOTE/$OWNER/}" ]] ; then
  if [[ -e $DIR_DEPLOY/CNAME ]] ; then
    rm $DIR_DEPLOY/CNAME
  fi
fi

# Deploy the repository branch
if [[ -d $DIR_DEPLOY ]] ; then
  cd $DIR_DEPLOY
  git add .
  git commit -m "Deployed documentation"
  git push -u origin $DEPLOY:$BRANCH_DEPLOY

  echo "pushed to origin branch $DEPLOY:$BRANCH_DEPLOY"

  cd ..
fi

######### NORMAL EXIT

echo "  --- FINISHED ---"
echo "Check all messages for possible errors."
echo "Then commit and push source changes as well."

# Authors: Gerald Lovel, gerald@lovels.us

# 12/17/2012 - GARL -- Added copy master folder contents to $DIR_DEPLOY root
# 02/20/2013 - GARL -- Added support for deployment to Heroku, Github, ...