package com.mat.jamr.gameservice.service.common.mapper;

import io.micrometer.common.util.StringUtils;
import org.mapstruct.Mapper;
import org.mapstruct.Named;

@Mapper(componentModel = "spring")
public interface ProtobufStringMapper {

    /**
     * Legacy/default behavior used for DB -> Proto direction to avoid nulls in Protobuf setters.
     * null or blank -> ""
     */
    default String map(String string) {
        if (StringUtils.isBlank(string)) {
            return "";
        }
        return string;
    }

    /**
     * Use for Proto -> DB direction to "ignore" empty strings by converting them to nulls.
     * blank -> null, otherwise original string.
     */
    @Named("fromProto")
    default String fromProto(String string) {
        if (StringUtils.isBlank(string)) {
            return null;
        }
        return string;
    }

    /**
     * Use for DB -> Proto direction to ensure Protobuf fields are never set to null.
     * null or blank -> ""
     */
    @Named("toProto")
    default String toProto(String string) {
        return map(string);
    }
}
