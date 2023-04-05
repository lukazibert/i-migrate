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
            if (interviewController.pageController.value.page!.toInt() == 0) {
              Get.back();
            }
            interviewController.pageController.value.animateToPage(
                interviewController.pageController.value.page!.toInt() - 1,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOut);
          },
        ),
        tailIcon: IconButton(
          icon: const Icon(
            Icons.info_outline,
            size: 28,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(),
        child: PageView.builder(
            controller: interviewController.pageController.value,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: interviewController.interviewQuestions.length,
            itemBuilder: (context, index) {
              print(index);
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
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 20.0, bottom: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            decoration: BoxDecoration(
              color: const Color(0xFFE5E5E5),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  interviewController.interviewQuestions[index]["question"]!,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
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
                    onTap: () async {
                      interviewController.pageController.value.page!.toInt() ==
                              interviewController.interviewQuestions.length - 1
                          ? {
                              print("last page"),
                              Get.offAll(() => MainView()),
                              interviewController.updateAnwsers(),
                              navigationController.pageController.value
                                  .jumpToPage(navigationController
                                      .currentPageIndex.value),
                              navigationController.refreshController(),
                            }
                          : interviewController.pageController.value
                              .animateToPage(
                                  interviewController.pageController.value.page!
                                          .toInt() +
                                      1,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeOut);
                      await Future.delayed(const Duration(milliseconds: 400),
                          () {
                        interviewController.setDataEntered(false);
                      });
                    },
                  )
                : GestureDetector(
                    onTap: (() async {
                      interviewController.pageController.value.page!.toInt() ==
                              interviewController.interviewQuestions.length - 1
                          ? {
                              Get.offAll(() => MainView()),
                              interviewController.updateAnwsers(),
                              navigationController.pageController.value
                                  .jumpToPage(navigationController
                                      .currentPageIndex.value),
                              navigationController.refreshController(),
                              // print(interviewController
                              //         .pageController.value.page!
                              //         .toInt() ==
                              //     interviewController
                              //             .interviewQuestions.length -
                              //         1)
                            }
                          : interviewController.pageController.value
                              .animateToPage(
                                  interviewController.pageController.value.page!
                                          .toInt() +
                                      1,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeOut);
                      await Future.delayed(const Duration(milliseconds: 400),
                          () {
                        interviewController.setDataEntered(false);
                      });
                    }),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      child: const Center(
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
        return TextInputQuestion(
          index: index,
        );
      case "dropdown":
        return DropdownQuestion(
          index: index,
        );
      case "multipleChoice":
        return MultichoiceQuestion(
          index: index,
        );
      case "multipleChoiceWrap":
        return MultichoiceWrapQuestion(
          index: index,
        );
      default:
        return TextInputQuestion(
          index: index,
        );
    }
  }
}

class TextInputQuestion extends StatelessWidget {
  final int index;
  const TextInputQuestion({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    print(interviewController.interviewQuestions[index]["anwser"]);
    return Container(
      width: double.infinity,
      child: Obx(
        () => TextField(
          controller: TextEditingController(
              text: interviewController.interviewQuestions[index]["anwser"]),
          cursorColor: const Color(0xFF4F7E93),
          onTapOutside: (event) =>
              FocusScope.of(context).requestFocus(new FocusNode()),
          onChanged: (value) {
            if (value == "") {
              interviewController.setDataEntered(false);
            }
            interviewController.setDataEntered(true);
            interviewController.interviewQuestions[index]["answer"] = value;
          },
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Color(0xFF4F7E93),
              width: 2.0,
            )),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF4F7E93), width: 2.0)),
            labelText:
                interviewController.interviewQuestions[index]["lable"] ?? "",
            floatingLabelStyle: MaterialStateTextStyle.resolveWith(
              (states) => const TextStyle(
                color: Color(0xFF4F7E93),
              ),
            ),
          ),
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
          interviewController.setAnwser(index, country!);
          FocusScope.of(context).requestFocus(new FocusNode());
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
  final int index;
  const MultichoiceQuestion({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => Column(
          children: interviewController.interviewQuestions[index]["options"]
              .map<Widget>(
            (title) {
              return Column(
                children: [
                  const SizedBox(height: 10.0),
                  CustomChip(
                    expanded: true,
                    label: title,
                    selected: interviewController.interviewQuestions[index]
                            ["anwser"] ==
                        title,
                    onSelected: () {
                      interviewController.setAnwser(index, title);
                    },
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

class MultichoiceWrapQuestion extends StatelessWidget {
  final int index;
  const MultichoiceWrapQuestion({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    print(index);
    return Container(
      child: Obx(
        () => Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: 2.0,
          runSpacing: 10.0,
          children: List<Widget>.generate(
            interviewController.interviewQuestions[index]["options"].length,
            (int i) {
              final String title =
                  interviewController.interviewQuestions[index]["options"][i];
              return new CustomChip(
                expanded: false,
                label: title,
                selected: interviewController.interviewQuestions[index]
                        ["anwser"] ==
                    title,
                onSelected: () {
                  interviewController.setAnwser(index, title);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class CustomChip extends StatelessWidget {
  final String label;
  final bool selected;
  final Function onSelected;
  final bool expanded;
  const CustomChip(
      {super.key,
      required this.label,
      required this.selected,
      required this.onSelected,
      required this.expanded});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected();
      },
      child: Container(
        width: expanded ? double.infinity : null,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontSize: 18,
              fontFamily: "Alegreya Sans",
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.visible),
        ),
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF4F7E93) : Colors.grey[350],
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
