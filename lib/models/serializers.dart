import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'weather.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Weather,
  Main,
  WeatherDescription,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
