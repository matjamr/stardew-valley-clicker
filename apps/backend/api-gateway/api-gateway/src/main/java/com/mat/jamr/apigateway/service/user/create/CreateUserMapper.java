package com.mat.jamr.apigateway.service.user.create;

import com.mat.jamr.apigateway.service.user.common.MapperConfiguration;
import com.mat.jamr.externalapi.model.SaveUserResponse;
import com.mat.jamr.userservice.api.SaveUserRequest;
import org.mapstruct.Mapper;

@Mapper(config = MapperConfiguration.class)
public interface CreateUserMapper {
    SaveUserRequest map(com.mat.jamr.externalapi.model.SaveUserRequest request);

    SaveUserResponse map(com.mat.jamr.userservice.api.SaveUserResponse response);
}
