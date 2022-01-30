#!/bin/bash

expandDocx()
{
    # Check if $1 has a directory $1.dir, if not unzip it to $1.dir
    if [ ! -d $1.dir ]; then
        unzip -q $1 -d $1.dir
    fi
}

getIndex()
{
    # search for this regular expression to get all id
    # <w:(ins|del|pPrChange) w:id="
    COUNT=$(grep -ow 'w:id=...\w*' $1.dir/word/document.xml | tail -1)
    # Just get the number and store it to MAX
    MAX=$(echo "COUNT=$COUNT" | grep -o -E '[0-9]+')

    if [[ $MAX -eq 0 ]]
    then
        echo "No tracked changes"
    else
        echo $MAX

        # MAX=$((MAX+1))
        # echo $MAX
    fi
}

# FROM="<w:t>I am currently renting my property to the following tenants:<\/w:t>"
# TO="<w:t>We am currently renting my property to the following tenants:<\/w:t>"

# sed -i -e "s/$FROM/$TO/g" Mailbox_key_replacement_original/word/document.xml

helpFunction()
{
    echo "Usage: $0 input_file"
    exit 1 # Exit script after printing help
}

if [ -z $1 ]
then
    echo "Missing input file"
    helpFunction
fi

expandDocx $1
getIndex $1