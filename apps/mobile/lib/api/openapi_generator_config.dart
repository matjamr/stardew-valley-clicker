// Openapi Generator last run: : 2025-11-03T19:35:13.499471
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
  additionalProperties: DioProperties(
    pubName: 'stardew_valley_api',
    pubAuthor: 'Mateusz Jamroz',
  ),
  inputSpec: InputSpec(path: 'assets/openapi/schema.yaml'),
  generatorName: Generator.dio,
  runSourceGenOnOutput: true,
  outputDirectory: 'api/stardew_valley_api',
)
class Example {}