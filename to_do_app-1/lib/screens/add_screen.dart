import 'package:flutter/material.dart';
import 'package:to_do_app/models/todo_model.dart';

import 'package:to_do_app/services/fun.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController tcontroller = TextEditingController();
  TextEditingController dcontroller = TextEditingController();
  TextEditingController ccontroller = TextEditingController();
  List<Addlist> toDoList = [];
  final List<String> items = [
    'important',
    'event',
    'appintment',
    'Meeting',
    'other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Container(
                  height: 42,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.amber.withOpacity(0.75),
                        spreadRadius: 3,
                        blurRadius: 0,
                        offset:
                            const Offset(2, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 6),
                      child: TextField(
                        controller: tcontroller,
                        decoration: const InputDecoration.collapsed(
                          hintText: "Titel",
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 92,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.amber.withOpacity(0.75),
                        spreadRadius: 3,
                        blurRadius: 0,
                        offset: Offset(2, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 6),
                      child: TextField(
                        controller: dcontroller,
                        decoration: const InputDecoration.collapsed(
                          hintText: "Description",
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: const Row(
                        children: [
                          Icon(
                            Icons.check_box_outline_blank_rounded,
                            size: 20,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              'Category',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: items
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Row(
                                  children: [
                                    const Icon(Icons.check_box_outline_blank_rounded,
                                        size: 25, color: Colors.grey),
                                    Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                      value: ccontroller.text.isNotEmpty &&
                              items.contains(ccontroller.text)
                          ? ccontroller.text
                          : null,
                      onChanged: (value) {
                        setState(() {
                          ccontroller.text = value.toString();
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 50,
                        width: 207,
                        padding: const EdgeInsets.only(left: 20, right: 14),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            color: Colors.white),
                        elevation: 2,
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                        iconSize: 14,
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.black,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        offset: const Offset(-20, 0),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all(6),
                          thumbVisibility: MaterialStateProperty.all(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          InkWell(
            onTap: () async {
              try {
                final response = await SupabaseFnction().addNewTask({
                  "title": tcontroller.text.trim(),
                  "description": dcontroller.text.trim(),
                  "complated": false,
                  "category_todo": ccontroller.text.trim()
                });
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Saved Successfully")));
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => ListScreen()));
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ${e.toString()}')));
              }
            },
            child: Container(
              height: 50,
              width: 190,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(18)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.75),
                    spreadRadius: 3,
                    blurRadius: 0,
                    offset: Offset(2, 2), // changes position of shadow
                  ),
                ],
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(27, 8, 16, 6),
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      Text(
                        "New Task",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
