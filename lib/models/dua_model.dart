part of 'models.dart';

List<Dua> duaFromJson(String str) =>
    List<Dua>.from(json.decode(str).map((x) => Dua.fromJson(x)));

String duaToJson(List<Dua> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// A model representing an Dua. It extends [Equatable]
/// to make comparisions between two objects easier based
/// on their [id]
class Dua extends Equatable {
  Dua({
    this.id,
    this.dua,
    this.translation,
    this.reference,
  });

  /// unique id for an Dua useful for comparision
  final String id;

  /// arabic text of Dua
  final String dua;

  /// translation of Dua
  final String translation;

  /// reference for Dua
  final String reference;

  /// convert json map to an [Dua] object
  factory Dua.fromJson(Map<String, dynamic> json) => Dua(
        id: json["id"],
        dua: json["dua"],
        translation: json["translation"],
        reference: json["reference"],
      );

  /// convert [Dua] object to json map
  Map<String, dynamic> toJson() => {
        "id": id,
        "dua": Dua,
        "translation": translation,
        "reference": reference,
      };

  @override
  List<Object> get props => [id];

  @override
  String toString() {
    return "$dua\n\n$translation\n\n$reference";
  }
}
