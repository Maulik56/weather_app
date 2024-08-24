import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'weather.g.dart';

abstract class Weather implements Built<Weather, WeatherBuilder> {
  static Serializer<Weather> get serializer => _$weatherSerializer;

  @BuiltValueField(wireName: 'dt_txt')
  String? get date; // Make the date nullable

  Main get main;
  BuiltList<WeatherDescription> get weatherDescriptions;

  Weather._();
  factory Weather([void Function(WeatherBuilder) updates]) = _$Weather;
}

abstract class Main implements Built<Main, MainBuilder> {
  static Serializer<Main> get serializer => _$mainSerializer;

  double get temp;

  Main._();
  factory Main([void Function(MainBuilder) updates]) = _$Main;
}

abstract class WeatherDescription implements Built<WeatherDescription, WeatherDescriptionBuilder> {
  static Serializer<WeatherDescription> get serializer => _$weatherDescriptionSerializer;

  String get description;

  WeatherDescription._();
  factory WeatherDescription([void Function(WeatherDescriptionBuilder) updates]) =
      _$WeatherDescription;
}
