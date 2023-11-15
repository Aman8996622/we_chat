// import 'package:clean_arch/src/core/colors/ra_colors.dart';
// import 'package:clean_arch/src/presentation/widgets/buttons/button_press_effect.dart';
// import 'package:clean_arch/src/presentation/widgets/custom_text.dart';
// import 'package:clean_arch/src/presentation/widgets/textField_row.dart';

// import '../../core/styles/global_styles.dart';
// import '../../core/utils/utils.dart';
// import 'login_controller.dart';
// import '../widgets/buttons/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart' hide Trans;

// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   // final txtfEmailController =
//   //     TextEditingController(text: "harshtribond@gmail.com");
//   // final txtfPasswordController = TextEditingController(text: "H12345");

//   final txtfEmailController =
//       TextEditingController(text: "5jan@tribondinfosystems.com");

//   final txtfPasswordController = TextEditingController(text: "A123456");

//   final loginController = Get.put(LoginController());

//   @override
//   void initState() {
//     super.initState();
//     loginController.initialise();
//   }

//   @override   
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: double.infinity,
//       width: double.infinity,
//       child: Center(
//         child: SizedBox(
//           width: Utils.isIpad ? 350 : 320,
//           child: Stack(
//             clipBehavior: Clip.none,
//             children: [
//               Container(
//                 padding: const EdgeInsets.only(bottom: 10),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(9),
//                   ),
//                   border: Border.all(),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Container(
//                       decoration: const BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(8),
//                           topRight: Radius.circular(8),
//                         ),
//                       ),
//                       height: Utils.isIpad ? 60 : 50,
//                       child: Center(
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 7, right: 7),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 "assets/images/risk_logo.png",
//                                 height: 40,
//                                 width: 40,
//                               ),
//                               const Expanded(
//                                 child: Center(
//                                     child: CustomText(
//                                   text: " Login to Risk Assessor",
//                                   style: GlobalStyles.textStyleBoldWhite_16,
//                                 )),
//                               ),
//                               const SizedBox(
//                                 width: 40,
//                                 height: 40,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 7,
//                     ),
//                     GetBuilder<LoginController>(builder: (controller) {
//                       return TextFieldRow(
//                         titleWidth: 90,

//                         controller: txtfEmailController,
//                         title: "USER NAME",
//                         titleStyle: GlobalStyles.textStyleBold_14,
//                         // validator: loginController.emailValidator,
//                         errorMessageToShow:
//                             controller.userNameErroMessage?.value,
//                         errorTextPadding: const EdgeInsets.only(
//                           left: 3,
//                           top: 4,
//                         ),
//                         showTextFieldBorder: true,
//                         textFieldBorderColor:
//                             RAColors.checkYourControlGreyButton,
//                         keyboardType: TextInputType.emailAddress,
//                         // titleWidth: Utils.responsiveWidth(
//                         //   width: 24,
//                         //   context: context,
//                         // ),
//                         textCapitalization: TextCapitalization.none,
//                       );
//                     }),
//                     GetBuilder<LoginController>(builder: (controller) {
//                       return TextFieldRow(
//                         titleWidth: 90,
//                         titleStyle: GlobalStyles.textStyleBold_14,
//                         title: "PASSWORD",
//                         obscureText: true,
//                         controller: txtfPasswordController,
//                         errorTextPadding: const EdgeInsets.only(
//                           left: 5,
//                           top: 4,
//                         ),
//                         validator: loginController.passwordValidator,
//                         errorMessageToShow:
//                             controller.passwordErrorMessage?.value,
//                         showTextFieldBorder: true,
//                         textFieldBorderColor:
//                             RAColors.checkYourControlGreyButton,
//                         // titleWidth:
//                         //     Utils.responsiveWidth(width: 24, context: context),
//                         textCapitalization: TextCapitalization.none,
//                       );
//                     }),
//                     forgotPasswordLink(),
//                     SizedBox(
//                       height:
//                           Utils.responsiveHeight(height: 2, context: context),
//                     ),
//                     loginButton(context)
//                   ],
//                 ),
//               ),
//               // cancelButton(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Padding loginButton(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 10, left: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: CustomButton(
//               text: "Cancel",
//               onPress: () {
//                 Get.back();
//               },
//               height: 30.0,
//               backgroundColor: Colors.grey,
//               borderRadius: 5,
//               textStyle: GlobalStyles.textStyleBoldWhite_15,
//             ),
//           ),
//           SizedBox(
//             width: 30,
//           ),
//           Expanded(
//             child: CustomButton(
//               text: "Login",
//               onPress: () {
//                 loginController.loginButtonPressed(
//                   context: context,
//                   email: txtfEmailController.text,
//                   password: txtfPasswordController.text,
//                 );
//               },
//               height: 30.0,
//               backgroundColor: Colors.black,
//               borderRadius: 5,
//               textStyle: GlobalStyles.textStyleBoldWhite_15,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Padding forgotPasswordLink() {
//     return Padding(
//       padding: const EdgeInsets.only(right: 12),
//       child: ButtonPressEffect(
//         onPress: () {
//           loginController.forgotPasswordTextClicked();
//         },
//         child: Align(
//           alignment: Alignment.centerRight,
//           child: RichText(
//             text: const TextSpan(
//               style: GlobalStyles.textStyleNormal_13,
//               text: "Forgot your password? Click ",
//               children: [
//                 TextSpan(
//                   text: "here",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     decoration: TextDecoration.underline,
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Positioned cancelButton() {
//     return Positioned(
//       right: -10,
//       top: -10,
//       child: InkResponse(
//         onTap: () {
//           Get.back();
//         },
//         child: CircleAvatar(
//           backgroundColor: Colors.grey[700],
//           child: const Icon(
//             Icons.close,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
