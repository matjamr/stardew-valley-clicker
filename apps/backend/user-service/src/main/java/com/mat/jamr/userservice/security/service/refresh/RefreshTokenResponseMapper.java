package com.mat.jamr.userservice.security.service.refresh;

import com.mat.jamr.userservice.api.RefreshTokenResponse;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.function.Consumer;


@Mapper(componentModel = "spring")
public abstract class RefreshTokenResponseMapper implements Consumer<RefreshSecurityContext> {

    @Override
    public void accept(RefreshSecurityContext refreshSecurityContext) {
        refreshSecurityContext.refreshTokenResponse(map(refreshSecurityContext.getAccessToken()));
    }

    @Mapping(source = ".", target = "accessToken")
    protected abstract RefreshTokenResponse map(String accessToken);
}
