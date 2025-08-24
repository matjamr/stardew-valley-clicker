package com.mat.jamr.userservice.security.service.common;

import com.mat.jamr.userservice.api.SecuredUser;
import com.mat.jamr.userservice.common.user.template.UserAware;
import com.mat.jamr.userservice.security.service.JwtService;
import lombok.RequiredArgsConstructor;

import java.util.function.Consumer;

@RequiredArgsConstructor
public class TokenGenerator<T extends TokenAware & UserAware> implements Consumer<T> {

    private final JwtService jwtService;

    @Override
    public void accept(T t) {
        var a = jwtService.generateToken(new SecuredUser(t.getUser()));
        t.setAccessToken(jwtService.generateToken(new SecuredUser(t.getUser())));
        t.setRefreshToken(jwtService.generateToken(new SecuredUser(t.getUser())));
    }
}
