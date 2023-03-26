import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/model/data.dart';
import '../../core/model/fetch_data.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // void initState() {
  //   Provider.of<Fetch>(context,listen: false).fetchAccount()
  //   super.initState();
  // }
  bool _isInit =true;
  bool _isLoading =false;
     @override
   void didChangeDependencies() {
     super.didChangeDependencies();
    if (_isInit) {
      setState(() {

        _isLoading = true;
      });
      Provider.of<Fetch>(context,listen: false).fetchAccount()
          .then((_) {
        setState(() {


          _isLoading = false;
        });
      });
    }
   }
  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();
    final username = TextEditingController();

    DatabaseReference ref = FirebaseDatabase.instance.ref();
  List<Data> dataNow= Provider.of<Fetch>(context,listen: false).data;
        return Scaffold(
      appBar: AppBar(title:const Text("Home",style: TextStyle(color:Colors.amber),)),
      body:
      _isLoading?
Text("-----")
      :
 Column(
      children: [
TextFormField(
  controller: email
  ,),
  TextFormField(
  controller: password
  ,),
  TextFormField(
  controller: username
  ,),  TextButton(child:const Text("create"),onPressed: () async{

  await Fetch().addAccount(email.text,password.text,username.text);

// await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text) ;

},),
  Text(dataNow.length.toString()),
  Text(dataNow[1].password),
  Text(dataNow[1].username),

        ],
      )
    );
  }
}