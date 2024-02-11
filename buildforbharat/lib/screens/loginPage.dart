import 'package:flutter/material.dart';

import 'homePage.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = TextEditingController(text: "setup@gmail.com");
  TextEditingController passwordController = TextEditingController(text: "123456");
  bool loading = false;
  goTSuccess(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return MyHomePage();
    }));
  }
  _login(){
    setState(() {
      loading = true;
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      if(userController.text == "setup@gmail.com" && passwordController.text == "123456"){
        goTSuccess();
      }else{
        showInSnackBar("Please enter correct credentials");
      }
      setState(() {
        loading = false;
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
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("BFB Hackathon Config",style: Theme.of(context).textTheme.headlineLarge,),
                Text("Environment setup",style: Theme.of(context).textTheme.headlineSmall,),
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
                      }, child: !loading?Text("Login"):CircularProgressIndicator()),
                ),
                const Spacer()
            ],),
          ),
        ),
      ),
    );
  }
}
