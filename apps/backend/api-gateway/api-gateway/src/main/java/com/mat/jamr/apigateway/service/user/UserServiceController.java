package com.mat.jamr.apigateway.service.user;

import com.mat.jamr.externalapi.model.*;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/users")
public class UserServiceController {

    @GetMapping("/{id}")
    public RetrieveUserResponse getUser(@PathVariable String id) {
        return new RetrieveUserResponse();
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
