#!/bin/sh

##############################################################################
#
# Change the author and remove an incrrect or auto generated email from 
#   commit messages.
#
#  1. Push changes to origin
#  2. Create a fresh bare clone of the repo:
#     git clone --bare ssh:repo
#  3. Run this script, add the email to purge
#  4. push to github with
#     git push --force --tags origin 'refs/heads/*'
#  5. Review for errors in git history
#  6. Pull to old repo
#  7. rm -rf old repo
#
##############################################################################

 
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
