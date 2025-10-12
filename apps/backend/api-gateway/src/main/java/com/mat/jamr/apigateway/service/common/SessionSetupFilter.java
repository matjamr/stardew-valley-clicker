package com.mat.jamr.apigateway.service.common;

import com.mat.jamr.apigateway.config.ApplicationProperties;
import com.mat.jamr.externalapi.model.VerifyUserRequest;
import com.mat.jamr.externalapi.model.VerifyUserResponse;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.List;
import java.util.function.Function;

@Component
@RequiredArgsConstructor
public class SessionSetupFilter extends OncePerRequestFilter {

    private final SecurityContext securityContext;
    private final Function<VerifyUserRequest, VerifyUserResponse> verifyUserService;
    private final ApplicationProperties applicationProperties;

    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain) throws ServletException, IOException {

        var currentRequestURI = request.getRequestURI().replaceFirst("/api/users/", "");

        if (applicationProperties.getPermitAll().contains(currentRequestURI)) {
            filterChain.doFilter(request, response);
            return;
        }

        String authHeader = request.getHeader("Authorization");

        if (authHeader != null && authHeader.startsWith("Bearer ")) {
            String token = authHeader.substring(7);

            try {
                securityContext.setVerifyUserResponse(verifyUserService.apply(new VerifyUserRequest().accessToken(token)));
                System.out.println(securityContext.getVerifyUserResponse());
            } catch (Exception e) {
                logger.error("JWT validation failed: " + e.getMessage());
            }
        }

        filterChain.doFilter(request, response);
    }
}
