
class User {
  String? fakeId;
  String name;
  String email;
  String alternativeEmail;
  String? personFakeId;
  bool firstLogin;

  User(
      {required this.fakeId,
      required this.name,
      required this.email,
      required this.alternativeEmail,
      required this.personFakeId,
      required this.firstLogin,
      });

  User.fromJson(Map<String, dynamic> json)
      : fakeId = json['fake_id'],
        name = json['name'],
        email = json['email'],
        alternativeEmail = json['alternative_email'],
        personFakeId = json['person_fake_id'],
        firstLogin = json['first_login'] == 1;
}
