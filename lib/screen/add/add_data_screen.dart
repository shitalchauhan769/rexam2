import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rexam2_core/screen/modal/studante_screen.dart';
import 'package:rexam2_core/until/global.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtgrid = TextEditingController();
  TextEditingController txtstd = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();
  ImagePicker picker = ImagePicker();
  String? prth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffcda),
      appBar: AppBar(

        title: Text("Add Data Screen",style: TextStyle(color: Colors.white),),
        backgroundColor:Colors.blue ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: formkey,
                child: Column(
                  children: [
                    Stack(alignment: Alignment.center,
                      children: [
                        Align(
                          child: CircleAvatar(
                            backgroundImage: FileImage(File('$prth')),
                            radius: 80,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: IconButton.filled(
                              onPressed: () async {
                                XFile? image = await picker.pickImage(
                                    source: ImageSource.gallery);
                                setState(() {
                                  prth = image!.path;
                                });
                              },
                              icon: Icon(Icons.add)),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: txtgrid,
                      decoration: const InputDecoration(
                          label: Text(
                        "Enter grid",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ),
                      validator: (value) {
                        if(value!.isEmpty)
                        {
                          return "grid is recvide";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: txtname,
                      decoration: const InputDecoration(
                          label: Text(
                        "Enter name",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ),
                      validator: (value) {
                        if(value!.isEmpty)
                        {
                          return "name is recvide";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: txtstd,
                      decoration: const InputDecoration(
                          label: Text(
                        "Enter std",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ),
                      validator: (value) {
                        if(value!.isEmpty)
                        {
                          return "std is recvide";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: () {
                    setState(() {
                      if(formkey.currentState!.validate())
                      {
                        String? grid = txtgrid.text;
                        String? name = txtname.text;
                        String? std = txtstd.text;
                        String? image = prth;
                        StudanteModel s1 = StudanteModel (name, grid, std, image);
                        StudanteList.add(s1);
                        Navigator.pop(context);
                      }
                    });

                    }, child: const Text("submit"))

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
