package com.mat.jamr.apigateway.service.user.common;

public final class ApplicationConstants {
	
	public static final String COUNTER_TAG_ENVIRONMENT_NAME = "Environment";
	public static final String COUNTER_TAG_MACHINE_NAME = "Rol";
	public static final String COUNTER_TAG_PROCESSOR_NAME = "Processor";

	public static final String HTTP_EVENT_PROCESSING_TIME_METRIC_NAME = "dls_springboot_telemetry_http_event_processing_time";
	public static final String HTTP_EVENT_PROCESSING_TIME_METRIC_DESCRIPTION = "The elapsed time to process an http event on milliseconds.";
	public static final String HTTP_EVENT_PROCESSING_COUNT_METRIC_NAME = "dls_springboot_telemetry_http_event_processed_count";
	public static final String HTTP_EVENT_PROCESSING_COUNT_METRIC_DESCRIPTION = "The number of http event count processed.";
	public static final String HTTP_EVENT_PROCESSING_EXCEPTIONS_METRIC_NAME = "dls_springboot_telemetry_http_event_processing_exceptions";
	public static final String HTTP_EVENT_PROCESSING_EXCEPTIONS_METRIC_DESCRIPTION = "The number of exceptions processing http events.";

}