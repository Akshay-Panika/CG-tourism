import 'package:cg_tourism/core/costant/custom_color.dart';
import 'package:cg_tourism/core/widget/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/widget/custom_search_bar.dart';
import '../../search/screen/search_screen.dart';

class PlaceScreen extends StatefulWidget {
  late  bool showServicePage;
  final String headline;
   PlaceScreen({super.key, required this.showServicePage, required this.headline});

  @override
  State<PlaceScreen> createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '${widget.headline}',
        leading: IconButton(onPressed: () {
       setState(() {
         widget.showServicePage = false;
       });
      }, icon: Icon(Icons.dashboard, color: CustomColor.greenColor,)),
      ),

      body: CustomScrollView(
        slivers: [
          /// Search bar
          SliverAppBar(
            toolbarHeight: 60,
            floating: true,
            backgroundColor: Colors.grey.shade100,
            flexibleSpace: CustomSearchBar(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  SearchScreen()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
