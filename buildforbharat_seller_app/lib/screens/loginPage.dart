import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:flutter/material.dart';


import 'homePage.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  fieldFocus(BuildContext context, FocusNode currentNode, FocusNode nextFocus){
      currentNode.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
  }
  bool isValidPassword = false;
  bool isLoading = false;
  TextEditingController userController = TextEditingController(text: "seller@gmail.com");
  TextEditingController passwordController = TextEditingController(text: "123456");
  goTSuccess(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return MyHomePage();
    }));
  }
  _login(){
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      if(userController.text == "seller@gmail.com" && passwordController.text == "123456"){
        goTSuccess();
      }else{
        showInSnackBar("Please enter correct credentials");
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Center(child: Text(value)
          ),
        )
    );
  }
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body:
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("BFB Hackathon Seller",style: Theme.of(context).textTheme.headlineLarge,),
                Text("Seller setup",style: Theme.of(context).textTheme.headlineSmall,),
                Image.asset("assets/images/buildforbharat.png",),
                const Spacer(),
                TextFormField(
                    controller: userController,
                    cursorColor: Colors.lightGreen,
                    keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: "Username",
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  cursorColor: Colors.lightGreen,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: "Password",
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: width,
                  child: ElevatedButton(
                      onPressed:(){
                        _login();
                      }, child: !isLoading?const Text("Login"):const CircularProgressIndicator()),
                ),
                const Spacer()
            ],),
          ),
        ),
      ),
    );
  }
}
