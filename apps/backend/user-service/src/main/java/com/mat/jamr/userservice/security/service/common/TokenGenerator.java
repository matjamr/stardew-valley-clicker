package com.mat.jamr.userservice.security.service.common;

import com.mat.jamr.userservice.api.SecuredUser;
import com.mat.jamr.userservice.common.user.template.UserAware;
import lombok.RequiredArgsConstructor;

import java.util.function.Consumer;

@RequiredArgsConstructor
public class TokenGenerator<T extends UserAware & AccessTokenAware & RefreshTokenAware> implements Consumer<T> {

    private final JwtService accessTokenService;
    private final JwtService refreshTokenService;

    @Override
    public void accept(T t) {
        t.setAccessToken(accessTokenService.generateToken(new SecuredUser(t.getUser())));
        t.setRefreshToken(refreshTokenService.generateToken(new SecuredUser(t.getUser())));
    }
}
