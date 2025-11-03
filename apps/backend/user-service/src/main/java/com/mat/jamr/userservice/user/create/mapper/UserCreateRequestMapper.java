package com.mat.jamr.userservice.user.create.mapper;

import com.mat.jamr.userservice.api.SaveUserRequest;
import com.mat.jamr.userservice.api.User;
import com.mat.jamr.userservice.user.create.service.CreateUserContext;
import org.mapstruct.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.UUID;
import java.util.function.Consumer;

@Mapper(componentModel = "spring")
public abstract class UserCreateRequestMapper implements Consumer<CreateUserContext> {

    @Autowired
    private PasswordEncoder passwordEncoder;

    protected abstract User mapUserCreate(SaveUserRequest userRequest);

    @Override
    public void accept(CreateUserContext createUserContext) {
        var newUser = mapUserCreate(createUserContext.getSaveUserRequest());

        newUser.setId(UUID.randomUUID().toString());

        // Hash the password before saving
        if (newUser.getPassword() != null && !newUser.getPassword().isEmpty()) {
            String hashedPassword = passwordEncoder.encode(newUser.getPassword());
            newUser.setPassword(hashedPassword);
        }

        createUserContext.setUser(newUser);
    }
}
