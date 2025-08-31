package com.mat.jamr.userservice.security.service.common;

import com.mat.jamr.userservice.api.error.UserServiceException;
import lombok.RequiredArgsConstructor;

import java.util.function.Consumer;

import static com.mat.jamr.userservice.api.error.Error.INVALID_TOKEN;

@RequiredArgsConstructor
public class AccessTokenVerifier<T extends AccessTokenAware> implements Consumer<T> {

    private final JwtService accessTokenService;

    @Override
    public void accept(T t) {
        try {
            accessTokenService.isTokenValid(t.getAccessToken());
        } catch (Exception e) {
            throw new UserServiceException(INVALID_TOKEN);
        }
    }
}
