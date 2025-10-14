package com.mat.jamr.gameservice.service.common.mapper;

import io.micrometer.common.util.StringUtils;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface ProtobufStringMapper {
    default String map(String string) {

        if(StringUtils.isBlank(string)) {
            return "";
        }

        return string;
    }
}
