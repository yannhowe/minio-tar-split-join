#!/bin/bash
mc config host add minio_host $MINIO_HOST $MINIO_ACCESS_KEY $MINIO_SECRET_KEY --api S3v4
mc mb minio_host/$MINIO_TX_OUT_BUCKET_NAME
mc mb minio_host/$MINIO_RX_IN_BUCKET_NAME
#mc find "minio_host/$MINIO_TX_OUT_BUCKET_NAME" --watch --name "*" --print {base} | xargs -i 'mc cp "minio_host/$MINIO_TX_OUT_BUCKET_NAME"{} minio_host/$MINIO_RX_IN_BUCKET_NAME && mc rm "minio_host/$MINIO_TX_OUT_BUCKET_NAME"{}'
mc mirror -w "minio_host/$MINIO_TX_OUT_BUCKET_NAME" "minio_host/$MINIO_RX_IN_BUCKET_NAME"