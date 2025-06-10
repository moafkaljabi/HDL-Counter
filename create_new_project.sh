#! /bin/bash

# Get new project name
new_projectname=$1

# Copy base project
cp -R BaseProject $new_projectname

# Replace all filenames and file contents to new project name ( in the new project ) 
cd $new_projectname
find . -type f -name "*BaseProject*" -exec rename -- s/\BaseProject/$new_projectname/ {} + 
find . -type f -exec sed -i s/BaseProject/$new_projectname/g {} +
