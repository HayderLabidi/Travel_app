import 'package:flutter/material.dart';
import 'package:travel/Homepage/profile_settings/setting.dart';
import 'package:travel/elementHome/destination_hor.dart';
import 'package:travel/elementHome/destination_model.dart';
import 'package:travel/elementHome/destination_ver.dart';
import 'package:travel/elementHome/detail.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int selectedPage = 0;
  List<IconData> icons = [
    Icons.home,
    Icons.search,
    Icons.confirmation_number_outlined,
    Icons.bookmark_outline_rounded,
    Icons.person_outline_rounded
  ];
  List<Destination> popular =
      destinations.where((element) => element.category == 'popular').toList();
  List<Destination> recomend =
      destinations.where((element) => element.category == 'recommend').toList();

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<Destination> filteredPopular = popular
        .where((destination) =>
            destination.name?.toLowerCase().contains(searchQuery.toLowerCase()) ?? false)
        .toList();
    List<Destination> filteredRecomend = recomend
        .where((destination) =>
            destination.name?.toLowerCase().contains(searchQuery.toLowerCase()) ?? false)
        .toList();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 232, 232),
      appBar: AppBar(
        title: const Text("Home"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('User Name'),
              accountEmail: Text('user@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.blue),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.dark_mode_outlined),
              title: const Text('Dark mode'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Languages'),
              onTap: () {
                Navigator.pop(context);
            
              },
            ),
            
            // Add more ListTiles for other drawer items
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                onChanged: (query) {
                  setState(() {
                    searchQuery = query;
                    print('Search Query: $searchQuery'); // Debugging
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular place',
                    style: TextStyle(
                        fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                        fontSize: 12, color: Colors.blue, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: List.generate(
                  filteredPopular.length,
                  (index) => Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(left: 10, right: 10)
                        : const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(destination: filteredPopular[index])));
                      },
                      child: DestinationHor(
                        destination: filteredPopular[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recomendation for you',
                    style: TextStyle(
                        fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                        fontSize: 12, color: Colors.blue, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: List.generate(
                  filteredRecomend.length,
                  (index) => Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(top: 15, bottom: 15)
                        : const EdgeInsets.only(bottom: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(
                                    destination: filteredRecomend[index])));
                      },
                      child: DestinationVer(
                        destination: filteredRecomend[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
