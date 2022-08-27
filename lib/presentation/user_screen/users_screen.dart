import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:with_provider/dataLayer/db/cached_user_model.dart';
import 'package:with_provider/view_models/user_view_model.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController countController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<UserViewModel>(context, listen: false).getUserDataAndSave();
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  actions: [
                    TextField(
                      decoration: const InputDecoration(
                        hintText: "name",
                      ),
                      controller: nameController,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: "age",
                        
                      ),
                      controller: ageController,
                      keyboardType: TextInputType.phone,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: "count",
                      ),
                      controller: countController,
                      keyboardType: TextInputType.phone,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "No",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            CachedUser cachedUser = CachedUser(
                              age: int.parse(ageController.text),
                              name: nameController.text,
                              count: int.parse(countController.text),
                            );
                            context
                                .read<UserViewModel>()
                                .addUserDataSave(cachedUser);
                            countController.clear();
                            nameController.clear();
                            ageController.clear();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Ok",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              context.read<UserViewModel>().deleteAllUsers();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Column(
        children: [
          Consumer<UserViewModel>(
            builder: (context, userViewModel, child) {
              return userViewModel.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: ListView(
                        children: List.generate(
                          userViewModel.cachedUsers.length,
                          (index) {
                            CachedUser cachedUser =
                                userViewModel.cachedUsers[index];
                            return Card(
                              child: ListTile(
                                title: Text("name :  ${cachedUser.name}"),
                                subtitle: Text( "age  ${cachedUser.age.toString()}"),
                                trailing:
                                    Text("count :  ${cachedUser.count.toString()}"),
                              ),
                            );
                          },
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
