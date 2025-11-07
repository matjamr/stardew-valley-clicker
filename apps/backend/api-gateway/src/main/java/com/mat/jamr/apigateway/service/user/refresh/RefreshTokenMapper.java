package com.mat.jamr.apigateway.service.user.refresh;

import com.mat.jamr.apigateway.service.user.common.MapperConfiguration;
import com.mat.jamr.externalapi.model.RefreshTokenResponse;
import org.mapstruct.Mapper;

@Mapper(config = MapperConfiguration.class)
public interface RefreshTokenMapper {
    com.mat.jamr.userservice.api.RefreshTokenRequest map(com.mat.jamr.externalapi.model.RefreshTokenRequest request);

    RefreshTokenResponse map(com.mat.jamr.userservice.api.RefreshTokenResponse response);
}
