import 'package:cg_tourism/core/costant/custom_color.dart';
import 'package:cg_tourism/core/costant/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/widget/custom_container.dart';
import '../../../core/widget/custom_service_list.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomContainer(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search here...',
              hintStyle: const TextStyle(fontSize: 16),
              prefixIcon:  Icon(CupertinoIcons.search, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon:  Icon(Icons.close, color: CustomColor.iconColor),
            onPressed: () => Navigator.pop(context),
          ),
          SizedBox(width: 10,),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding( padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Recent Searches', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
                     Text('Clear', style: textStyle14(context,color: CustomColor.descriptionColor),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Wrap(
                  spacing: 8,
                  children: List.generate(5, (index) {
                    return Chip(
                      backgroundColor: Colors.white,
                      label: Text('Search $index'),
                      deleteIcon: const Icon(Icons.close, size: 16),
                      onDeleted: () {
                        // Handle delete
                      },
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20),
          
              /// Popular Services
              CustomServiceList(headline: 'Popular Location',),
              SizedBox(height: 20,),

              /// Popular Services
              CustomServiceList(headline: 'Requirement Location',),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
