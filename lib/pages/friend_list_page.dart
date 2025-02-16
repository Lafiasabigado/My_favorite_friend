import 'package:flutter/material.dart';
import 'friend_page.dart';
import 'person_dart.dart';

class FriendListPage extends StatefulWidget {
  const FriendListPage({super.key});

  @override
  State<FriendListPage> createState() => _FriendListPageState();
}

class _FriendListPageState extends State<FriendListPage> {
  String name = "";
  bool liked = false;
  List<Person> persons = [
    Person(name: "ATCHO", surname: "Iovann", birthDate: "26/02/2005", sex: "M"),
    Person(name: "DOE", surname: "JOHN", birthDate: "26/02/2005", sex: "M"),
    Person(name: "ROLO", surname: "Junior", birthDate: "26/02/2005", sex: "M"),
    Person(
        name: "AGBALANDA",
        surname: "Sinella",
        birthDate: "26/02/2005",
        sex: "M"),
    Person(name: "DOCO", surname: "Jack", birthDate: "26/02/2005", sex: "M"),
    Person(name: "BOCCO", surname: "Beline", birthDate: "26/02/2005", sex: "M"),
    Person(name: "Jane", surname: "KIOTO", birthDate: "26/02/2005", sex: "M"),
  ];
  List<Person> friends = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Favorite Friend"),
          actions: [
            IconButton(
                onPressed: () async {
                Person person= await  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FriendPage(
                           friends: friends,
                        ),
                      ));
                print(person.name);
                friends.remove(person);
                setState(() {

                });
                },
                icon: Icon(Icons.favorite))
          ],
        ),
        body: ListView(
          children: persons
              .map((person) => ListTile(
                    title: Text("${person.name} ${person.surname}"),
                    subtitle: Text("Bonjour comment vas-tu?"),
                    leading: CircleAvatar(),
                    trailing: Icon(
                      Icons.favorite,
                      color: checkIfExists(person) ? Colors.red : Colors.black,
                    ),
                    onTap: () {
                      addFriend(person);
                      setState(() {});
                    },
                  ))
              .toList(),
        ));
  }

  bool checkIfExists(Person person) {
    return friends.contains(person);
  }

  void addFriend(Person person) {
    if (!checkIfExists(person)) {
      friends.add(person);
    } else {
      friends.remove(person);
    }
  }

}
