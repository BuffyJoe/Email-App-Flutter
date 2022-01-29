class ContactModel {
  final String name;
  final String email;
  final String photo;
  bool selected;

  ContactModel(
      {required this.name,
      required this.email,
      required this.photo,
      this.selected: false});
}
