package com.mat.jamr.apigateway.service.common;

import com.mat.jamr.externalapi.model.VerifyUserResponse;
import lombok.Data;
import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;

@SessionScope
@Component
@Data
public class SecurityContext {
    private VerifyUserResponse verifyUserResponse;
}
