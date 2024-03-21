// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PreferencesAdapter extends TypeAdapter<Preferences> {
  @override
  final int typeId = 1;

  @override
  Preferences read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Preferences(
      language: fields[0] as String?,
      theme: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Preferences obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.language)
      ..writeByte(1)
      ..write(obj.theme);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PreferencesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
