// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_meals.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayMealsAdapter extends TypeAdapter<DayMeals> {
  @override
  final int typeId = 0;

  @override
  DayMeals read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DayMeals(
      identifiant: fields[0] as String?,
      day: fields[1] as String,
      listOfMeals: (fields[2] as List).cast<Meal>(),
    );
  }

  @override
  void write(BinaryWriter writer, DayMeals obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.identifiant)
      ..writeByte(1)
      ..write(obj.day)
      ..writeByte(2)
      ..write(obj.listOfMeals);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayMealsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
