import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:so_flutter/so_flutter.dart';

class SignUpScreen extends DataScreen {
  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Expanded(child: SvgPicture.asset('assets/images/login_bg.svg'))
      ],
    ));
  }

  Widget _loginForm() {
    Field<String> userNameField = textField(
        decoration: const InputDecoration(
            labelText: 'User Name',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        validator: (value) =>
        value == null || value.isEmpty ? "User Name cannot be empty" : null,
        autovalidateMode: AutovalidateMode.onUserInteraction);

    Field<String> firstNameField = textField(
        decoration: const InputDecoration(
            labelText: 'First Name',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        validator: (value) => value == null || value.isEmpty
            ? "First Name cannot be empty"
            : null,
        autovalidateMode: AutovalidateMode.onUserInteraction);

    Field<String> middleNameField = textField(
        decoration: const InputDecoration(
            labelText: 'Middle Name',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        autovalidateMode: AutovalidateMode.onUserInteraction);

    Field<String> lastNameField = textField(
        decoration: const InputDecoration(
            labelText: 'Last Name',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))));

    Field<DateTime> dobField = dateField(
        decoration: const InputDecoration(
            labelText: 'Date of Birth',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))));

    Field<String> mobileField = textField(
        decoration: const InputDecoration(
            labelText: 'Mobile Number',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))));

    Field<String> emailField = textField(
        decoration: const InputDecoration(
            labelText: 'Email Id',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        validator: (value) =>
        value == null || value.isEmpty ? "Email cannot be empty" : null,
        autovalidateMode: AutovalidateMode.onUserInteraction);
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.all(40),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  userNameField,
                  const SizedBox(height: 15),
                  firstNameField,
                  const SizedBox(height: 15),
                  middleNameField,
                  const SizedBox(height: 15),
                  lastNameField,
                  const SizedBox(height: 15),
                  dobField,
                  const SizedBox(height: 15),
                  mobileField,
                  const SizedBox(height: 15),
                  emailField,
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () => {
                            if (!isValid)
                              {
                                App.message(
                                    'Please check if you have entered all mandatory fields.')
                              }
                            else
                              {App.message('Yet to be implemented')}
                          },
                          child: const Text('Submit')),
                      const SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: () => App.goHome(),
                          child: const Text('Cancel'))
                    ],
                  )
                ],
              ),
            )));
  }
}
