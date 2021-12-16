#!bin/bash

OUTPUT_DIR=$1 # directory to output working files
SOURCE_DIR=$2 # directory where notes saved as Markdown files are located
MD_PARSER_FILEPATH=$3 # filepath to executable for local copy of md-to-html CLI tool (https://github.com/surferwat/md-to-html)
EMAIL_ADDR=$4 # email address where selected note should be sent
DEFAULT_FILE_NAME="selected-file.md" # dummy file name for file selected from SOURCE_DIR
RANDOM=$$ # set seed as PID of shell which is stored in $$ variable
ARGS_NUM=3 # required number of arguments 

# Function to check pre- and post-conditions
check_condition() {
    if [ $1 ] # arg $1 is condition to test
    then
        echo -e $2 # arg $2 is error message
        echo "...exiting"
        exit 1
    fi
}

# Ensure adequate number of arguments are passed
check_condition "$# < $ARGS_NUM" "invalid number of args"

# Determine the number of files in directory, n
FILE_COUNT=$(ls $SOURCE_DIR | wc -l)

# Select a random number between 0 and n-1
TARGET_NUM=$(($RANDOM%$FILE_COUNT+1))

# Find the Markdown file that corresponds to the selected number
shopt -s globstar
SELECTED_FILE_NAME=$(ls -d $SOURCE_DIR/**/*.md | sed -n "${TARGET_NUM}p")

# Copy the selcted file into the output directory
cp $SELECTED_FILE_NAME "${OUTPUT_DIR}/${DEFAULT_FILE_NAME}"

# Convert Markdown file into HTML format 
$MD_PARSER_FILEPATH "${OUTPUT_DIR}/${DEFAULT_FILE_NAME}"
