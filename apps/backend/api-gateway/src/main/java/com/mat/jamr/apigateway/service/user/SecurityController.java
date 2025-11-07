package com.mat.jamr.apigateway.service.user;

import com.mat.jamr.apigateway.service.common.SecurityContext;
import com.mat.jamr.externalapi.model.LoginUserRequest;
import com.mat.jamr.externalapi.model.LoginUserResponse;
import com.mat.jamr.externalapi.model.RefreshTokenRequest;
import com.mat.jamr.externalapi.model.RefreshTokenResponse;
import com.mat.jamr.externalapi.model.VerifyUserRequest;
import com.mat.jamr.externalapi.model.VerifyUserResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.function.Function;

@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
public class SecurityController {

    private final Function<LoginUserRequest, LoginUserResponse> loginUserService;
    private final Function<RefreshTokenRequest, RefreshTokenResponse> refreshTokenService;
    private final Function<VerifyUserRequest, VerifyUserResponse> verifyUserService;
    private final SecurityContext securityContext;

    @PostMapping("/login")
    public LoginUserResponse loginUser(@RequestBody LoginUserRequest request) {
        return loginUserService.apply(request);
    }

    @PostMapping("/verify")
    public VerifyUserResponse verifyUser(@RequestBody VerifyUserRequest request) {
        return verifyUserService.apply(request);
    }

    @PostMapping("/refresh")
    public RefreshTokenResponse refreshToken(@RequestBody RefreshTokenRequest request) {
        return refreshTokenService.apply(request);
    }
}
