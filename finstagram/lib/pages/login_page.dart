import 'package:finstagram/models/auxiliary_functions.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {

  late double _deviceHeight, _deviceWidth;
  String? loginEmail;
  String? loginPassword;

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    // body of the Login Page
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.05),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _loginTitle(),
                _loginForm(),
                _loginButton(),
                _registerPageLink(),
              ]
            ),
          ),
        )
      ),
    );
  }

  Widget _loginTitle() {
    return const Text(
      "Finstagram", 
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w600
      ),
    );
  }

  Widget _loginForm() {
    return Container(
      height: _deviceHeight * 0.3,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _loginFormEmailField(),
            _loginFormPasswordField(),
          ],
        ),
      ),
    );
  }

  Widget _loginFormEmailField() {
    return TextFormField(
      decoration: const InputDecoration(hintText: "Email"),
      onSaved: (formEmail) {
        setState(() {
          loginEmail = formEmail;
        });
      },
      validator: (formEmail) {
        bool validEmail = emailRegExValidator(formEmail!);
        return validEmail ? null : "Please enter a valid email address";
      },
    );
  }

  Widget _loginFormPasswordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(hintText: "Password"),
      onSaved: (formPassword) {
        setState(() {
          loginPassword = formPassword;
        });
      },
      validator: (formPassword) => formPassword!.length > 6 ? null : "Password must be longer than 6 characters",
    );
  }

  Widget _loginButton() {
    return MaterialButton(
      minWidth: _deviceWidth * 0.7,
      height: _deviceHeight * 0.06,
      color: Colors.red,
      onPressed: _loginUser,
      child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
    );
  }

  Widget _registerPageLink() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'register'),
      child: const Text("Register Account", style: TextStyle(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.w200),),
    );
  }

  void _loginUser() {
    if(_loginFormKey.currentState!.validate()) {
      _loginFormKey.currentState!.save();
    }
  }
}