// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StockDetailsAdapter extends TypeAdapter<StockDetails> {
  @override
  final int typeId = 1;

  @override
  StockDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StockDetails(
      name: fields[0] as String,
      quantity: fields[4] as int,
      profit: fields[5] as double,
      profitMargin: fields[7] as double,
      purchaseRate: fields[1] as double,
      qgst: fields[2] as int,
      salesRate: fields[6] as double,
      sgst: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, StockDetails obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.purchaseRate)
      ..writeByte(2)
      ..write(obj.qgst)
      ..writeByte(3)
      ..write(obj.sgst)
      ..writeByte(4)
      ..write(obj.quantity)
      ..writeByte(5)
      ..write(obj.profit)
      ..writeByte(6)
      ..write(obj.salesRate)
      ..writeByte(7)
      ..write(obj.profitMargin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StockDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
