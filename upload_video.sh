S3_BUCKET_NAME="face-reko-videos"

# Local folder to monitor (replace with your folder path)
LOCAL_FOLDER_PATH="/home/osman/Videos"

# File extensions to monitor (comma-separated)
FILE_EXTENSIONS="mp4,avi,mkv,mov"


IFS=$'\n' # Set the internal field separator to newline
for FILE in $LOCAL_FOLDER_PATH/*
do    
  file_name=$(basename "$FILE")
        # Check if the file has not been uploaded yet (using a marker file)
  file_extension="${FILE##*.}"
  file = $FILE
# Check if the extension is "mp4"
  if [ "$file_extension" = "mp4" -a ! -f "$file.uploaded" ]; then
            # Upload the file to AWS S3
     aws s3 cp $FILE s3://$S3_BUCKET_NAME/
            # Check the exit code of the aws command to see if the upload was successful
     if [ $? -eq 0 ]; then
           echo "Uploaded '$file_name' to AWS S3"
                # Create a marker file to indicate the successful upload
           touch "$file.uploaded"
     else
            echo "Error uploading '$file_name' to AWS S3"
      fi
   fi
done
