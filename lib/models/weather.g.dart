// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Weather> _$weatherSerializer = new _$WeatherSerializer();
Serializer<Main> _$mainSerializer = new _$MainSerializer();
Serializer<WeatherDescription> _$weatherDescriptionSerializer =
    new _$WeatherDescriptionSerializer();

class _$WeatherSerializer implements StructuredSerializer<Weather> {
  @override
  final Iterable<Type> types = const [Weather, _$Weather];
  @override
  final String wireName = 'Weather';

  @override
  Iterable<Object?> serialize(Serializers serializers, Weather object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'main',
      serializers.serialize(object.main, specifiedType: const FullType(Main)),
      'weatherDescriptions',
      serializers.serialize(object.weatherDescriptions,
          specifiedType: const FullType(
              BuiltList, const [const FullType(WeatherDescription)])),
    ];
    Object? value;
    value = object.date;
    if (value != null) {
      result
        ..add('dt_txt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Weather deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeatherBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'dt_txt':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'main':
          result.main.replace(serializers.deserialize(value,
              specifiedType: const FullType(Main))! as Main);
          break;
        case 'weatherDescriptions':
          result.weatherDescriptions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(WeatherDescription)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$MainSerializer implements StructuredSerializer<Main> {
  @override
  final Iterable<Type> types = const [Main, _$Main];
  @override
  final String wireName = 'Main';

  @override
  Iterable<Object?> serialize(Serializers serializers, Main object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'temp',
      serializers.serialize(object.temp, specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  Main deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MainBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'temp':
          result.temp = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherDescriptionSerializer
    implements StructuredSerializer<WeatherDescription> {
  @override
  final Iterable<Type> types = const [WeatherDescription, _$WeatherDescription];
  @override
  final String wireName = 'WeatherDescription';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, WeatherDescription object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  WeatherDescription deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeatherDescriptionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Weather extends Weather {
  @override
  final String? date;
  @override
  final Main main;
  @override
  final BuiltList<WeatherDescription> weatherDescriptions;

  factory _$Weather([void Function(WeatherBuilder)? updates]) =>
      (new WeatherBuilder()..update(updates))._build();

  _$Weather._(
      {this.date, required this.main, required this.weatherDescriptions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(main, r'Weather', 'main');
    BuiltValueNullFieldError.checkNotNull(
        weatherDescriptions, r'Weather', 'weatherDescriptions');
  }

  @override
  Weather rebuild(void Function(WeatherBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherBuilder toBuilder() => new WeatherBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Weather &&
        date == other.date &&
        main == other.main &&
        weatherDescriptions == other.weatherDescriptions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, main.hashCode);
    _$hash = $jc(_$hash, weatherDescriptions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Weather')
          ..add('date', date)
          ..add('main', main)
          ..add('weatherDescriptions', weatherDescriptions))
        .toString();
  }
}

class WeatherBuilder implements Builder<Weather, WeatherBuilder> {
  _$Weather? _$v;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  MainBuilder? _main;
  MainBuilder get main => _$this._main ??= new MainBuilder();
  set main(MainBuilder? main) => _$this._main = main;

  ListBuilder<WeatherDescription>? _weatherDescriptions;
  ListBuilder<WeatherDescription> get weatherDescriptions =>
      _$this._weatherDescriptions ??= new ListBuilder<WeatherDescription>();
  set weatherDescriptions(
          ListBuilder<WeatherDescription>? weatherDescriptions) =>
      _$this._weatherDescriptions = weatherDescriptions;

  WeatherBuilder();

  WeatherBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _main = $v.main.toBuilder();
      _weatherDescriptions = $v.weatherDescriptions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Weather other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Weather;
  }

  @override
  void update(void Function(WeatherBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Weather build() => _build();

  _$Weather _build() {
    _$Weather _$result;
    try {
      _$result = _$v ??
          new _$Weather._(
              date: date,
              main: main.build(),
              weatherDescriptions: weatherDescriptions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'main';
        main.build();
        _$failedField = 'weatherDescriptions';
        weatherDescriptions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Weather', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Main extends Main {
  @override
  final double temp;

  factory _$Main([void Function(MainBuilder)? updates]) =>
      (new MainBuilder()..update(updates))._build();

  _$Main._({required this.temp}) : super._() {
    BuiltValueNullFieldError.checkNotNull(temp, r'Main', 'temp');
  }

  @override
  Main rebuild(void Function(MainBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MainBuilder toBuilder() => new MainBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Main && temp == other.temp;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, temp.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Main')..add('temp', temp)).toString();
  }
}

class MainBuilder implements Builder<Main, MainBuilder> {
  _$Main? _$v;

  double? _temp;
  double? get temp => _$this._temp;
  set temp(double? temp) => _$this._temp = temp;

  MainBuilder();

  MainBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _temp = $v.temp;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Main other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Main;
  }

  @override
  void update(void Function(MainBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Main build() => _build();

  _$Main _build() {
    final _$result = _$v ??
        new _$Main._(
            temp: BuiltValueNullFieldError.checkNotNull(temp, r'Main', 'temp'));
    replace(_$result);
    return _$result;
  }
}

class _$WeatherDescription extends WeatherDescription {
  @override
  final String description;

  factory _$WeatherDescription(
          [void Function(WeatherDescriptionBuilder)? updates]) =>
      (new WeatherDescriptionBuilder()..update(updates))._build();

  _$WeatherDescription._({required this.description}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        description, r'WeatherDescription', 'description');
  }

  @override
  WeatherDescription rebuild(
          void Function(WeatherDescriptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherDescriptionBuilder toBuilder() =>
      new WeatherDescriptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherDescription && description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeatherDescription')
          ..add('description', description))
        .toString();
  }
}

class WeatherDescriptionBuilder
    implements Builder<WeatherDescription, WeatherDescriptionBuilder> {
  _$WeatherDescription? _$v;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  WeatherDescriptionBuilder();

  WeatherDescriptionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeatherDescription other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherDescription;
  }

  @override
  void update(void Function(WeatherDescriptionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherDescription build() => _build();

  _$WeatherDescription _build() {
    final _$result = _$v ??
        new _$WeatherDescription._(
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'WeatherDescription', 'description'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
