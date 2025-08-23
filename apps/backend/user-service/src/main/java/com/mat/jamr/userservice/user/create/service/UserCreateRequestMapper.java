package com.mat.jamr.userservice.user.create.service;

import com.mat.jamr.userservice.api.SaveUserRequest;
import com.mat.jamr.userservice.api.SaveUserResponse;
import com.mat.jamr.userservice.api.User;
import org.mapstruct.Mapper;

import java.util.function.Consumer;

@Mapper(componentModel = "spring")
public abstract class UserCreateRequestMapper implements Consumer<CreateUserContext> {

    protected abstract User mapUserCreate(SaveUserRequest userRequest);

    @Override
    public void accept(CreateUserContext createUserContext) {
        createUserContext.setUser(mapUserCreate(createUserContext.getSaveUserRequest()));
    }
}
