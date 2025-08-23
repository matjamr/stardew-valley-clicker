package com.mat.jamr.userservice.user.create.service;

import com.mat.jamr.userservice.api.SaveUserResponse;
import com.mat.jamr.userservice.api.User;
import org.mapstruct.Mapper;

import java.util.function.Consumer;

@Mapper(componentModel = "spring")
public abstract class UserCreateResponseMapper implements Consumer<CreateUserContext> {

    protected abstract SaveUserResponse mapUser(User user);

    @Override
    public void accept(CreateUserContext createUserContext) {
        createUserContext.setSaveUserResponse(mapUser(createUserContext.getUser()));
    }
}
