import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rehnuma/controllers/performa_controller.dart';

import '../mixins.dart';
import '../screens/today_performa_screen.dart';

class PerformaView extends StatefulWidget {
  const PerformaView({Key? key, required this.date}) : super(key: key);
  final String date;

  @override
  State<PerformaView> createState() => _PerformaViewState();
}

class _PerformaViewState extends State<PerformaView> with ProgressSpin {
  late PerformaController performaController = Get.put(PerformaController());

  @override
  void initState() {
    super.initState();
  }

  String getLabel(String label) {
    return label[0].capitalize! + label.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (performaController.isLoading.value) {
          return showProgress();
        } else {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Background.jpg'),
                  fit: BoxFit.cover),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Your performance on ${widget.date}',
                        style: TextStyle(fontSize: 30.0),
                      ),
                    ),
                    CustomDivider(),
                    Heading(text: 'Emotion'),
                    EmojiWidget(
                      assetName:
                          'assets/images/emojis/${performaController.performaModel.value.emotion}.png',
                      label: getLabel(
                          performaController.performaModel.value.emotion!),
                    ),
                    CustomDivider(),
                    Heading(text: 'Feeling'),
                    EmojiWidget(
                      assetName:
                          'assets/images/emojis/${performaController.performaModel.value.feeling}.png',
                      label: getLabel(
                          performaController.performaModel.value.feeling!),
                    ),
                    CustomDivider(),
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          performaController
                              .performaModel.value.questions!.length,
                          (index) => CustomCheckListTile(
                            titleText: performaController
                                .performaModel.value.questions![index].question,
                            valueBool: performaController
                                .performaModel.value.questions![index].answer,
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                    ),
                    CustomDivider(),
                    Container(
                      width: 250.0,
                      child: Column(
                        children: List.generate(
                            performaController.performaModel.value
                                .sliderQuestions!.length, (index) {
                          return Column(
                            children: [
                              SliderWidgetText(
                                text: performaController.performaModel.value
                                    .sliderQuestions![index].question,
                              ),
                              Slider(
                                min: 0,
                                max: 100,
                                value: performaController.performaModel.value
                                    .sliderQuestions![index].answer,
                                activeColor: Colors.purple,
                                inactiveColor: Colors.grey,
                                onChanged: (value) {},
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                    CustomDivider(),
                    Heading(text: 'Quick Checklist'),
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          performaController
                              .performaModel.value.quickCheckList!.length,
                          (index) => CustomCheckListTile(
                            titleText: performaController.performaModel.value
                                .quickCheckList![index].question,
                            valueBool: performaController.performaModel.value
                                .quickCheckList![index].answer,
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                    ),
                    Heading(text: 'Note to Self'),
                    Notepad(
                      text: performaController
                          .performaModel.value.noteToYourSelf
                          .toString(),
                      onChanged: (v) {},
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
