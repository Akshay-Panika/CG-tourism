import 'package:cg_tourism/core/costant/text_style.dart';
import 'package:cg_tourism/feature/search/screen/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/costant/custom_color.dart';
import '../../../core/widget/custom_appbar.dart';
import '../../../core/widget/custom_banner.dart';
import '../../../core/widget/custom_container.dart';
import '../../../core/widget/custom_headline.dart';
import '../../../core/widget/custom_highlight_service.dart';
import '../../../core/widget/custom_search_bar.dart';
import '../../../core/widget/custom_service_list.dart';
import '../../location/widget/pic_location_dialog.dart';
import '../../place/screen/place_screen.dart';
import '../widget/profile_card_widget.dart';

class HomeScreen extends StatefulWidget {
  final String placeName;
  final Function(bool, String) onToggle;
  const HomeScreen({super.key, required this.onToggle, required this.placeName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Map<String, dynamic>> placesWithIcons = [
    {"name": "Temple", "icon": Icons.account_balance},
    {"name": "Mountain", "icon": Icons.terrain},
    {"name": "River", "icon": Icons.water},
    {"name": "Palace", "icon": Icons.account_balance_outlined},
    {"name": "Railway Station", "icon": Icons.train},
    {"name": "Stadium", "icon": Icons.sports_soccer},
    {"name": "Restaurant", "icon": Icons.restaurant},
    {"name": "Forest", "icon": Icons.forest},
    {"name": "Market", "icon": Icons.store},

  ];
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: CustomAppBar(
          titleWidget: InkWell(
            onTap: () async{
             picLocationDialog(context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text('CG Tourism', style: textStyle16(context, color: CustomColor.greenColor),),
                SizedBox(height: 2),
                Text(
                  "Waidhan Singrauli Madhya Pradesh Pin- 486886",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        showNotificationIcon: true,
        //showFavoriteIcon: true,
      ),
      body: CustomScrollView(
        slivers: [

          /// Profile card
          SliverToBoxAdapter(child: ProfileCardWidget(),),

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

          /// Data
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomBanner(),
                const SizedBox(height: 5),

                /// Services
                CustomHeadline(headline: 'Place',),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: placesWithIcons.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.11 / 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10
                    ),
                    itemBuilder: (context, index) {
                      return CustomContainer(
                        onTap: () {
                          setState(() {
                            widget.onToggle(false,placesWithIcons[index]['name']);
                          });
                        },
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        backgroundColor: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                             Expanded(child: CustomContainer(
                               backgroundColor: Colors.transparent,
                              child: Icon(placesWithIcons[index]['icon'], size: 30, color: CustomColor.greenColor,),
                            )),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(placesWithIcons[index]['name'],
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
                const SizedBox(height: 20),

                CustomServiceList(headline: 'Suggestion for you',),

                /// Custom Highlight Service
                CustomHighlightService(),

                CustomServiceList(headline: 'Popular Location',),


                CustomContainer(
                  width: double.infinity,
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  backgroundColor: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Your CG Tourism',style: textStyle18(context,fontWeight: FontWeight.bold, color: CustomColor.greenColor),),
                          SizedBox(height: 5,),
                          Text('Your friend are going to love us tool', style: TextStyle(fontSize: 14),),
                          SizedBox(height: 5,),
                          Text('Refer And Win up to ____', style: TextStyle(fontSize: 16, color: CustomColor.iconColor, fontWeight: FontWeight.w600),),
                        ],
                      ),
                      Image.asset('assets/image/inviteFrnd.png',height: 200,width: double.infinity,)
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
