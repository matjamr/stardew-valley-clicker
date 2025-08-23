package com.mat.jamr.userservice.user.create.service;

import com.mat.jamr.userservice.api.SaveUserRequest;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class CreateUserContext {
    private SaveUserRequest saveUserRequest;
}
