import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel/elementHome/destination_model.dart'; // Make sure you have this model defined
import 'package:travel/login.dart'; // Import the Login page
import 'destination_ver.dart'; // Import the DestinationVer widget

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _formKey = GlobalKey<FormState>();
  final List<Destination> _destinations = [];
  List<File?> _images = [null, null, null];
  final ImagePicker _picker = ImagePicker();

  String? _name;
  String? _location;
  String? _category;
  String? _description;

  Future<void> _pickImage(int index) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _images[index] = File(pickedFile.path);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _destinations.add(Destination(
          name: _name,
          location: _location,
          category: _category,
          description: _description,
          image: _images.map((img) => img?.path).toList().where((path) => path != null).cast<String>().toList(),
          price: 100,
          rate: 5,
          review: 10,
        ));
      });
      _formKey.currentState!.reset();
      _images = [null, null, null];
    }
  }

  void _deleteDestination(int index) {
    setState(() {
      _destinations.removeAt(index);
    });
  }

  void _logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Destination'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _destinations.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(_destinations[index].name!),
                    onDismissed: (direction) {
                      _deleteDestination(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Destination deleted')),
                      );
                    },
                    background: Container(color: Colors.red),
                    child: DestinationVer(destination: _destinations[index]),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(3, (index) {
                        return GestureDetector(
                          onTap: () => _pickImage(index),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                            ),
                            child: _images[index] != null
                                ? Image.file(
                                    _images[index]!,
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(Icons.add_a_photo, size: 50),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _name = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Location'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a location';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _location = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Category'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a category';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _category = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      maxLines: 4,
                      decoration: const InputDecoration(labelText: 'Description'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _description = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
