import 'package:flutter/material.dart';
import 'package:flutter_fire/core/services/firebase_service.dart';
import 'package:flutter_fire/model/students.dart';
import 'package:flutter_fire/model/user.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  FirebaseService service;

  @override
  void initState() {
    super.initState();
    service = FirebaseService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: studentBuilder,
    );
  }

  Widget get userBuilder {
    return FutureBuilder<List<User>>(
      future: service.getUsers(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            if (snapshot.hasData)
              return _listUser(snapshot.data);
            else
              return _notFoundWidget;
            break;
          default:
            return _waitingWidget;
        }
      },
    );
  }

  Widget get studentBuilder {
    return FutureBuilder<List<Students>>(
      future: service.getStudents(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            if (snapshot.hasData)
              return _listStudent(snapshot.data);
            else
              return _notFoundWidget;
            break;
          default:
            return _waitingWidget;
        }
      },
    );
  }

  Widget _listStudent(List<Students> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        var item = list[index];
        return _studentCard(item);
      },
    );
  }

  Widget _studentCard(Students student) {
    return Card(
      child: ListTile(
        title: Text(student.name),
        subtitle: Text(student.surname),
      ),
    );
  }

  Widget _listUser(List<User> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        var item = list[index];
        return _userCard(item);
      },
    );
  }

  Widget _userCard(User user) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(user.name),
        ),
      ),
    );
  }

  Widget get _notFoundWidget => Center(child: Text("Not Found"));
  Widget get _waitingWidget => Center(child: CircularProgressIndicator());
}
