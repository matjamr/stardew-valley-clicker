package com.mat.jamr.apigateway.error;

import com.mat.jamr.externalapi.model.Error;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface ErrorMapper {

    @Mapping(source = "code", target = "code")
    @Mapping(source = "message", target = "message")
    Error mapError(ApiGatewayError e);
}
