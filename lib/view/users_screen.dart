import 'dart:convert';

import 'package:api_last_demo/controller/API%20MANGER/api_manager.dart';
import 'package:api_last_demo/model/user_detail_model.dart';
import 'package:flutter/material.dart';


class UsersScreen extends StatefulWidget {


  

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {



  @override
  void initState() {    
    super.initState();
    fetchUsers();
  }

List<UserDetailModel>? finalData;

  fetchUsers()async{
     var data = await ApiManager.getUser();
    finalData =  userDetailModelFromJson(jsonEncode(data));
     print(finalData);
     setState(() {
       
     });
    // print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          fetchUsers();
          // print(data);
        },
      ),
      appBar: AppBar(
        title: Text("Users"),
        centerTitle: true,
      ),
      body: finalData == null ? Center(child: CircularProgressIndicator.adaptive(),) : ListView.builder( 
        itemCount: finalData!.length,
         itemBuilder: (context,index){
          return Card(child: ListTile(
            leading: CircleAvatar(child: Text("${finalData![index].id}",style: TextStyle(fontSize: 30),),),
            subtitle: Text("${finalData![index].email}"),
            // trailing: Text("${1}"),
            trailing: Text("${finalData![index].phone}"),
            title: Text("${finalData![index].name}",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,

            ),),
          ));
      } ),
    );
  }
}




