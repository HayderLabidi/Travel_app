// ignore_for_file: non_constant_identifier_names

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
  final List<Map<String, String>> Countries = [
    {'name': 'Pelastine', 'flag': 'assets/Countries/ps.png'},
    {'name': 'Canada', 'flag': 'assets/Countries/ca.png'},
    {'name': 'Tunisia', 'flag': 'assets/Countries/tn.png'},
    {'name': 'England', 'flag': 'assets/Countries/ge.png'},
    {'name': 'Italy', 'flag': 'assets/Countries/it.png'},
    {'name': 'Japan', 'flag': 'assets/Countries/jp.png'},
    {'name': 'China', 'flag': 'assets/Countries/cn.png'},
    {'name': 'Brazil', 'flag': 'assets/Countries/br.png'},
    {'name': 'Australia', 'flag': 'assets/Countries/au.png'},
  ];

  List<Map<String, String>> filteredCountries = [];
  bool isSelectionMode = false;
  int? selectedMessageIndex;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCountries = Countries;
    _searchController.addListener(() {
      filterCountries();
    });
  }

  void filterCountries() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredCountries = Countries.where((country) {
        return country['name']!.toLowerCase().contains(query);
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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        actions: [
          if (!isSelectionMode)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  isSelectionMode = true;
                });
              },
            ),
          if (isSelectionMode)
            IconButton(
              icon: const Icon(Icons.cancel),
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
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                labelText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.blueAccent),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCountries.length,
              itemBuilder: (context, index) {
                final country = filteredCountries[index];
                return GestureDetector(
                  onTap: () {
                    if (!isSelectionMode) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ChatPage(userName: country['name']!),
                        ),
                      );
                    } else {
                      setState(() {
                        selectedMessageIndex = index;
                      });

                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: const Icon(Icons.edit, color: Colors.blueAccent),
                                title: const Text('Modify Message'),
                                onTap: () {
                                  // Handle message modification
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.delete, color: Colors.redAccent),
                                title: const Text('Delete Message'),
                                onTap: () {
                                  setState(() {
                                    Countries.removeAt(index);
                                    filteredCountries.removeAt(index);
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
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey[300]!, width: 1.0),
                      ),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(country['flag']!),
                      ),
                      title: Text(
                        country['name']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      tileColor: selectedMessageIndex == index
                          ? Colors.blue.withOpacity(0.1)
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
