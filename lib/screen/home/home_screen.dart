import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rexam2_core/until/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtgrid = TextEditingController();
  TextEditingController txtstd = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffcda),
      appBar: AppBar(
        title: const Text(
          "AppBar",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: List.generate(
                    StudanteList.length,
                    (index) => Container(
                          height: 80,
                          width: 400,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200,
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: FileImage(
                                    File("${StudanteList[index].image}")),
                              ),
                              Text(
                                '${StudanteList[index].grid}',
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Text('${StudanteList[index].name}'),
                                  Text('${StudanteList[index].std}'),
                                ],
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Column(
                                            children: [
                                              Center(
                                                child: AlertDialog(
                                                  alignment: Alignment.center,
                                                  actions: [
                                                    const Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "User Date",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: CircleAvatar(
                                                        backgroundImage:
                                                            FileImage(File(
                                                                "${StudanteList[index].image}")),
                                                      ),
                                                    ),
                                                    TextFormField(
                                                     controller: txtgrid ,
                                                      decoration: InputDecoration(
                                                          label: Text(
                                                              '${StudanteList[index].grid}')),
                                                    ),
                                                    TextFormField(
                                                      controller: txtname ,
                                                      decoration:
                                                          InputDecoration(
                                                        label: Text(
                                                            '${StudanteList[index].name}'),
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      controller: txtstd ,
                                                      decoration:
                                                          InputDecoration(
                                                        label: Text(
                                                            '${StudanteList[index].std}'),
                                                      ),
                                                    ),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          setState(() {

                                                          });
                                                        },
                                                        child: const Text(
                                                            "UpDate")),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          setState(() {});
                                                        },
                                                        child: const Text(
                                                            "Cancel")),
                                                  ],
                                                ),
                                              )
                                            ],
                                          );
                                        },
                                      );
                                    });
                                  },
                                  icon: Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      StudanteList.removeAt(index);
                                    });
                                  },
                                  icon: Icon(Icons.delete)),
                            ],
                          ),
                        )),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: Colors.blue,
        onPressed: () {

            Navigator.pushNamed(context, 'add').then((value) => setState(() {
            }));

        },
        child: Icon(Icons.add),
      ),
    );
  }
}
