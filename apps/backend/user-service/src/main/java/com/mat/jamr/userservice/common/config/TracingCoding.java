package com.mat.jamr.userservice.common.config;

import io.opentelemetry.api.OpenTelemetry;
import io.opentelemetry.api.baggage.propagation.W3CBaggagePropagator;
import io.opentelemetry.api.common.AttributeKey;
import io.opentelemetry.api.trace.propagation.W3CTraceContextPropagator;
import io.opentelemetry.context.propagation.ContextPropagators;
import io.opentelemetry.context.propagation.TextMapPropagator;
import io.opentelemetry.exporter.otlp.http.metrics.OtlpHttpMetricExporter;
import io.opentelemetry.exporter.otlp.http.trace.OtlpHttpSpanExporter;
import io.opentelemetry.exporter.otlp.logs.OtlpGrpcLogRecordExporter;
import io.opentelemetry.sdk.OpenTelemetrySdk;
import io.opentelemetry.sdk.logs.LogRecordProcessor;
import io.opentelemetry.sdk.logs.SdkLoggerProvider;
import io.opentelemetry.sdk.logs.export.BatchLogRecordProcessor;
import io.opentelemetry.sdk.logs.export.LogRecordExporter;
import io.opentelemetry.sdk.metrics.SdkMeterProvider;
import io.opentelemetry.sdk.metrics.export.MetricExporter;
import io.opentelemetry.sdk.metrics.export.MetricReader;
import io.opentelemetry.sdk.metrics.export.PeriodicMetricReader;
import io.opentelemetry.sdk.resources.Resource;
import io.opentelemetry.sdk.trace.SdkTracerProvider;
import io.opentelemetry.sdk.trace.export.SimpleSpanProcessor;
import io.opentelemetry.sdk.trace.export.SpanExporter;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

import java.util.concurrent.TimeUnit;

@Configuration
@Setter
@Profile("prod")
public class TracingCoding {

    @Value("${management.otlp.logs.endpoint}")
    private String logsEndpoint;

    @Value("${management.otlp.metrics.endpoint}")
    private String metricsEndpoint;


    @Value("${management.otlp.traces.endpoint}")
    private String tracingEndpoint;

    @Bean
    public OpenTelemetry openTelemetry() {
        Resource resource = Resource.getDefault()
                .toBuilder()
                .put(AttributeKey.stringKey("service.name"), "user-service")
                .put(AttributeKey.stringKey("service.version"), "${project.version}")
                .build();

        SpanExporter spanExporter = OtlpHttpSpanExporter.builder()
                .setEndpoint(tracingEndpoint).build();
        SdkTracerProvider tracerProvider = SdkTracerProvider.builder()
                .setResource(resource)
                .addSpanProcessor(SimpleSpanProcessor.create(spanExporter))
                .build();
        MetricExporter metricExporter = OtlpHttpMetricExporter.builder()
                .setEndpoint(metricsEndpoint).build();
        MetricReader metricReader = PeriodicMetricReader.builder(metricExporter)
                .setInterval(30, TimeUnit.SECONDS)
                .build();
        SdkMeterProvider meterProvider = SdkMeterProvider.builder()
                .setResource(resource)
                .registerMetricReader(metricReader)
                .build();
        LogRecordExporter logRecordExporter = OtlpGrpcLogRecordExporter.builder()
                .setEndpoint(logsEndpoint).build();
        LogRecordProcessor logRecordProcessor
                = BatchLogRecordProcessor.builder(logRecordExporter).build();
        SdkLoggerProvider sdkLoggerProvider = SdkLoggerProvider.builder()
                .setResource(resource)
                .addLogRecordProcessor(logRecordProcessor).build();

        return OpenTelemetrySdk.builder()
                .setMeterProvider(meterProvider)
                .setTracerProvider(tracerProvider)
                .setLoggerProvider(sdkLoggerProvider)
                .setPropagators(
                        ContextPropagators.create(
                                TextMapPropagator.composite(W3CTraceContextPropagator.getInstance(),
                                        W3CBaggagePropagator.getInstance())
                        )
                )
                .buildAndRegisterGlobal();
    }
}