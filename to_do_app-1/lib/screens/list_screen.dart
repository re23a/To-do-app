import 'package:flutter/material.dart';

import 'package:to_do_app/models/todo_model.dart';
import 'package:to_do_app/services/fun.dart';
import 'package:to_do_app/styles/color_category.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool checkBoxBooleanValueVariable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text("My List")),
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: Colors.amber),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            FutureBuilder<List<Addlist>>(
              future: SupabaseFnction().getToDo(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final notes = snapshot.data!;
                  return notes.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: notes.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Dismissible(
                                background: Container(
                                  color: Colors.red,
                                ),
                                key: ValueKey(notes[index]),
                                onDismissed: (DismissDirection direction) {
                                  SupabaseFnction()
                                      .deleteTask(notes[index].id!);
                                  notes.removeAt(index);
                                  Future.delayed(const Duration(seconds: 1),
                                      () {
                                    setState(() {});
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 110,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(18)),
                                            color: getColorForCategory(
                                                notes[index].categoryTodo),
                                          )),
                                      Container(
                                        height: 110,
                                        width: 330,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(18)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.75),
                                              spreadRadius: 3,
                                              blurRadius: 0,
                                              offset: Offset(2, 2),
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Checkbox(
                                                    activeColor: Colors.black,
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10.0),
                                                      ),
                                                    ),
                                                    value: notes[index]
                                                            .complated ??
                                                        false,
                                                    onChanged: (value) {
                                                      print(value);
                                                      SupabaseFnction()
                                                          .updatTask(
                                                              id: notes[index]
                                                                  .id,
                                                              newstate: value!);
                                                      setState(() {});
                                                    },
                                                  ),
                                                  Text(
                                                      notes[index].title ?? ''),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 17),
                                                child: Text(
                                                    notes[index].description ??
                                                        ''),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 100,
                              ),
                              Image.asset(
                                  "assets/0a4f224b042630049a0592ddd2e7c057.jpg"),
                              const Text("nothing"),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "please create the first reminder",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.amber),
                              ),
                            ],
                          ),
                        );
                } else if (snapshot.hasError) {
                  print(snapshot.error.toString());
                  return const Text("Error");
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
// ListView.builder(
//               shrinkWrap: true,
//               itemBuilder: (context, index) {
//                 return Container(
//                   height: 75,
//                   width: 120,
//                   child: Center(
//                     child: Padding(
//                         padding: const EdgeInsets.fromLTRB(16, 8, 16, 6),
//                         child: Text("testt")),
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.all(Radius.circular(18)),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.amber.withOpacity(0.75),
//                         spreadRadius: 3,
//                         blurRadius: 0,
//                         offset: Offset(2, 2), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             )
//
//
//
//
//import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:to_do_app/models/todo_model.dart';
// import 'package:to_do_app/services/fun.dart';

// class ListScreen extends StatefulWidget {
//   const ListScreen({super.key});

//   @override
//   State<ListScreen> createState() => _ListScreenState();
// }

// class _ListScreenState extends State<ListScreen> {
//   bool checkBoxBooleanValueVariable = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 80,
//             ),
//             FutureBuilder(
//               future: SupabaseFnction().getToDo(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   final notes = snapshot.data!;
//                   return Slidable(
//                     endActionPane:
//                         ActionPane(motion: BehindMotion(), children: [
//                       SlidableAction(
//                         onPressed: (context) {},
//                         icon: Icons.delete_outline,
//                         backgroundColor: Colors.red,
//                       )
//                     ]),
//                     child: Center(
//                       child: Row(
//                         children: [
//                           Container(
//                             height: 110,
//                             width: 20,
//                             decoration: BoxDecoration(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(18)),
//                                 color: notes[].categoryTodo == "importent"
//                                     ? Colors.red
//                                     : Colors.blue),
//                           ),
//                           Container(
//                             height: 110,
//                             width: 360,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 5, horizontal: 10),
//                               child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(children: [
//                                       Checkbox(
//                                         activeColor: Colors.black,
//                                         shape: const RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(
//                                                     10.0))), // Rounded Checkbox
//                                         value: checkBoxBooleanValueVariable,
//                                         onChanged: (inputValue) {
//                                           setState(() {
//                                             notes.complated = inputValue!;
//                                           });
//                                         },
//                                       ),
//                                       Text(notes.title ?? '')
//                                     ]),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 17),
//                                       child: Text(notes.description ?? ''),
//                                     ),
//                                   ]),
//                             ),
//                             decoration: BoxDecoration(
//                               color: Colors.amber,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(18)),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black.withOpacity(0.75),
//                                   spreadRadius: 3,
//                                   blurRadius: 0,
//                                   offset: Offset(
//                                       2, 2), // changes position of shadow
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 } else if (snapshot.hasError) {
//                   print(snapshot.error.toString());
//                   return const Text("error");
//                 }
//                 return const Center(child: CircularProgressIndicator());
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }