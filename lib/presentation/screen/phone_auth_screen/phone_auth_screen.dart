import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:we_chat/core/routes/routes.dart';
import 'package:we_chat/core/utils/utils.dart';
import 'package:we_chat/core/we_colors/we_colors.dart';
import 'package:we_chat/presentation/screen/phone_auth_screen/auth_controller/auth_controller.dart';
import 'package:we_chat/presentation/widget/button_press_effect.dart';
import 'package:we_chat/presentation/widget/button_widget/custom_button_press.dart';
import 'package:we_chat/presentation/widget/custom_text.dart';
import 'package:we_chat/presentation/widget/custom_textfield.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> with WidgetsBindingObserver {
  String? phoneNumber;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    // var phoneAuth = Provider.of<AuthController>(context, listen: true);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthController>().initisalized();
    });

    // phoneAuth.initisalized();
  }

  @override
  Widget build(BuildContext context) {
    var phoneAuth = Provider.of<AuthController>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        body: Container(
            child: Column(
          children: [
            body(context: context),
            _footer(context: context),
            Container(
              height: 40,
            )
          ],
        )),
      ),
    );
  }

  Widget body({
    required BuildContext context,
  }) {
    return Flexible(
      child: Container(
        child: ListView(
          children: [
            // Container(
            //   child:   ,
            // ),
            Container(
              height: Utils.responsiveHeight(
                context: context,
                height: 20,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                "Enter Your Phone Number",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 20,
            ),
            Container(
              color: Colors.amber,
              alignment: Alignment.center,
              child: Column(
                children: [
                  const Text(
                    "Please confirm your country code and enter",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  ButtonPressEffect(
                    onPress: () {
                      GoRouter.of(context).pushNamed(AppNameRoutes.register);
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
            ),
            textField(context: context),
            CustomTextField(
              hintText: "Password",
              contoller: context.read<AuthController>().passwordText,
            ),

            InkWell(
              onTap: () {
                context
                    .read<AuthController>()
                    .signUpButtonClicked(context: context);
              },
              child: Container(
                color: Colors.red,
                width: double.infinity,
                height: 30,
                child: Text("Sign up"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /* ********************/
  // Footer
  /* ********************/

  Widget _footer({
    required BuildContext context,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: CustomButton(
          text: "Continue",
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          height: 60.0,
          backgroundColor: WeColors.darkBlueColor,
          borderColor: WeColors.darkBlueColor,
          onPress: () async {
            context.read<AuthController>().contiuneButtonClicked(
                  context: context,
                );
          }),
    );
  }

  /* ********************/
  // TEXT FIELD
  /* ********************/
  Widget textField({required BuildContext context}) {
    final phoneAuth = Provider.of<AuthController>(context, listen: false);

    return Consumer<AuthController>(
      builder: (BuildContext context, value, Widget? child) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ButtonPressEffect(
                  onPress: () {
                    // phoneAuth.countryCodeTextClicked(context: context);
                  },
                  child: Card(
                    elevation: 10,
                    child: Container(
                      // height: 50,
                      height: 50,
                      width: 50,
                      color: const Color(0xfff7f7f6),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: phoneAuth.selectCountryCode?.flagImage() ??
                                Container(),
                          ),
                          Flexible(
                            child: CustomText(
                              text: phoneAuth.selectCountryCode?.dialCode ?? "",
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Card(
                  elevation: 10,
                  color: Color(0xfff7f7f6),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Container(
                    // color: Colors.red,
                    height: 50,

                    child: Center(
                      child: CustomTextField(
                        hintText: "Phone Number",
                        // borderColor: const Color(0xfff7f7f6),
                        // textFieldColor: Colors.red,
                        contoller: phoneAuth.phoneNumberController,
                        keyboardType: TextInputType.number,
                        textStyle: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.addObserver(this);
  }
}
