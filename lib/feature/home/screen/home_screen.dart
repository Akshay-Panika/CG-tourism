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
import '../../service/screen/place_screen.dart';
import '../widget/profile_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showServicePage = false;
  int _selectedServiceIndex = 0;

  final List<Map<String, dynamic>> placesWithIcons = [
    {"name": "Temple", "icon": Icons.account_balance},
    {"name": "Mountain", "icon": Icons.terrain},
    {"name": "River", "icon": Icons.water},
    {"name": "Palace", "icon": Icons.account_balance_outlined},
    {"name": "Railway Station", "icon": Icons.train},
    {"name": "Stadium", "icon": Icons.sports_soccer},
    {"name": "Restaurant", "icon": Icons.restaurant},
    {"name": "Forest", "icon": Icons.forest},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          leading: _showServicePage ? Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  _showServicePage = false;
                  _selectedServiceIndex = 0;
                });
              },
              child:  Icon(Icons.dashboard, size: 25, color: CustomColor.greenColor,),),
          ) : null,
        leadingWidth: !_showServicePage ?0:40,

          titleWidget: InkWell(
            onTap: () async{
              _showServicePage? null :await picLocationDialog(context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(_showServicePage ? placesWithIcons[_selectedServiceIndex]['name'] :'CG Tourism', style: textStyle16(context, color: CustomColor.greenColor),),
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

      body: _showServicePage
          ? PlaceScreen()
          : CustomScrollView(
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
                            _selectedServiceIndex = index;
                            _showServicePage = true;
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
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold(),)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Your CG Tourism',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: CustomColor.appColor),),
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
