package com.matjamr.commonutils;

import java.util.List;
import java.util.function.Consumer;

public class CompositeConsumer<T> implements Consumer<T> {

    private final List<Consumer<T>> consumers;

    public CompositeConsumer(List<Consumer<T>> consumers) {
        this.consumers = consumers;
    }

    @Override
    public void accept(T t) {
        consumers.forEach(consumer -> consumer.accept(t));
    }
}
