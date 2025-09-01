package com.mat.jamr.userservice.security.service.common;

import com.mat.jamr.userservice.api.error.UserServiceException;
import com.mat.jamr.userservice.common.user.template.EmailAware;
import lombok.RequiredArgsConstructor;

import java.util.function.Consumer;

import static com.mat.jamr.userservice.api.error.Error.INVALID_TOKEN;

@RequiredArgsConstructor
public class RefreshTokenVerifier<T extends RefreshTokenAware & EmailAware> implements Consumer<T> {

    private final JwtService accessTokenService;

    @Override
    public void accept(T t) {
        try {
            final String username = accessTokenService.extractUsername(t.getRefreshToken());
            accessTokenService.isTokenValid(t.getRefreshToken());
            t.setEmail(username);
        } catch (Exception e) {
            throw new UserServiceException(INVALID_TOKEN);
        }
    }
}
