import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:i_migrate/components/CustomAppBar.dart';
import 'package:i_migrate/components/CustomButton.dart';

import '../controllers/InterviewController.dart';
import '../main.dart';

final interviewController = Get.put(InterviewController());

class InterviewView extends StatelessWidget {
  InterviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Interview",
        leadingIcon: IconButton(
          icon: Image.asset(
            "lib/assets/Icons/Arrow icon.png",
            width: 28.0,
            height: 28.0,
          ),
          onPressed: () {
            interviewController.pageController.value.animateToPage(
                interviewController.pageController.value.page!.toInt() - 1,
                duration: Duration(milliseconds: 400),
                curve: Curves.easeOut);
          },
        ),
        tailIcon: IconButton(
          icon: Icon(
            Icons.info_outline,
            size: 28,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(),
        child: PageView.builder(
            controller: interviewController.pageController.value,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Question(index: index);
            }),
      ),
    );
  }
}

class Question extends StatelessWidget {
  final int index;

  Question({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding:
          EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            decoration: BoxDecoration(
              color: Color(0xFFE5E5E5),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  interviewController.interviewQuestions[index]["question"]!,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 15.0,
                ),
                QuestionType(index: index),
              ],
            ),
          ),
          Obx(
            () => (interviewController.dataEntered.value
                ? CustomButton(
                    text: "Continue",
                    onTap: () {
                      interviewController.pageController.value.page!.toInt() ==
                              interviewController.interviewQuestions.length - 1
                          ? {
                              Get.to(Composition()),
                              navigationController.setCurrentPageIndex(0)
                            }
                          : interviewController.pageController.value
                              .animateToPage(
                                  interviewController.pageController.value.page!
                                          .toInt() +
                                      1,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.easeOut);
                      interviewController.setDataEntered(false);
                    },
                  )
                : GestureDetector(
                    onTap: (() {
                      interviewController.pageController.value.page!.toInt() ==
                              interviewController.interviewQuestions.length - 1
                          ? Get.to(MainView())
                          : interviewController.pageController.value
                              .animateToPage(
                                  interviewController.pageController.value.page!
                                          .toInt() +
                                      1,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.easeOut);
                      interviewController.setDataEntered(false);
                    }),
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
                          width: 2.0,
                        ),
                      ),
                      child: Center(
                          child: Text("Skip",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 28,
                                  fontFamily: "Alegreya Sans",
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.visible))),
                    ),
                  )),
          ),
        ],
      ),
    );
  }
}

class QuestionType extends StatelessWidget {
  final int index;

  QuestionType({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    switch (interviewController.interviewQuestions[index]["questionType"]) {
      case "text":
        return TextInputQuestion();
      case "dropdown":
        return DropdownQuestion(
          index: index,
        );
      case "multipleChoice":
        return MultichoiceQuestion();
      case "multipleChoiceWrap":
        return MultichoiceWrapQuestion(
          index: index,
        );
      default:
        return TextInputQuestion();
    }
  }
}

class TextInputQuestion extends StatelessWidget {
  const TextInputQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextField(
        onChanged: (value) {
          if (value == "") {
            interviewController.setDataEntered(false);
          }
          interviewController.setDataEntered(true);
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xFF4F7E93),
            width: 2.0,
          )),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF4F7E93), width: 2.0)),
          labelText: 'Enter your answer',
        ),
      ),
    );
  }
}

class DropdownQuestion extends StatelessWidget {
  final int index;
  DropdownQuestion({super.key, required this.index});

  final TextEditingController iconController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<String>> iconEntries =
        <DropdownMenuEntry<String>>[];
    for (final String country in interviewController.interviewQuestions[index]
        ["options"]) {
      iconEntries
          .add(DropdownMenuEntry<String>(value: country, label: country));
    }

    return Container(
      width: double.infinity,
      child: DropdownMenu<String>(
        onSelected: (String? country) {
          interviewController.setDataEntered(true);
        },
        menuHeight: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.84,
        controller: iconController,
        enableFilter: true,
        hintText: 'Country',
        dropdownMenuEntries: iconEntries,
        inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            suffixIconColor: Color(0xFF4F7E93),
            suffixStyle: TextStyle(color: Color(0xFF4F7E93)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Color(0xFF4F7E93),
              width: 2.0,
            )),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF4F7E93), width: 2.0))),
      ),
    );
  }
}

class MultichoiceQuestion extends StatelessWidget {
  const MultichoiceQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MultichoiceWrapQuestion extends StatelessWidget {
  final int index;
  const MultichoiceWrapQuestion({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          // spacing: 10.0,
          runSpacing: 5.0,
          children: List<Widget>.generate(
            interviewController.interviewQuestions[index]["options"].length,
            (int i) {
              return ChoiceChip(
                label: Text(
                  interviewController.interviewQuestions[index]["options"][i],
                  style: TextStyle(
                    color: interviewController.interviewQuestions[index]
                                ["selectedIndex"] ==
                            i
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                selectedColor: Color(0xFF4F7E93),
                // backgroundColor: interviewController.interviewQuestions[index]
                //             ["selectedIndex"] ==
                //         i
                //     ? Color(0xFF4F7E93)
                //     : Colors.grey[400],
                selected: interviewController.interviewQuestions[index]
                        ["selectedIndex"] ==
                    i,
                onSelected: (bool selected) {
                  print(selected);
                  interviewController.setSelectedIndex(index, i);
                  interviewController.setDataEntered(true);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
