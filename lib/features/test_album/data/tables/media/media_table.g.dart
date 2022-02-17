// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MediaTableAdapter extends TypeAdapter<MediaTable> {
  @override
  final int typeId = 0;

  @override
  MediaTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MediaTable(
      id: fields[0] as String,
      fileName: fields[1] as String,
      size: fields[2] as int,
      thumbnailUrl: fields[3] as String,
      downloadUrl: fields[4] as String,
      createdAt: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, MediaTable obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fileName)
      ..writeByte(2)
      ..write(obj.size)
      ..writeByte(3)
      ..write(obj.thumbnailUrl)
      ..writeByte(4)
      ..write(obj.downloadUrl)
      ..writeByte(5)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
