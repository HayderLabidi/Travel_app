import 'package:flutter/material.dart';
import 'package:travel/elementHome/destination_model.dart';
import 'package:travel/elementHome/destination_ver.dart';
import 'package:travel/elementHome/detail.dart';
import 'package:travel/elementHome/saveddes.dart';

class Saved extends StatelessWidget {
  const Saved({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved'),
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      ),
      body: SavedDestinations.savedList.isEmpty
          ? const Center(
              child: Text('No saved items'),
            )
          : ListView.builder(
              itemCount: SavedDestinations.savedList.length,
              itemBuilder: (context, index) {
                Destination destination = SavedDestinations.savedList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(destination: destination),
                      ),
                    );
                  },
                  child: DestinationVer(destination: destination),
                );
              },
            ),
    );
  }
}
