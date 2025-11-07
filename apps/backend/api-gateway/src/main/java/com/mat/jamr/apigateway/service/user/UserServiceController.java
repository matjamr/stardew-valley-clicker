package com.mat.jamr.apigateway.service.user;

import com.mat.jamr.externalapi.model.*;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.function.Function;

@RestController
@RequestMapping("/users")
@RequiredArgsConstructor
public class UserServiceController {

    private final Function<String, RetrieveUserResponse> retrieveUserService;
    private final Function<SaveUserRequest, SaveUserResponse> saveUserService;

    @GetMapping("/{id}")
    public RetrieveUserResponse getUser(@PathVariable String id) {
        return retrieveUserService.apply(id);
    }

    @PostMapping
    public SaveUserResponse createUser(@RequestBody SaveUserRequest request) {
        return saveUserService.apply(request);
    }
}
