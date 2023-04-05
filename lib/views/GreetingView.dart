import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_migrate/components/CustomButton.dart';
import 'package:i_migrate/main.dart';
import 'package:i_migrate/views/ProfileView.dart';

import '../controllers/ProfileViewController.dart';
import 'InterviewView.dart';

final profileController = Get.put(ProfileViewController());

class GreetingView extends StatelessWidget {
  const GreetingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 150, horizontal: 40),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  // color: Colors.amber,
                  width: double.infinity,
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 38,
                        fontFamily: "Alegreya Sans",
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.visible),
                  ),
                ),
                Container(
                  // color: Colors.amber,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      profileController.userData["name"].toString(),
                      style: TextStyle(
                          fontSize: 32,
                          fontFamily: "Alegreya Sans",
                          // fontWeight: FontWeight.w700,
                          overflow: TextOverflow.visible),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 150,
            ),
            Text(
              "Thank you for trusting us to help you with you migration experience",
              style: TextStyle(
                  fontSize: 28,
                  fontFamily: "Alegreya Sans",
                  // fontWeight: FontWeight.w700,
                  overflow: TextOverflow.visible),
            ),
            SizedBox(
              height: 150,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: GestureDetector(
                      onTap: (() => Get.to(() => InterviewView())),
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Color(0xFF4F7E93),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Center(
                            child: Text("Start interview",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontFamily: "Alegreya Sans",
                                    fontWeight: FontWeight.w300,
                                    overflow: TextOverflow.visible))),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: (() {
                    Get.to(() => MainView());
                  }),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        border: Border.all(
                          color: Color(0xFFC8C8C8),
                          width: 2,
                        )),
                    child: Center(
                      child: Text(
                        "Explore",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 28,
                            fontFamily: "Alegreya Sans",
                            fontWeight: FontWeight.w300,
                            overflow: TextOverflow.visible),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "For a more personalised experience you can answer some questions about yourself or skip that and just explore the app first",
              style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 20,
                  fontFamily: "Alegreya Sans",
                  fontWeight: FontWeight.w200,
                  overflow: TextOverflow.visible),
            )
          ],
        ),
      ),
    );
  }
}
