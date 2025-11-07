package com.mat.jamr.apigateway.service.user.refresh;

import com.mat.jamr.externalapi.model.RefreshTokenRequest;
import com.mat.jamr.externalapi.model.RefreshTokenResponse;
import com.mat.jamr.userservice.api.SecurityServiceGrpc;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.function.Function;

@Service
@RequiredArgsConstructor
public class RefreshTokenService implements Function<RefreshTokenRequest, RefreshTokenResponse> {

    private final RefreshTokenMapper refreshTokenMapper;
    private final SecurityServiceGrpc.SecurityServiceBlockingStub securityServiceClient;

    @Override
    public RefreshTokenResponse apply(RefreshTokenRequest request) {
        var response = securityServiceClient.refresh(refreshTokenMapper.map(request));

        return refreshTokenMapper.map(response);
    }
}
