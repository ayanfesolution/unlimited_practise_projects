import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_practise_projects/Users%20Network%20Call%20App/model/person.dart';

const String randomPersonUrl = "https://randomuser.me/api/";

class PersonNetworkService {
  Future<List<Person>> fetchPersons(int amount) async {
    var url = Uri.parse("$randomPersonUrl?results=$amount");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      Map peopleData = jsonDecode(response.body);
      List<dynamic> peoples = peopleData["results"];
      return peoples.map((json) => Person.fromJson(json)).toList();
    } else {
      throw Exception("Something gone wrong, ${response.statusCode}");
    }
  }
}