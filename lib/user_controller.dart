import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:getx_demo/user.dart';
import 'dart:convert';


class UserController extends GetxController{
  var isLoading=true.obs;
  var users=<User>[].obs;
  @override
  void onInit()
  {
    super.onInit();
    fetUsers();
  }
  
  void fetUsers()async{
    try{
      isLoading(true);
      var response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1/comments'));
      if(response.statusCode==200){
        var data=json.decode(response.body)as List;
        users.value=data.map((e) => User(id: e['id'],name: e['name'],email: e['email'],)
        ).toList();
      }
    else{
      throw Exception('Failed to load users');
    }
    }//try
    finally{
      isLoading(false);
    }
  }
}