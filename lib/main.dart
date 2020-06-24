import 'dart:convert';
import 'API.dart';
import 'Users.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyListScreen(),
    );
  }
}

class MyListScreen extends StatefulWidget {
  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State {
  var users = new List<User>();
  var selectedList = new List<User>();
  var isSelected = false;
  var myColor= Colors.white;




  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: getAppBar(),
        body: ListView.builder(
          itemCount: users.length,
//          separatorBuilder: (context,index)=>Divider(
//            color: Colors.lightGreen,
//          ),

          itemBuilder: (context, index) {
            return Card(
              color:  myColor,
              child: ListTile(
                //selected: isSelected,

                title: Text('${users[index].name}'),
                subtitle:  Text('${users[index].email}'),

               onLongPress: (){
                  users.remove(users[index]);
                  setState(() {

                  });
               },

              ),
            );
          },
        ));
  }

//  void toggleSelection(context,index){
//
//  setState(() {
//   if(isSelected){
//       myColor = Colors.white;
//       selectedList.remove(users[index]);
//       isSelected=false;
//   }else{
//     selectedList.add(users[index]);
//     myColor= Colors.grey[300];
//     isSelected=true;
//   }
//
//  });
//  }

   getAppBar(){
    return AppBar(
      title: Text("User list"),
      leading:
          IconButton(
            icon: Icon(
                //selectedList.length<1 ?
            Icons.star),
                    //: Icons.delete),
            onPressed: (){

            },

          )


    );
  }
}