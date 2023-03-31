import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_migrate/components/CustomButton.dart';
import 'package:i_migrate/views/GreetingView.dart';

class Register extends StatelessWidget {
  Function onClick;
  Function onRegister;
  Function toLogin;
  Register(
      {super.key,
      required this.onClick,
      required this.onRegister,
      required this.toLogin});

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

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
                "Sing up",
                style: TextStyle(
                    fontSize: 38,
                    fontFamily: "Alegreya Sans",
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.visible),
              ),
              SizedBox(
                height: 15,
              ),
              Text("Let's create your account",
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
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(borderSide: BorderSide()),
                      labelText: "  Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
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
                if (_formKey.currentState!.validate()) {
                  onRegister(
                    {
                      'name': nameController.text,
                      'email': emailController.text,
                      'password': passwordController.text
                    },
                  );
                  Get.to(GreetingView());
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill input')),
                  );
                }
              },
              text: "Register"),
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
                "Already have an account?",
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
                onTap: () => toLogin(),
                child: Text(
                  "Sing In",
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
    )
        // Form(
        //   key: _formKey,
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         const Text("Register",
        //             style: TextStyle(
        //               fontSize: 35,
        //               color: Color.fromARGB(255, 47, 44, 44),
        //               fontWeight: FontWeight.w900,
        //               fontStyle: FontStyle.normal,
        //               letterSpacing: 8,
        //               wordSpacing: 20,
        //             )),
        //         Padding(
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        //           child: TextFormField(
        //             controller: nameController,
        //             decoration: const InputDecoration(
        //                 border: OutlineInputBorder(), labelText: "Name"),
        //             validator: (value) {
        //               if (value == null || value.isEmpty) {
        //                 return 'Please enter your name';
        //               }
        //               return null;
        //             },
        //           ),
        //         ),
        //         Padding(
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        //           child: TextFormField(
        //             controller: emailController,
        //             decoration: const InputDecoration(
        //                 border: OutlineInputBorder(), labelText: "Email"),
        //             validator: (value) {
        //               if (value == null || value.isEmpty) {
        //                 return 'Please enter your email';
        //               }
        //               if (!value.contains('@gmail.com')) {
        //                 return 'Please enter your valid email address';
        //               }
        //               return null;
        //             },
        //           ),
        //         ),
        //         Padding(
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        //           child: TextFormField(
        //             controller: passwordController,
        //             obscureText: true,
        //             decoration: const InputDecoration(
        //                 border: OutlineInputBorder(), labelText: "Password"),
        //             validator: (value) {
        //               if (value == null || value.isEmpty) {
        //                 return 'Please enter your password';
        //               }
        //               return null;
        //             },
        //           ),
        //         ),
        //         Padding(
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
        //           child: Center(
        //             child: ElevatedButton(
        //               onPressed: () {
        //                 if (_formKey.currentState!.validate()) {
        //                   onRegister(
        //                     {
        //                       'name': nameController.text,
        //                       'email': emailController.text,
        //                       'password': passwordController.text
        //                     },
        //                   );
        //                 } else {
        //                   ScaffoldMessenger.of(context).showSnackBar(
        //                     const SnackBar(content: Text('Please fill input')),
        //                   );
        //                 }
        //               },
        //               child: const Text('Register'),
        //             ),
        //           ),
        //         ),
        //         GestureDetector(
        //           onTap: () {
        //             toLogin();
        //           },
        //           child: Text('Login'),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}
