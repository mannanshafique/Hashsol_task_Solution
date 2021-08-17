// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DatumAdapter extends TypeAdapter<Datum> {
  @override
  final int typeId = 0;

  @override
  Datum read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Datum(
      id: fields[0] as int?,
      unitId: fields[1] as dynamic,
      code: fields[2] as String?,
      name: fields[3] as String?,
      featuredImage: fields[4] as dynamic,
      price: fields[5] as String?,
      weight: fields[6] as dynamic,
      description: fields[7] as dynamic,
      isFeatured: fields[8] as int?,
      customizeBox: fields[9] as int?,
      status: fields[10] as int?,
      createdBy: fields[11] as int?,
      updatedBy: fields[12] as int?,
      deletedAt: fields[13] as dynamic,
      createdAt: fields[14] as DateTime?,
      updatedAt: fields[15] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Datum obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.unitId)
      ..writeByte(2)
      ..write(obj.code)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.featuredImage)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.weight)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.isFeatured)
      ..writeByte(9)
      ..write(obj.customizeBox)
      ..writeByte(10)
      ..write(obj.status)
      ..writeByte(11)
      ..write(obj.createdBy)
      ..writeByte(12)
      ..write(obj.updatedBy)
      ..writeByte(13)
      ..write(obj.deletedAt)
      ..writeByte(14)
      ..write(obj.createdAt)
      ..writeByte(15)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
