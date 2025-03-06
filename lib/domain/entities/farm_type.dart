class FarmTypeEntity {

  final String name;
  final String id;


  FarmTypeEntity({
    required this.name,
    required this.id,
  });

  @override
  String toString() {
    return name; // Ensure dropdown displays crop.name
  }

}