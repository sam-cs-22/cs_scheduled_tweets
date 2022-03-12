span_processor = OpenTelemetry::SDK::Trace::Export::BatchSpanProcessor.new(
  OpenTelemetry::Exporter::Zipkin::Exporter.new(endpoint: 'http://localhost:9411/api/v2/spans' )
)

OpenTelemetry::SDK.configure do |c|
  c.use 'OpenTelemetry::Instrumentation::Rails'
  c.add_span_processor(span_processor)
  c.service_name = 'st'
  c.service_version = '0.1.0'
end