import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:i_migrate/components/CustomButton.dart';
import 'package:i_migrate/views/InterviewView.dart';

import '../controllers/ProfileViewController.dart';

final profileController = Get.put(ProfileViewController());

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => profileController.userData["questionAndAnwsers"].isEmpty
        ? EmptyProfilePage()
        : ProfilePage());
  }
}

class ProfilePage extends StatelessWidget {
  ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List _questionAndAnwser =
        profileController.userData["questionAndAnwsers"];

    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 0),
      child: ListView(
        children: [
          UserInfo(),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              for (var i = 0; i < _questionAndAnwser.length; i++)
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  margin: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: Color(0xFFEFEFEF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 10),
                        child: Text(
                          _questionAndAnwser[i]["question"],
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontFamily: "Alegreya Sans",
                              fontWeight: FontWeight.w700,
                              overflow: TextOverflow.visible),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 3.0,
                        color: Color(0xFFCDCDCD),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          _questionAndAnwser[i]["anwser"],
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 24,
                              fontFamily: "Alegreya Sans",
                              fontWeight: FontWeight.w400,
                              overflow: TextOverflow.visible),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          CustomButton(
              onTap: () => {Get.to(InterviewView())},
              text: "Continue Interview"),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}

class EmptyProfilePage extends StatelessWidget {
  const EmptyProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            left: 15,
            right: 15,
            bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UserInfo(),
            Column(
              children: [
                Text(
                  "Tell us a bit about yourself!",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontFamily: "Alegreya Sans",
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.visible),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomButton(
                    onTap: () => Get.to(InterviewView()),
                    text: "Start Interview"),
              ],
            )
          ],
        ));
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "lib/assets/Avatars/3d_avatar_1.png",
          width: 200.0,
          height: 200.0,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            profileController.userData["name"] ?? "Luka",
            style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontFamily: "Alegreya Sans",
                fontWeight: FontWeight.w300,
                overflow: TextOverflow.visible),
          ),
        ),
        Text(
          "Mumbai, India",
          style: TextStyle(
              color: Colors.grey,
              fontSize: 24,
              fontFamily: "Alegreya Sans",
              fontWeight: FontWeight.w300,
              overflow: TextOverflow.visible),
        ),
      ],
    );
  }
}
