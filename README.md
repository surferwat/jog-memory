# jog-memory
## Description
A bash script that sends an HTML file to the designated email recipient. It is inteded to be used with a scheduler to periodically prompt a review of study notes that have been saved as Markdown files.

Input
* `<output_dir>` - the name of the directory from which a file should be 
* `<source_dir>` - the name of the director where the Markdown files are located
* `<md_to_html_filepath>` - the filepath to where the executable for local copy of md-to-html CLI tool (https://github.com/surferwat/md-to-html)
* `<email_address>` - the email address of the email recipient

## Installation
```
git clone https://github.com/surferwat/jog-memory.git
```

## Usage
```
bash index.sh <output_dir> <source_dir> <md_to_html_filepath> <email_address>
```

## To Do
* [ ] add email capability
* [ ] add tests

## References
* [RANDOM Shell Variable in Linux with Examples](https://www.geeksforgeeks.org/random-shell-variable-in-linux-with-examples/)
* [Loop through directories and subdirectories in bash](https://superuser.com/questions/1358007/loop-through-directories-and-subdirectories-in-bash)