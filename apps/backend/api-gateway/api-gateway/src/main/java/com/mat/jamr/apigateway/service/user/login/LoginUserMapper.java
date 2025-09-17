package com.mat.jamr.apigateway.service.user.login;

import com.mat.jamr.apigateway.service.user.common.MapperConfiguration;
import com.mat.jamr.externalapi.model.LoginUserResponse;
import com.mat.jamr.userservice.api.LoginUserRequest;
import org.mapstruct.Mapper;

@Mapper(config = MapperConfiguration.class)
public interface LoginUserMapper {
    LoginUserRequest map(com.mat.jamr.externalapi.model.LoginUserRequest request);

    LoginUserResponse map(com.mat.jamr.userservice.api.LoginUserResponse response);
}
