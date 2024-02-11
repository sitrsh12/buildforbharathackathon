import 'package:buildforbharat_buyer_app/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = TextEditingController(text: "buyer@gmail.com");
  TextEditingController passwordController = TextEditingController(text: "123456");
  bool loading = false;
  goTSuccess(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return DashboardScreen();
    }));
  }
  _login(){
    Future.delayed(const Duration(milliseconds: 500), () {
      goTSuccess();
    });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SizedBox(
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("BFB Hackathon Buyer",style: Theme.of(context).textTheme.headlineLarge,),
                    Text("Buyer Setup",style: Theme.of(context).textTheme.headlineSmall,),
                    Image.asset("assets/images/buildforbharat.png"),
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
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                        ),
                          onPressed:(){
                            _login();
                          }, child: const Text("Login", style: TextStyle(color: Colors.white),)),
                    ),
                    const Spacer()
                ],),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
