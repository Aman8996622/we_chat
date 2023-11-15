import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_chat/core/utils/utils.dart';
import 'package:we_chat/presentation/screen/register/register_controller.dart';
import 'package:we_chat/presentation/widget/button_press_effect.dart';
import 'package:we_chat/presentation/widget/button_widget/custom_button_press.dart';
import 'package:we_chat/presentation/widget/custom_text.dart';
import 'package:we_chat/presentation/widget/custom_textfield.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    var registerController =
        Provider.of<RegisterController>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ListView(
            children: [
              Container(
                height: Utils.responsiveHeight(
                  context: context,
                  height: 5,
                ),
              ),
              Container(
                child: const Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: Utils.responsiveHeight(
                  context: context,
                  height: 5,
                ),
              ),
              Consumer<RegisterController>(
                builder: (BuildContext context, value, child) {
                  return Container(
                    // height: 0
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.blue,
                    )),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: CustomTextField(
                      // height: Utils.responsiveHeight(
                      //   context: context,
                      //   height: 6.5,
                      // ),
                      hintText: "First name",
                      hintTextStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade500,
                      ),
                      contoller: value.userName,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 18,
              ),
              Consumer<RegisterController>(
                builder: (context, value, child) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                      ),
                    ),
                    child: CustomTextField(
                      // height: Utils.responsiveHeight(
                      //   context: context,
                      //   height: 6.5,
                      // ),
                      hintText: "Phone Number",
                      hintTextStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade500,
                      ),
                      contoller: value.phoneText,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 18,
              ),
              Consumer<RegisterController>(
                builder: (context, value, child) {
                  return Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 1,
                      color: Colors.blue,
                    )),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: CustomTextField(
                      // height: Utils.responsiveHeight(
                      //   context: context,
                      //   height: 6.5,
                      // ),
                      hintText: "Password",
                      hintTextStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade500,
                      ),
                      contoller: value.password,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 18,
              ),
              const SizedBox(
                height: 30,
              ),
              footer(context),
              const SizedBox(
                height: 25,
              ),
              ButtonPressEffect(
                onPress: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: const CustomText(
                    text: "Login",
                    // style: GlobalStyles.textStyleNormal_15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget footer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: CustomButton(
        backgroundColor: Colors.blue.shade500,
        text: "Sign up",
        onPress: () async {
          await context.read<RegisterController>().registerButtonClicked(
                context: context,
                
              );
        },
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        height: 45.0,
        borderRadius: 15,
        // backgroundColor: ColorsConst.themeBlueButtonColor,
      ),
    );
  }

  Widget footerText() {
    return Container(
      child: Column(
        children: [
          Container(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
