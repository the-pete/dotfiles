#!/bin/sh
 
git filter-branch --env-filter '

OLD_EMAIL=""
read -p "What email would you like to remove from your commits? " OLD_EMAIL

CORRECT_NAME="The-Pete"
CORRECT_EMAIL="pete@evilbiton.net"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
