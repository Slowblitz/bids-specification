#!/bin/sh
# Shell script that runs process_markdowns.py and pandoc_script.py in sequence to build the pdf document

set -eu

# prepare the copied src directory
python3 process_markdowns.py

# copy pandoc_script into the temp src_copy directory
cp pandoc_script.py header.tex cover.tex header_setup.tex src_copy/src

# run pandoc_script from src_copy directory
(
cd src_copy/src
python3 pandoc_script.py
mv bids-spec.pdf ../..
)

# delete the duplicated src directory
rm -rf src_copy
