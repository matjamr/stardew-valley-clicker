package com.mat.jamr.gameservice.service.common;

import io.minio.BucketExistsArgs;
import io.minio.MakeBucketArgs;
import io.minio.MinioClient;
import io.minio.PutObjectArgs;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.io.InputStream;

@Service
@RequiredArgsConstructor
public class MinioFileService {
    private final MinioClient minioClient;

    public String uploadFile(String objectName, InputStream inputStream) {
        try {
            boolean found = minioClient.bucketExists(BucketExistsArgs.builder().bucket("stardew-valley-clicker").build());
            if (!found) {
                minioClient.makeBucket(MakeBucketArgs.builder().bucket("stardew-valley-clicker").build());
            }
            var response = minioClient.putObject(
                    PutObjectArgs.builder().bucket("stardew-valley-clicker")
                            .object(objectName).stream(inputStream, inputStream.available(), -1)
                            .contentType("application/octet-stream")
                            .build());

            return "";
        } catch (Exception e) {
            throw new RuntimeException("Error occurred: " + e.getMessage());
        }
    }
}
