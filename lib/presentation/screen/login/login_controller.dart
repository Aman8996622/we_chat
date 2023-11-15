
// import 'package:flutter/material.dart';

// import 'package:get_it/get_it.dart';


// class LoginController with  ChangeNotifier {
//   // var errorMessage = "".obs;

//   // RxString? passwordErrorMessage;
//   // RxString? userNameErroMessage;

//   void initialise() {
//     // passwordErrorMessage = null;
//     userNameErroMessage = null;
//   }

//   /* ************************************** */
//   // LOGIN BUTTON

//   /// called when user taps the login button
//   /* ************************************** */
//   void loginButtonPressed({
//     required BuildContext context,
//     required String email,
//     required String password,
//   }) async {
//     if (email.isEmpty) {
//       userNameErroMessage = RxString("Email Address can not be empty");
//     } else if (isEmail(email) == false) {
//       userNameErroMessage = RxString("Please Enter validate email address");
//     } else if (password.isEmpty) {
//       passwordErrorMessage = RxString("Password can not be empty");
//     } else {
//       var signInUseCase = GetIt.I<SignIn>();

//       // //Call API
//       // DataResults<AuthEntity> result = await signInUseCase.call(
//       //   params: LoginParams(
//       //     email: email,
//       //     password: password,
//       //   ),
//       // );

//       if (result.status == 0 && context.mounted) {
//         Utils.showAlert(
//             title: "Error !!",
//             message: result.errorMessage ?? "",
//             context: context);
//       } else {
//         if (result.data != null) {
//           if ((result.data?.listCompany?.length ?? 0) > 1) {
//             MultipleCompanySelectionController controller =
//                 Get.put(MultipleCompanySelectionController());
//             controller.initialise(
//               authEntity: result.data!,
//               isFromOnboarding: true,
//             );
//           }
//         }
//       }
//     }
//     update();
//   }

//   /* ************************************** */
//   //      PASSWORD VALIDATOR
//   /* ************************************** */
//   final passwordValidator = MultiValidator([
//     RequiredValidator(errorText: 'password is required'),
//   ]);

//   /* ************************************** */
//   //      EMAIL VALIDATOR
//   /* ************************************** */
//   final emailValidator = MultiValidator([
//     RequiredValidator(errorText: 'Email is required'),
//     EmailValidator(errorText: "Please enter a valid email address.")
//   ]);

//   void forgotPasswordTextClicked() {
//     Get.back();

//     Get.dialog(
//       barrierDismissible: false,
//       ForgotPassword(),
//     );
//   }
// }
