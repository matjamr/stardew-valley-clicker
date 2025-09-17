package com.mat.jamr.apigateway.service.user.verify;

import com.mat.jamr.apigateway.service.user.common.MapperConfiguration;
import com.mat.jamr.externalapi.model.VerifyUserResponse;
import com.mat.jamr.userservice.api.VerifyUserRequest;
import org.mapstruct.Mapper;

@Mapper(config = MapperConfiguration.class)
public interface VerifyUserMapper {
    VerifyUserRequest map(com.mat.jamr.externalapi.model.VerifyUserRequest request);

    VerifyUserResponse map(com.mat.jamr.userservice.api.VerifyUserResponse response);
}
