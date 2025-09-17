package com.matjamr.commonutils;

import java.util.List;
import java.util.function.Consumer;
import java.util.function.Function;

public class StrategyBasedConsumer<T, R> implements Function<T, R> {

    private final List<Consumer<T>> transformers;
    private final Function<T, R> accumulator;

    public StrategyBasedConsumer(List<Consumer<T>> transformers, Function<T, R> accumulator) {
        this.transformers = transformers;
        this.accumulator = accumulator;
    }

    @Override
    public R apply(T t) {
        transformers.forEach(consumer -> consumer.accept(t));

        return accumulator.apply(t);
    }
}
