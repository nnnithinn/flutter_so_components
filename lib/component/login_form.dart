import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:so/so.dart';

class LoginForm extends StatefulWidget {
  late TextEditingController userNameControl;
  late TextEditingController passwordControl;
  late GlobalKey<FormState> globalKey;
  final Color? backgroundColor;
  final Client client;
  final VoidCallback? logicSuccessAction;
  final VoidCallback? loginFailedAction;

  LoginForm(
      {
        super.key,
        this.backgroundColor,
        this.logicSuccessAction,
        this.loginFailedAction,
        required this.client,
      }) {
    userNameControl = TextEditingController();
    passwordControl = TextEditingController();
    globalKey = GlobalKey<FormState>();
  }

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: widget.backgroundColor ?? const Color.fromARGB(1000, 245, 245, 245),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: widget.globalKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildField('User Name', widget.userNameControl, const Icon(Icons.login)),
                  const SizedBox(height: 15),
                  _buildField('Password', widget.passwordControl, const Icon(Icons.password)),
                  const SizedBox(height: 60),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          MaterialButton(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 25),
                              color: Theme.of(context).primaryColor,
                              onPressed: () => {
                                if(widget.globalKey.currentState!.validate()) {
                                  login()
                                }
                              },
                              child:
                              const Text('Login', style: TextStyle(fontSize: 16))),
                          const SizedBox(height: 15),
                          Row(children: [
                            TextButton(
                                onPressed: () => {},
                                child: const Text('Sign Up',
                                    style: TextStyle(fontSize: 16))),
                            const Text("|", style: TextStyle(fontSize: 16)),
                            TextButton(
                                onPressed: () => {},
                                child: const Text('Forgot Password?',
                                    style: TextStyle(fontSize: 16)))
                          ])
                        ],
                      )
                    ],
                  )
                ]),
          ),
        )
    );
  }

  Widget _buildField(
      String fieldLabel,
      TextEditingController controller,
      Icon icon
      ) {
    return TextFormField(
      validator: (value) {
        if(value!.isEmpty) {
          return 'No value provided';
        }
      },
      controller: controller,
      decoration: InputDecoration(
        labelText: fieldLabel,
        errorStyle: const TextStyle(color: Colors.red),
        border: const OutlineInputBorder(borderSide: BorderSide()),
      ),
    );
  }

  void login() async {
    // Simulate an async operation with a delay
    await Future.delayed(const Duration(seconds: 2));
    String status = await widget.client.login(widget.userNameControl.value.text, widget.passwordControl.value.text);
    if(status == '') {
      log('${widget.userNameControl.value.text} ${widget.passwordControl.value.text}');
      widget.logicSuccessAction!.call();
    } else {
      widget.loginFailedAction!.call();
    }
  }
}
