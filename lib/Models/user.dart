class Person {
  String name;
  String? image;
  int? id = 0;
  int? prof_id_fk = 0;
  int? city_id_fk = 0;

  Person(
      {required this.name,
      this.image,
      this.id,
      this.prof_id_fk,
      this.city_id_fk});
}