package com.mat.jamr.apigateway.service.game.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Named;
import org.springframework.util.StringUtils;

@Mapper(componentModel = "spring")
public interface ProtoStringMapper {
    @Named("toProto")
    default String toProto(String s) {
        return StringUtils.hasText(s) ? s : "";
    }

    @Named("toExternal")
    default String toExternal(String s) {
        return s == null ? "" : s;
    }
}
