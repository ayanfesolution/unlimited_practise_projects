class Person {
  String fullName;
  String phoneNumber;
  String imageUrl;

  Person({required this.fullName, required this.phoneNumber, required this.imageUrl});

  Person.fromJson(Map<String, dynamic> json)
      : fullName = "${json["name"]["title"]} ${json["name"]["first"]} ${json["name"]["last"]}",
        phoneNumber = json["phone"],
        imageUrl = json["picture"]["thumbnail"];
}