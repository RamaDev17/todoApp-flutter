import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controll form
    TextEditingController controllerTitle = TextEditingController();
    TextEditingController controllerDesc = TextEditingController();
    print(controllerTitle.text);

    // AppBAr
    AppBar myAppBar = AppBar(
      title: Text("Add Todo"),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );

    // query
    double heightBody = MediaQuery.of(context).size.height -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    double widthBody = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controllerTitle.text.isNotEmpty ||
              controllerDesc.text.isNotEmpty) {
            dataTodo.add(Todo(
                id: DateTime.now().toString(),
                title: controllerTitle.text.length == 0
                    ? "No Title"
                    : controllerTitle.text,
                desc: controllerDesc.text.length == 0
                    ? "No Description"
                    : controllerDesc.text));
            Navigator.pop(context);
          }
        },
        child: Icon(Icons.add_task),
      ),
      appBar: myAppBar,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: widthBody,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white12),
                child: TextField(
                  controller: controllerTitle,
                  maxLength: 20,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                      hintText: "Title", border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: heightBody * 0.04,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white12),
                child: TextField(
                  controller: controllerDesc,
                  maxLines: 10,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                      hintText: "Description", border: InputBorder.none),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
