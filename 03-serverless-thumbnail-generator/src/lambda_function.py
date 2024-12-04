import boto3
from PIL import Image
from io import BytesIO
import os

s3_client = boto3.client('s3')
thumbnail_size = (128, 128)

def lambda_handler(event, context):
    source_bucket = event['Records'][0]['s3']['bucket']['name']
    object_key = event['Records'][0]['s3']['object']['key']
    destination_bucket = os.environ['DESTINATION_BUCKET']

    # Retrieve the image
    response = s3_client.get_object(Bucket=source_bucket, Key=object_key)
    image = Image.open(BytesIO(response['Body'].read()))

    # Create the thumbnail
    image.thumbnail(thumbnail_size)

    # Save to BytesIO
    thumbnail_buffer = BytesIO()
    image.save(thumbnail_buffer, 'JPEG')
    thumbnail_buffer.seek(0)

    # Upload thumbnail to the destination bucket
    s3_client.put_object(
        Bucket=destination_bucket,
        Key=f'thumbnails/{object_key}',
        Body=thumbnail_buffer,
        ContentType='image/jpeg'
    )

    return {
        'statusCode': 200,
        'body': f'Thumbnail created for {object_key}'
    }
