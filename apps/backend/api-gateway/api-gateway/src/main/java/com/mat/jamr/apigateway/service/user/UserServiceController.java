package com.mat.jamr.apigateway.service.user;

import com.mat.jamr.externalapi.model.*;
import com.mat.jamr.userservice.api.UserServiceGrpc;
import lombok.RequiredArgsConstructor;
import net.devh.boot.grpc.client.inject.GrpcClient;
import org.springframework.web.bind.annotation.*;

import java.util.function.Function;

@RestController
@RequestMapping("/users")
@RequiredArgsConstructor
public class UserServiceController {

    private final Function<String, RetrieveUserResponse> retrieveUserService;

    @GetMapping("/{id}")
    public RetrieveUserResponse getUser(@PathVariable String id) {
        return retrieveUserService.apply(id);
    }

    @PostMapping
    public SaveUserResponse createUser(@RequestBody SaveUserRequest request) {
        return new SaveUserResponse();
    }

    @PostMapping("/verify")
    public VerifyUserResponse verifyUser(@RequestBody VerifyUserRequest request) {
        return new VerifyUserResponse();
    }

    @PostMapping("/refresh")
    public RefreshTokenResponse refreshToken(@RequestBody RefreshTokenRequest request) {
        return new RefreshTokenResponse();
    }

    @PostMapping("/login")
    public LoginUserResponse loginUser(@RequestBody LoginUserRequest request) {
        return new LoginUserResponse();
    }
}
