package com.matjamr.commonutils;

import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.function.Supplier;

public class Validator<T, R extends RuntimeException> implements Consumer<T> {

    private final Predicate<T> predicate;
    private final Function<T, R> errorSupplier;

    public Validator(Predicate<T> predicate, Function<T, R> errorSupplier) {
        this.predicate = predicate;
        this.errorSupplier = errorSupplier;
    }

    @Override
    public void accept(T t) {
        if(predicate.negate().test(t)) {
            throw errorSupplier.apply(t);
        }
    }

}
