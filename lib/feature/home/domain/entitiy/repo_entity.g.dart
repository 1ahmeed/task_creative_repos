// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RepoEntityAdapter extends TypeAdapter<RepoEntity> {
  @override
  final int typeId = 0;

  @override
  RepoEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RepoEntity(
      nameRepo: fields[0] as String?,
      isFork: fields[3] as bool?,
      htmlUrl: fields[4] as String?,
      descriptionRepo: fields[1] as String?,
      userNameOfRepo: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RepoEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.nameRepo)
      ..writeByte(1)
      ..write(obj.descriptionRepo)
      ..writeByte(2)
      ..write(obj.userNameOfRepo)
      ..writeByte(3)
      ..write(obj.isFork)
      ..writeByte(4)
      ..write(obj.htmlUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepoEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
