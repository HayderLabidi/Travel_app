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
  final List<Map<String, String>> countries = [
    {'name': 'Pelastine', 'flag': 'assets/countries/ps.png'},
    {'name': 'Canada', 'flag': 'assets/countries/ca.png'},
    {'name': 'England', 'flag': 'assets/countries/ge.png'},
    {'name': 'Italy', 'flag': 'assets/countries/it.png'},
    {'name': 'Tunisia', 'flag': 'assets/countries/tn.png'},
    {'name': 'Japan', 'flag': 'assets/countries/jp.png'},
    {'name': 'China', 'flag': 'assets/countries/cn.png'},
    {'name': 'Brazil', 'flag': 'assets/countries/br.png'},
    {'name': 'Australia', 'flag': 'assets/countries/au.png'},
  ];
  
  List<Map<String, String>> filteredCountries = [];
  bool isSelectionMode = false;
  int? selectedMessageIndex;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCountries = countries;
    _searchController.addListener(() {
      filterCountries();
    });
  }

  void filterCountries() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredCountries = countries.where((country) {
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
      backgroundColor: const Color.fromARGB(255, 232, 232, 232),
      appBar: AppBar(
        title: const Text('Messages'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(173, 4, 99, 108),
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
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
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
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: const Icon(Icons.edit),
                                title: const Text('Modify Message'),
                                onTap: () {
                                  // Handle message modification
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.delete),
                                title: const Text('Delete Message'),
                                onTap: () {
                                  setState(() {
                                    countries.removeAt(index);
                                    filteredCountries.removeAt(
                                        index); // Also update filtered list
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
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                           radius: 25,
                          backgroundImage: AssetImage(country['flag']!),
                        ),
                        title: Text(country['name']!),
                        tileColor: selectedMessageIndex == index
                            ? Colors.teal.withOpacity(0.2)
                            : null,
                      ),
                      const Divider(
                        height: 18,
                        color: Colors.grey,
                      ),
                    ],
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
