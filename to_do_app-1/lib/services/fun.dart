import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do_app/models/todo_model.dart';

class SupabaseFnction {
  // getToDo() async {
  //   final supabase = Supabase.instance.client;
  //   final data = await supabase.from('todo').select('*');

  //   log(data.toString());
  // }

  Future<List<Addlist>> getToDo() async {
    final supabase = Supabase.instance.client;

    final List data = await supabase.from('todo').select('*');
    List<Addlist> toDoList = [];
    for (var element in data) {
      toDoList.add(Addlist.fromJson(element));
    }
    log(data.toString());
    return toDoList;
  }

  addNewTask(Map body) async {
    final supabase = Supabase.instance.client;
    await supabase.from('todo').insert(body);
  }

  deleteTask(int id) async {
    final supabase = Supabase.instance.client;
    await supabase.from('todo').delete().eq('id', id);
  }

  updatTask({required bool newstate, required id}) async {
    final supabase = Supabase.instance.client;
    await supabase.from('todo').update({'complated': newstate}).eq('id', id);
  }
}
