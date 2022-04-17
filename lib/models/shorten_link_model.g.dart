// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shorten_link_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShortenLinkAdapter extends TypeAdapter<ShortenLink> {
  @override
  final int typeId = 0;

  @override
  ShortenLink read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShortenLink(
      fullShortLink: fields[2] as String,
      code: fields[0] as String,
      originalLink: fields[9] as String,
      fullShortLink2: fields[4] as String,
      fullShareLink: fields[8] as String,
      fullShortLink3: fields[6] as String,
      shareLink: fields[7] as String,
      shortLink: fields[1] as String,
      shortLink2: fields[3] as String,
      shortLink3: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ShortenLink obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.shortLink)
      ..writeByte(2)
      ..write(obj.fullShortLink)
      ..writeByte(3)
      ..write(obj.shortLink2)
      ..writeByte(4)
      ..write(obj.fullShortLink2)
      ..writeByte(5)
      ..write(obj.shortLink3)
      ..writeByte(6)
      ..write(obj.fullShortLink3)
      ..writeByte(7)
      ..write(obj.shareLink)
      ..writeByte(8)
      ..write(obj.fullShareLink)
      ..writeByte(9)
      ..write(obj.originalLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShortenLinkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
