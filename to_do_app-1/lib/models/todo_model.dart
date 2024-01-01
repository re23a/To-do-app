class Addlist {
  int? id;
  String? title;
  String? description;
  bool? complated;
  String? categoryTodo;

  Addlist(
      {this.id,
      this.title,
      this.description,
      this.complated,
      this.categoryTodo});

  Addlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    complated = json['complated'];
    categoryTodo = json['category_todo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['complated'] = this.complated;
    data['category_todo'] = this.categoryTodo;
    return data;
  }
}
