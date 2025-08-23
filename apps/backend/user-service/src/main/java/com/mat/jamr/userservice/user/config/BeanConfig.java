package com.mat.jamr.userservice.user.config;

import com.mat.jamr.userservice.api.SaveUserRequest;
import com.mat.jamr.userservice.api.SaveUserResponse;
import com.mat.jamr.userservice.user.create.service.CreateUserContext;
import com.matjamr.commonutils.CompositeConsumer;
import com.matjamr.commonutils.StrategyBasedConsumer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.List;
import java.util.function.Consumer;
import java.util.function.Function;

@Configuration("CreateBeanConfig")
public class BeanConfig {

    @Bean
    public Function<CreateUserContext, SaveUserResponse> createUserFlow() {
        return new StrategyBasedConsumer<>(List.of(), (aa) -> null);
    }

    @Bean
    public Consumer<SaveUserRequest> saveUserRequestCompositeConsumer() {
        return new CompositeConsumer<>(List.of());
    }
}
