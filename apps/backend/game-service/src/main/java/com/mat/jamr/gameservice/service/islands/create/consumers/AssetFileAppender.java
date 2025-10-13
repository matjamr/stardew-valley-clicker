package com.mat.jamr.gameservice.service.islands.create.consumers;

import com.mat.jamr.gameservice.context.CreateAssetContext;
import com.mat.jamr.gameservice.service.common.MinioFileService;
import lombok.RequiredArgsConstructor;

import java.util.function.Consumer;

@RequiredArgsConstructor
public class AssetFileAppender implements Consumer<CreateAssetContext> {

    private final MinioFileService minioFileService;

    @Override
    public void accept(CreateAssetContext context) {
        minioFileService.uploadFile(context.getAsset().getName(), context.getCreateAssetRequest().getContent().newInput());
    }
}
