#!/bin/bash
cd ./testfiles
for file in *; do
    
    if [ -d $file ] || [ $file == $0 ]; then
        continue
    fi
    extension="${file##*.}"
    if [ $extension == "txt" ]; then
        mkdir -p text
        mv $file text
        echo "$(date) - Moved $file to /text folder" >> /workspaces/logs/challenge3log
    elif [ $extension == "jpg" ] || [ $extension == "png" ]; then 
        mkdir -p images
        mv $file images
        echo "$(date) - Moved $file to /images folder" >> /workspaces/logs/challenge3log
    elif [ $extension == "sh" ]; then
        mkdir -p scripts
        mv $file scripts
        echo "$(date) - Moved $file to /scripts folder" >> /workspaces/logs/challenge3log
    fi
done
