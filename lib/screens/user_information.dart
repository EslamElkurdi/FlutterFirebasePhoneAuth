import 'dart:io';

import 'package:flutter/material.dart';

class UserInformationScreen  extends StatefulWidget {
  const UserInformationScreen ({Key? key}) : super(key: key);

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {

 File? image;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final bioController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    bioController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 5.0),
          child: Center(
            child: Column(
              children:
              [
                InkWell(
                  onTap: (){},
                  child: image == null
                  ? const CircleAvatar(
                    backgroundColor: Colors.purple,
                    radius: 50,
                    child: Icon(
                      Icons.account_circle,
                      size: 50,
                      color: Colors.white,
                    ),
                  )
                  : CircleAvatar(
                    backgroundImage: FileImage(image!),
                    radius: 50,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
