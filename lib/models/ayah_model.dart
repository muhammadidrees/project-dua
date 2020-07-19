part of 'models.dart';

List<Ayah> ayahFromJson(String str) =>
    List<Ayah>.from(json.decode(str).map((x) => Ayah.fromJson(x)));

String ayahToJson(List<Ayah> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// A model representing an ayah. It extends [Equatable]
/// to make comparisions between two objects easier based
/// on their [id]
class Ayah extends Equatable {
  Ayah({
    this.id,
    this.ayah,
    this.translation,
    this.reference,
  });

  /// unique id for an ayah useful for comparision
  final String id;

  /// arabic text of ayah
  final String ayah;

  /// translation of ayah
  final String translation;

  /// reference for ayah
  final String reference;

  /// convert json map to an [Ayah] object
  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        id: json["id"],
        ayah: json["ayah"],
        translation: json["translation"],
        reference: json["reference"],
      );

  /// convert [Ayah] object to json map
  Map<String, dynamic> toJson() => {
        "id": id,
        "ayah": ayah,
        "translation": translation,
        "reference": reference,
      };

  @override
  List<Object> get props => [id];
}
