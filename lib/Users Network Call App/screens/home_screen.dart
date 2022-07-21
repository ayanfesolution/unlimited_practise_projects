import 'package:flutter/material.dart';
import 'package:my_practise_projects/Users%20Network%20Call%20App/model/person.dart';
import 'package:my_practise_projects/Users%20Network%20Call%20App/services/person_network_services.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final PersonNetworkService personService = PersonNetworkService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Network API Users'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1352&q=80"),
                fit: BoxFit.cover)
        ),
        child: SafeArea(
          child: FutureBuilder(
            future: personService.fetchPersons(25),
            builder: (BuildContext context, AsyncSnapshot<List<Person>> snapshot) {
              if (snapshot.hasData) {
                return Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: (BuildContext context, int index) {
                                 var currentPerson = snapshot.data?[index];
                                return ListTile(
                                  isThreeLine: true,
                                    title: Text(currentPerson!.fullName),
                                  subtitle: Text(currentPerson.phoneNumber),
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(currentPerson.imageUrl),
                                  ),
                  );
                }),
                        ),
                      )
              ],
            );}
            if (snapshot.hasError) {
              return Center(
                child: Icon(Icons.error, color: Colors.red, size: 82.0,),
              );
            }

            return Center(
              child: Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Loading at the moment, please hold the line')
                ],
              ),
            );
             }
            ),
          ),
        ),
      );
    }
  }

