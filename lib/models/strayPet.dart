class StrayPet {
  String name;
  int age;
  String sex;
  int status;
  int type;
  double latitude;
  double longitude;
  String color;
  String? nature;

  StrayPet(
      {required this.name,
      required this.age,
      required this.sex,
      required this.status,
      required this.latitude,
      required this.longitude,
      required this.type,
      required this.color,
      this.nature});
}
