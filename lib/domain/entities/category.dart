class CropEntity {

  final String name;
  final String id;


  CropEntity({
    required this.name,
    required this.id,
  });

  @override
  String toString() {
    return name; // Ensure dropdown displays crop.name
  }

}