package com.mat.jamr.apigateway.service.user.login;


import com.mat.jamr.externalapi.model.LoginUserRequest;
import com.mat.jamr.externalapi.model.LoginUserResponse;
import com.mat.jamr.userservice.api.SecurityServiceGrpc;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.function.Function;

@Slf4j
@Service
@RequiredArgsConstructor
public class LoginUserService implements Function<LoginUserRequest, LoginUserResponse> {

    private final LoginUserMapper loginUserMapper;
    private final SecurityServiceGrpc.SecurityServiceBlockingStub securityServiceClient;

    @Override
    public LoginUserResponse apply(LoginUserRequest request) {
        log.info("=== LOGIN REQUEST RECEIVED ===");
        log.info("Email: {}", request.getEmail());
        log.info("DeviceToken present: {}", request.getDeviceToken() != null);
        if (request.getDeviceToken() != null) {
            log.info("DeviceToken value: {}...", request.getDeviceToken().substring(0, Math.min(20, request.getDeviceToken().length())));
        }

        var grpcRequest = loginUserMapper.map(request);

        log.info("=== GRPC REQUEST MAPPED ===");
        log.info("DeviceToken in gRPC request: {}", grpcRequest.getDeviceToken());
        if (!grpcRequest.getDeviceToken().isEmpty()) {
            log.info("DeviceToken value: {}...", grpcRequest.getDeviceToken().substring(0, Math.min(20, grpcRequest.getDeviceToken().length())));
        }
        log.info("==============================");

        var returnedUser = securityServiceClient.login(grpcRequest);

        return loginUserMapper.map(returnedUser);
    }
}
