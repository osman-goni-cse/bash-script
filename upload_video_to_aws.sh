#!/bin/bash

BUCKET_NAME="face-reko-videos"
DIRECTORY="/home/osman/Videos"

for FILE in $DIRECTORY/*
do
  file_extension="${FILE##*.}"
  echo "ext: $file_extension"
  file_name=$(basename "$FILE")
  # Check if the extension is "mp4"
  if [ "$file_extension" = "mp4" ] && [ ! -f "${FILE}.uploaded" ]; then
    echo "$file_name has an .mp4 extension."
    aws s3 cp $FILE s3://$BUCKET_NAME
    if [ $? -eq 0 ]
    then
      echo "$file_name uploaded successfully."
      touch "$FILE.uploaded"
    else
      echo "$file_name upload failed."
    fi
  else
    echo "$file_name does not have an .mp4 extension. Or file is uploaded"
  fi
done
