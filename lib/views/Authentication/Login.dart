import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_migrate/controllers/NavigationController.dart';

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
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Login",
                  style: TextStyle(
                    fontSize: 35,
                    color: Color.fromARGB(255, 47, 44, 44),
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 8,
                    wordSpacing: 20,
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
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
                    child: const Text('Login'),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  toRegister();
                },
                child: Text('Dont have account yet? Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
