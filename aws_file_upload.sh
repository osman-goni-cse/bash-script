BUCKET_NAME="face-reko-videos"
FILE_NAME="/home/osman/Videos/Osman_Selfie_Video.mp4"


aws s3 cp $FILE_NAME s3://$BUCKET_NAME/
