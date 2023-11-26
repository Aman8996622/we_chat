import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:we_chat/presentation/screen/add_profile/add_profile_controller.dart';
import 'package:we_chat/presentation/widget/button_press_effect.dart';
import 'package:we_chat/presentation/widget/button_widget/custom_button_press.dart';
import 'package:we_chat/presentation/widget/custom_textfield.dart';

class AddProfile extends StatelessWidget {
  const AddProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Consumer<AddProfileController>(builder: (context, value, child) {
                return Container(
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          context
                              .read<AddProfileController>()
                              .addProfileButtonClicked(
                                context: context,
                              );
                        },
                        child: Container(
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.grey.shade300,
                            child: Center(
                              child: context
                                          .read<AddProfileController>()
                                          .xProfileImage !=
                                      null
                                  ? Image.file(
                                      File(
                                        context
                                                .read<AddProfileController>()
                                                .xProfileImage
                                                ?.path ??
                                            "",
                                      ),
                                      height: 100,
                                    )
                                  : Image.asset(
                                      'assets/images/profile_icon.png'),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 5,
                        child: ButtonPressEffect(
                          onPress: () async {
                            await context
                                .read<AddProfileController>()
                                .addProfileButtonClicked(
                                  context: context,
                                );
                          },
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.brown.shade600,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
              SizedBox(
                height: 40,
              ),
              Container(),
              Consumer<AddProfileController>(
                builder: (context, value, child) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.blueAccent,
                    )),
                    child: CustomTextField(
                      hintText: "First Name",
                      contoller: value.firstNameController,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              Consumer<AddProfileController>(
                builder: (context, value, child) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.blueAccent,
                    )),
                    child: CustomTextField(
                      contoller: value.lastNameController,
                      hintText: "Last Name",
                    ),
                  );
                },
              ),
              Consumer<AddProfileController>(builder: (context, value, child) {
                return Container(
                  margin: EdgeInsets.all(20),
                  padding: const EdgeInsets.only(
                    left: 5,
                  ),
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black)),
                  child: TextField(
                    controller: value.phoneNameController,
                    decoration: const InputDecoration(
                        hintText: "Enter Phone Number",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        )),
                  ),
                );
              }),
              Consumer<AddProfileController>(builder: (context, value, child) {
                return Container(
                  margin: EdgeInsets.all(20),
                  padding: const EdgeInsets.only(
                    left: 5,
                  ),
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black)),
                  child: TextField(
                    controller: value.passwordText,
                    decoration: const InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        )),
                  ),
                );
              }),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: CustomButton(
                    backgroundColor: Colors.blue.shade500,
                    height: 40.0,
                    width: double.infinity,
                    text: "Register",
                    onPress: () async {
                      await context
                          .read<AddProfileController>()
                          .registerButtonClicked(context: context);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
