import 'package:cg_tourism/core/costant/dimension.dart';
import 'package:cg_tourism/core/costant/text_style.dart';
import 'package:cg_tourism/core/widget/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/costant/custom_color.dart';
import '../../../core/widget/custom_container.dart';
import '../../../core/widget/custom_headline.dart';
import '../../service/screen/place_subcategory_screen.dart';

class DistrictsScreen extends StatefulWidget {
  const DistrictsScreen({super.key});

  @override
  State<DistrictsScreen> createState() => _DistrictsScreenState();
}

class _DistrictsScreenState extends State<DistrictsScreen> {


  List<Map<String, dynamic>> chhattisgarhDistrictsWithIcons = [
    {"name": "Balod", "icon": Icons.location_city},
    {"name": "Baloda Bazar-Bhatapara", "icon": Icons.location_city},
    {"name": "Balrampur-Ramanujganj", "icon": Icons.location_city},
    {"name": "Bastar", "icon": Icons.location_city},
    {"name": "Bemetara", "icon": Icons.location_city},
    {"name": "Bijapur", "icon": Icons.location_city},
    {"name": "Bilaspur", "icon": Icons.location_city},
    {"name": "Dantewada", "icon": Icons.location_city},
    {"name": "Dhamtari", "icon": Icons.location_city},
    {"name": "Durg", "icon": Icons.location_city},
    {"name": "Gariaband", "icon": Icons.location_city},
    {"name": "Gaurela-Pendra-Marwahi", "icon": Icons.location_city},
    {"name": "Janjgir-Champa", "icon": Icons.location_city},
    {"name": "Jashpur", "icon": Icons.location_city},
    {"name": "Kabirdham (Kawardha)", "icon": Icons.location_city},
    {"name": "Kanker", "icon": Icons.location_city},
    {"name": "Khairagarh-Chhuikhadan-Gandai", "icon": Icons.location_city},
    {"name": "Kondagaon", "icon": Icons.location_city},
    {"name": "Korba", "icon": Icons.location_city},
    {"name": "Koriya", "icon": Icons.location_city},
    {"name": "Mahasamund", "icon": Icons.location_city},
    {"name": "Manendragarh-Chirmiri-Bharatpur", "icon": Icons.location_city},
    {"name": "Mohla-Manpur-Ambagarh Chowki", "icon": Icons.location_city},
    {"name": "Mungeli", "icon": Icons.location_city},
    {"name": "Narayanpur", "icon": Icons.location_city},
    {"name": "Raigarh", "icon": Icons.location_city},
    {"name": "Raipur", "icon": Icons.location_city},
    {"name": "Rajnandgaon", "icon": Icons.location_city},
    {"name": "Sakti", "icon": Icons.location_city},
    {"name": "Sarangarh-Bilaigarh", "icon": Icons.location_city},
    {"name": "Sukma", "icon": Icons.location_city},
    {"name": "Surajpur", "icon": Icons.location_city},
    {"name": "Surguja", "icon": Icons.location_city},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'District',showSearchIcon: true,),

      body: Column(
        children: [


          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              itemCount: chhattisgarhDistrictsWithIcons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.11 / 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return CustomContainer(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  backgroundColor: Colors.white,
                  onTap: () => Navigator.push(context,  MaterialPageRoute(builder: (context) => PlaceSubcategoryScreen(),)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: CustomContainer(
                        backgroundColor: Colors.transparent,
                        child: Icon(chhattisgarhDistrictsWithIcons[index]['icon'], size: 30, color: CustomColor.greenColor,),
                      )),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(chhattisgarhDistrictsWithIcons[index]['name'],
                          style: textStyle12(context, color: CustomColor.greenColor),
                          textAlign: TextAlign.center,
                        ),
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
