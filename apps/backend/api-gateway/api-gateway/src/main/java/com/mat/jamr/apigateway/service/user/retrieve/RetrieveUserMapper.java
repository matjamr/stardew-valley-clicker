package com.mat.jamr.apigateway.service.user.retrieve;

import com.mat.jamr.apigateway.service.user.common.MapperConfiguration;
import com.mat.jamr.externalapi.model.RetrieveUserResponse;
import com.mat.jamr.userservice.api.RetrieveUserRequest;
import org.mapstruct.Mapper;

@Mapper(config = MapperConfiguration.class)
public interface RetrieveUserMapper {
    RetrieveUserRequest map(com.mat.jamr.externalapi.model.RetrieveUserRequest request);

    RetrieveUserResponse map(com.mat.jamr.userservice.api.RetrieveUserResponse response);
}
