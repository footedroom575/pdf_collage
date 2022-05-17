#!/usr/bin/bash

function got_param() {
    local terms="$1"
    shift

    for term in $terms; do
        for arg; do
            if [[ $arg == "$term" ]]; then
                echo "yeah"
            fi
        done
    done
}


# output error if no first arg is given
if [ -z "$1" ]; then
    echo "Usage: ppt2pdf <file.pdf | file.pptx>"
    exit 1
fi

# set OUTPUT_DIR to -o parameter if given else set default value
if [[ -n $(got_param "-o --output" "$@") ]]
then
    OUTPUT_DIR=$pwd$(got_param "-o --output" "$@")
else
    OUTPUT_DIR= $pwd"output"
fi

# if a pdf is given in args, run the following
if [[ -n $(got_param "-p --pdf" "$@") ]]
then
    # set inputPdfName to -p parameter if given else set default value
    if [[ -n $(got_param "-p --pdf" "$@") ]]
    then
        inputPdfName=$pwd$(got_param "-p --pdf" "$@")
    else
        inputPdfName= $pwd"input.pdf"
    fi

    pdfjam $inputPdfName.pdf --nup 2x2 --outfile $OUTPUT_DIR.pdf
fi

# if no parameters are given, diplay utility information
if [[ -z $(got_param "-p --pdf" "$@") ]] && [[ -z $(got_param "-o --output" "$@") ]]
then
    echo "This utility combines pages of a pdf/ppt presentation into a single pdf file in a 2x2 manner"
    echo "Usage: ppt2pdf <file.pdf | file.pptx>"
    echo "Options:"
    echo "-p --pdf: input pdf file"
    echo "-o --output: output directory"
fi
