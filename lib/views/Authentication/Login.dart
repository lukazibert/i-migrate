import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_migrate/controllers/NavigationController.dart';

import '../../components/CustomButton.dart';

class Login extends StatelessWidget {
  Function onClick;
  Function onLogin;
  List<Map> regiterdUsers;
  Function toRegister;
  Login({
    super.key,
    required this.regiterdUsers,
    required this.toRegister,
    required this.onLogin,
    required this.onClick,
  });
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final navigationController = Get.put(NavigationController());
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 150),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sing In",
                style: TextStyle(
                    fontSize: 38,
                    fontFamily: "Alegreya Sans",
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.visible),
              ),
              SizedBox(
                height: 15,
              ),
              Text("Let us help make the immigration journey easier for you",
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Alegreya Sans",
                      // fontWeight: FontWeight.w500,
                      overflow: TextOverflow.visible)),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(borderSide: BorderSide()),
                      labelText: "  Email Address"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@gmail.com')) {
                      return 'Please enter your valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(borderSide: BorderSide()),
                      labelText: "  Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            child: Text("Forgot Password?",
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[400],
                    fontFamily: "Alegreya Sans",
                    // fontWeight: FontWeight.w500,
                    overflow: TextOverflow.visible)),
          ),
          SizedBox(
            height: 40,
          ),
          CustomButton(
              onTap: () {
                print(regiterdUsers);
                if (_formKey.currentState!.validate()) {
                  // Navigate the user to the Home page
                  bool currectEmailPassword = regiterdUsers.any((e) {
                    return e['email'] == emailController.text &&
                        e['password'] == passwordController.text;
                  });
                  print(currectEmailPassword);
                  if (currectEmailPassword) {
                    onLogin();
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill input')),
                  );
                }
              },
              text: "LOGIN"),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: (() => {}),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "lib/assets/Icons/logo googleg 48dp.png",
                    width: 30.0,
                    height: 30.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text("Continue wit Google",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: "Alegreya Sans",
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.visible)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Alegreya Sans",
                    // fontWeight: FontWeight.w500,
                    overflow: TextOverflow.visible),
              ),
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () => toRegister(),
                child: Text(
                  "Sing Up",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Alegreya Sans",
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.visible),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
