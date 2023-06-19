import 'package:flutter/material.dart';
import 'package:flutter_everyday/todoappwithprovider/provider/todoapp_provider.dart';
import 'package:provider/provider.dart';

class TodoAppWithProvider extends StatefulWidget {
  const TodoAppWithProvider({super.key});

  @override
  State<TodoAppWithProvider> createState() => _TodoAppWithProviderState();
}

class _TodoAppWithProviderState extends State<TodoAppWithProvider> {
  TextEditingController todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoAppProvider>(
      builder: (context, todoappProvider, child) => Scaffold(
        appBar: AppBar(
          title: const Text("TodoAppWithProvider"),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          itemCount: todoappProvider.todos.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              color: Colors.grey.shade300,
              child: ListTile(
                title: Text(todoappProvider.todos[index]),
                trailing: InkWell(
                    onTap: () {
                      todoappProvider.removeTodo(index);
                    },
                    child: const Icon(
                      Icons.delete,
                    )),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: TextField(
                    controller: todoController,
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text("Cancel"),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          todoappProvider.addTodo(todoController.text);
                          todoController.clear();
                          Navigator.pop(context);
                        },
                        child: const Text("Add"))
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
