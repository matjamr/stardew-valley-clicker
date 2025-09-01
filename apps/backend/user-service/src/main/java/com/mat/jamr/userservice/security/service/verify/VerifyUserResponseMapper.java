package com.mat.jamr.userservice.security.service.verify;


import com.mat.jamr.userservice.api.VerifyUserResponse;
import org.mapstruct.BeanMapping;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.function.Consumer;

@Mapper(componentModel = "spring")
public abstract class VerifyUserResponseMapper implements Consumer<VerifySecurityContext> {

    @Override
    public void accept(VerifySecurityContext verifySecurityContext) {
        verifySecurityContext.verifyUserResponse(map(verifySecurityContext.getUser()));
    }

    @BeanMapping(ignoreByDefault = true)
    @Mapping(source = "email", target = "email")
    @Mapping(source = "name", target = "name")
    //    @Mapping(source = "userId", target = "userId")
    //    @Mapping(source = "surname", target = "surname")
    protected abstract VerifyUserResponse map(com.mat.jamr.userservice.api.User user);
}
