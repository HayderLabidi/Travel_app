import 'package:flutter/material.dart';
import 'package:travel/elementHome/chat.dart';

void main() {
  runApp(const MaterialApp(
    home: MessengerPage(),
  ));
}

class MessengerPage extends StatefulWidget {
  const MessengerPage({super.key});

  @override
  _MessengerPageState createState() => _MessengerPageState();
}

class _MessengerPageState extends State<MessengerPage> {
  final List<String> users = ['Alice', 'Bob', 'Charlie', 'Dave', 'Eve'];
  List<String> filteredUsers = [];
  bool isSelectionMode = false;
  int? selectedMessageIndex;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredUsers = users;
    _searchController.addListener(() {
      filterUsers();
    });
  }

  void filterUsers() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredUsers = users.where((user) {
        return user.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        centerTitle: true,
        actions: [
          if (!isSelectionMode)
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  isSelectionMode = true;
                });
              },
            ),
          if (isSelectionMode)
            IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                setState(() {
                  isSelectionMode = false;
                  selectedMessageIndex = null;
                });
              },
            ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (!isSelectionMode) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatPage(userName: filteredUsers[index]),
                        ),
                      );
                    } else {
                      setState(() {
                        selectedMessageIndex = index;
                      });

                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.edit),
                                title: Text('Modify Message'),
                                onTap: () {
                                  // Handle message modification
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.delete),
                                title: Text('Delete Message'),
                                onTap: () {
                                  setState(() {
                                    users.removeAt(index);
                                    filteredUsers.removeAt(index); // Also update filtered list
                                    selectedMessageIndex = null;
                                    isSelectionMode = false;
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  onLongPress: () {
                    setState(() {
                      isSelectionMode = true;
                      selectedMessageIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage('assets/user.png'),
                      ),
                      title: Text(filteredUsers[index]),
                      tileColor: selectedMessageIndex == index
                          ? Colors.teal.withOpacity(0.2)
                          : null,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
