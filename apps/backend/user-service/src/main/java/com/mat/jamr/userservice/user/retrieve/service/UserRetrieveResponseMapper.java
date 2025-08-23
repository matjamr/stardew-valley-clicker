package com.mat.jamr.userservice.user.retrieve.service;

import com.mat.jamr.userservice.api.RetrieveUserResponse;
import com.mat.jamr.userservice.api.User;
import org.mapstruct.Mapper;

import java.util.function.Consumer;

@Mapper(componentModel = "spring")
public abstract class UserRetrieveResponseMapper implements Consumer<RetrieveUserContext> {

    protected abstract RetrieveUserResponse mapUser(User user);

    @Override
    public void accept(RetrieveUserContext retrieveUserContext) {
        retrieveUserContext.setRetrieveUserResponse(mapUser(retrieveUserContext.getUser()));
    }
}
