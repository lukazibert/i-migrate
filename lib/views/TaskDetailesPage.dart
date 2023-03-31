import 'package:flutter/material.dart';
import 'package:i_migrate/components/CustomAppBar.dart';
import 'package:i_migrate/components/cards/BulletPointCard.dart';

class TaskDetailsPage extends StatelessWidget {
  final String title;

  const TaskDetailsPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIcon: SizedBox(
          width: 28,
        ),
        title: title,
        tailIcon: SizedBox(
          width: 28,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xFFEFEFEF),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('How to complete the tasks:',
                            style: const TextStyle(
                                // overflow: TextOverflow.visible,
                                fontSize: 28,
                                fontFamily: "Alegreya Sans",
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        Text('1/4',
                            style: const TextStyle(
                                // overflow: TextOverflow.visible,
                                fontSize: 24,
                                fontFamily: "Alegreya Sans",
                                color: Colors.black)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                        'Gather the required documents: You will need to gather the necessary documents, including your passport, proof of acceptance at a German university, proof of financial means, proof of health insurance, and other supporting documents.',
                        style: const TextStyle(
                            // overflow: TextOverflow.visible,
                            fontSize: 24,
                            fontFamily: "Alegreya Sans",
                            color: Colors.black)),
                    SizedBox(height: 15),
                    Text(
                        'Make an appointment: You need to make an appointment at the German embassy or consulate in your home country to apply for a student visa. You can usually do this online or by phone.',
                        style: const TextStyle(
                            // overflow: TextOverflow.visible,
                            fontSize: 24,
                            fontFamily: "Alegreya Sans",
                            color: Colors.black)),
                    SizedBox(height: 15),
                    Text(
                        'Attend the visa appointment: You need to attend your visa appointment and provide all the necessary documents. The visa officer may ask you questions about your plans in Germany, your financial means, and your ties to your home country',
                        style: const TextStyle(
                            // overflow: TextOverflow.visible,
                            fontSize: 24,
                            fontFamily: "Alegreya Sans",
                            color: Colors.black)),
                  ],
                ),

                // SizedBox(height: 40),
                // Center(
                //   child: Text(
                //     title,
                //     style: TextStyle(
                //       fontSize: 24,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                // SizedBox(height: 20),
                // Card(
                //   color: Color(0xFFE5E5E5),
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           'How to complete the tasks:',
                //           style: TextStyle(
                //               fontSize: 18, fontWeight: FontWeight.bold),
                //         ),
                //         SizedBox(height: 10),
                //         Text('1. Step 1 instructions...'),
                //         Text('2. Step 2 instructions...'),
                //         // Add more steps as needed
                //       ],
                //     ),
                //   ),
                // ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
