import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:finstagram/models/auxiliary_functions.dart';
import 'package:finstagram/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {

  late double _deviceHeight, _deviceWidth;
  String? registerName;
  String? registerEmail;
  String? registerPassword;
  File? registerAvatar;

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  late FirebaseService _firebaseService;

  @override
  void initState() {
    super.initState();
    _firebaseService = GetIt.instance.get<FirebaseService>();
  }


  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.05),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _registerTitle(),
                _registerForm(),
                _registerButton(),
              ],
            ),
          ),
        )
      ),
    );
  }

  Widget _registerTitle() {
    return const Text(
      "Finstagram", 
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w600
      ),
    );
  }

  Widget _registerForm() {
    return Container(
      height: _deviceHeight * 0.5,
      child: Form(
        key: _registerFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerAvatarField(),
            _registerFormNameField(),
            _registerFormEmailField(),
            _registerFormPasswordField(),
          ],
        ),
      ),
    );
  }

  Widget _registerAvatarField() {

    // If no avatar has been picked yet, a stock avatar will be used in the form
    late ImageProvider formAvatar;
    if(registerAvatar == null) {
      formAvatar = const NetworkImage('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png');
    } else {
      formAvatar = FileImage(registerAvatar!);
    }  

    return GestureDetector(
      onTap: (){
        FilePicker.platform.pickFiles(type: FileType.image).then((pickedFiles) {
          setState(() {
            registerAvatar = File(pickedFiles!.files.first.path!);  
          });
        });
      },
      child: Container(
        height: _deviceHeight * 0.15,
        width: _deviceHeight * 0.15,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: formAvatar,
          )
        ),
      ),
    );
  }

  Widget _registerFormNameField() {
    return TextFormField(
      decoration: const InputDecoration(hintText: "Name"),
      onSaved: (formName) {
        setState(() {
          registerName = formName;
        });
      },
      validator: (formName) => formName!.length > 3 ? null : "Name must be longer than 3 characters",
    );
  }

  Widget _registerFormEmailField() {
    return TextFormField(
      decoration: const InputDecoration(hintText: "Email"),
      onSaved: (formEmail) {
        setState(() {
          registerEmail = formEmail;
        });
      },
      validator: (formEmail) {
        bool validEmail = emailRegExValidator(formEmail!);
        return validEmail ? null : "Please enter a valid email";
      },
    );
  }

  Widget _registerFormPasswordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(hintText: "Password"),
      onSaved: (formPassword) {
        setState(() {
          registerPassword = formPassword;
        });
      },
      validator: (formPassword) => formPassword!.length > 6 ? null : "Password must be longer than 6 characters",
    );
  }

  Widget _registerButton() {
    return MaterialButton(
      minWidth: _deviceWidth * 0.7,
      height: _deviceHeight * 0.06,
      color: Colors.red,
      onPressed: _registerUser,
      child: const Text("Register", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400)),
    );
  }

  void _registerUser() async {
    if(_registerFormKey.currentState!.validate() && registerAvatar != null){
      _registerFormKey.currentState!.save();
      bool registrationResult = await _firebaseService.registerUser(name: registerName!, email: registerEmail!, password: registerPassword!, image: registerAvatar!);
      
      if(!mounted) return;
      if(registrationResult) Navigator.popAndPushNamed(context, 'login');
    }
  }

}