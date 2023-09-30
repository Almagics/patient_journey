import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient_journey/auth/firebase_auth/firebase_auth_service.dart';
import 'package:patient_journey/common_widgets/app_button.dart';
import 'package:patient_journey/constants/app_assets.dart';
import 'package:patient_journey/constants/app_colors.dart';
import 'package:patient_journey/screens/home_screen.dart';
import 'package:patient_journey/screens/login_screen.dart';

import '../common_widgets/app_text_form_filed.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  //bool visible = false;

  final FirebaseAuthService _auth = FirebaseAuthService();
  final  _store = FirebaseFirestore.instance;
 
  late String email;
  late String password;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final idController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final birthDayController = TextEditingController();
  final passwordController = TextEditingController();
  final sexController = TextEditingController();
  final verificationCodeController = TextEditingController();
  final userTypeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    idController.dispose();
    phoneController.dispose();
    emailController.dispose();
    birthDayController.dispose();
    passwordController.dispose();
    sexController.dispose();
    verificationCodeController.dispose();
    userTypeController.dispose();
    super.dispose();
  }

  _getDropDownDecoration({required hintText, required IconData icon}) {
    return InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0)));
  }


  void _displayDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registration Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const SafeArea(child: SizedBox.shrink()),
              Expanded(
                child: Image.asset(AppAssets.doctorsIMG),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(24.0)),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppTextFormFiled(
                            iconData: Icons.person,
                            controller: firstNameController,
                            hintText: 'Enter your First name',
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          AppTextFormFiled(
                            iconData: Icons.person,
                            controller: lastNameController,
                            hintText: 'Enter your Last name',
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          AppTextFormFiled(
                            iconData: Icons.numbers,
                            controller: idController,
                            hintText: 'Enter your ID number',
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          AppTextFormFiled(
                            iconData: Icons.phone_android,
                            controller: phoneController,
                            hintText: 'Enter your Phone number',
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          AppTextFormFiled(
                            iconData: Icons.email_outlined,
                            controller: emailController,
                            hintText: 'Enter your Email',
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          StatefulBuilder(builder: (context, setStateBirthDay) {
                            return AppTextFormFiled(
                              readOnly: true,
                              onTap: () async {
                                final picker = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2040));
                                setStateBirthDay(() {
                                  birthDayController.text =
                                      DateFormat.yMd().format(picker!);
                                });
                              },
                              iconData: Icons.cake_outlined,
                              controller: birthDayController,
                              hintText: 'Enter your Birth date',
                            );
                          }),
                          const SizedBox(
                            height: 20.0,
                          ),
                          AppTextFormFiled(
                            obscureText: true,
                            suffixIcon: true,
                            iconData: Icons.lock,
                            controller: passwordController,
                            hintText: 'Enter your Password',
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          DropdownButtonFormField(
                              validator: (value) {
                                if (value == null) {
                                  return 'Required*';
                                }
                              },
                              icon: const Icon(Icons.keyboard_arrow_down),
                              decoration: _getDropDownDecoration(
                                  hintText: 'Sex', icon: Icons.male),
                              items: ['Male', 'Female']
                                  .map((e) => DropdownMenuItem(
                                        child: Text(e.toString()),
                                        value: e.toString(),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  sexController.text = value!;
                                });
                              }),
                        //  const SizedBox(
                         //   height: 20.0,
                        //  ),
                        //  AppTextFormFiled(
                           // iconData: Icons.verified,
                          //  controller: verificationCodeController,
                         //   hintText: 'Enter verification code',
                       //   ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          DropdownButtonFormField(
                              validator: (value) {
                                if (value == null) {
                                  return 'Required*';
                                }
                              },
                              icon: const Icon(Icons.keyboard_arrow_down),
                              decoration: _getDropDownDecoration(
                                  hintText: 'You Sign up as',
                                  icon: Icons.accessibility),
                              items: ['Doctor', 'Patient']
                                  .map((e) => DropdownMenuItem(
                                        child: Text(e.toString()),
                                        value: e.toString(),
                                      ))
                                  .toList(),
                              onChanged: (value) {

                                setState(() {
                                  userTypeController.text = value!;
                                });
                              }),
                          const SizedBox(
                            height: 20.0,
                          ),
                          AppButton(
                              onPressed: () {

                                _signup();
                              },
                              text: 'Sign Up'),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => LoginScreen(),
                                      fullscreenDialog: true),
                                );
                              },
                              child: const Text.rich(TextSpan(children: [
                                TextSpan(
                                  text: 'All ready have account ? ',
                                  style: TextStyle(
                                    color: AppColors.grey,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Login ',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ])))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 0.0,
            child: SafeArea(
              child: Image.asset(
                AppAssets.logoIMG,
                width: size.width * 0.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _signup() async{
String firstName = firstNameController.text;
String lastName= lastNameController.text;
String idNumber = idController.text;
String phone = phoneController.text;
String email = emailController.text;
String birthday = birthDayController.text;
String password = passwordController.text;
String gender = sexController.text;
String userType = userTypeController.text;
User? user = await _auth.signupWithEmailAndPassword(email, password);




  print("User is successfully created");
  if(user!= null){

    await _store.collection("users")
        .doc(email)
        .set({

      "email":email,
      "password":password,
      "firstname":firstName,
      "lastname":lastName,
      "birthday":birthday,
      "idnumber":idNumber,
      "phone":phone,
      "gender":gender,
      "type":userType


    });



    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (ctx) => HomeScreen(username: firstName,)));



  }else{
    _displayDialog('Registration failed. Please try again.');
  }



}
}
