import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:we_chat/presentation/screen/add_profile/add_profile_controller.dart';
import 'package:we_chat/presentation/widget/button_press_effect.dart';
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
              SizedBox(
                height: 10,
              ),
              Container(
                child: Stack(
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey.shade300,
                        child: Center(
                          child: Image.asset('assets/images/profile_icon.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 5,
                      child: ButtonPressEffect(
                        onPress: () {
                          context
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
              ),
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
                      contoller: value.firstNameController,
                      hintText: "Last Name",
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
