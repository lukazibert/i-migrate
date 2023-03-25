import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:i_migrate/components/CustomButton.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 15,
            left: 15,
            right: 15,
            bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset(
                  "lib/assets/Avatars/3d_avatar_1.png",
                  width: 200.0,
                  height: 200.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    "Afreen Khan",
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
                      fontSize: 20,
                      fontFamily: "Alegreya Sans",
                      fontWeight: FontWeight.w300,
                      overflow: TextOverflow.visible),
                ),
              ],
            ),
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
                CustomButton(onTap: () => {}, text: "Start Interview"),
              ],
            )
          ],
        ));
  }
}
