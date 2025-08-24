package com.mat.jamr.userservice.user.create.mapper;

import com.mat.jamr.userservice.api.SaveUserResponse;
import com.mat.jamr.userservice.api.User;
import com.mat.jamr.userservice.user.create.service.CreateUserContext;
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
