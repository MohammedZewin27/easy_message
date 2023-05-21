import 'package:easy_whats/generated/assets.dart';
import 'package:easy_whats/layout/home_layout/drawer_screen.dart';
import 'package:easy_whats/provider/provider_setting.dart';
import 'package:easy_whats/styles/colors.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../main.dart';
import '../../provider/provider_massage.dart';
import '../../provider/provider_whatsapp.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = "HomeLayout";

  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var providerMassage = Provider.of<MessageProvider>(context);
    var setting = Provider.of<SettingProvider>(context);
    bool d = sharedPreferences.getBool('drawer') ?? false;
    return Stack(
      children: [
        Image.asset(
          Assets.imageBack,
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          backgroundColor: START,
          appBar: AppBar(
            actions: [
              setting.icons[providerMassage.currentIndex],
            ],
            title:
            Text(providerMassage.title[providerMassage.currentIndex]),
            backgroundColor: setting.colorSystem[setting.colorNumber],
          ),
          bottomNavigationBar: SalomonBottomBar(
              onTap: (value) {
                providerMassage.changeCurrentIndex(value);
              },
              backgroundColor: setting.colorSystem[setting.colorNumber],
              currentIndex:providerMassage.currentIndex ,
              selectedItemColor: setting.cardColor[setting.colorNumber],
              unselectedItemColor: Colors.white,
              selectedColorOpacity: .5,
              items: [
                SalomonBottomBarItem(
                  icon: ImageIcon(AssetImage(Assets.imageIconWhatsapp2)),
                  activeIcon: ImageIcon(AssetImage(Assets.imageIconWhatsapp1),color:  Colors.white),
                  title: Text('واتس اب',style: TextStyle(color:Colors.white)),
                ),
                SalomonBottomBarItem(
                  icon: Icon(Icons.sms_outlined),
                  activeIcon: Icon(Icons.sms,color: Colors.white),
                  title: Text('الرسائل',style: TextStyle(color:Colors.white)),
                ),

                SalomonBottomBarItem(
                  icon: Icon(Icons.email_outlined),
                  activeIcon: Icon(Icons.email,color: Colors.white,),
                  title: Text('الايميل',style: TextStyle(color:Colors.white)),
                ),
                SalomonBottomBarItem(
                  icon: Icon(Icons.save_as_outlined,),
                  activeIcon: Icon(Icons.save_as,color: Colors.white,),
                  title: Text('المحفوظات',style: TextStyle(color:Colors.white),),

                ),
              ]),
          // BottomNavigationBar(
          //     onTap: (value) {
          //       providerMassage.changeCurrentIndex(value);
          //     },
          //     backgroundColor: setting.colorSystem[setting.colorNumber],
          //     currentIndex: providerMassage.currentIndex,
          //     items: [
          //       BottomNavigationBarItem(
          //           icon: ImageIcon(AssetImage(Assets.imageIconWhatsapp2)),
          //           activeIcon:ImageIcon(AssetImage(Assets.imageIconWhatsapp1)) ,
          //           label: 'واتس اب',
          //           backgroundColor:
          //               setting.colorSystem[setting.colorNumber]),
          //       BottomNavigationBarItem(
          //           icon: Icon(Icons.sms_outlined),
          //           activeIcon:Icon(Icons.sms) ,
          //           label: 'الرسائل',
          //           backgroundColor:
          //               setting.colorSystem[setting.colorNumber]),
          //       BottomNavigationBarItem(
          //           icon: Icon(Icons.email_outlined),
          //           activeIcon:Icon(Icons.email) ,
          //           label: 'الايميل',
          //           backgroundColor:
          //               setting.colorSystem[setting.colorNumber]),
          //       BottomNavigationBarItem(
          //           icon: Icon(Icons.save_as_outlined),
          //           activeIcon: Icon(Icons.save_as),
          //           label: 'المحفوظات',
          //           backgroundColor:
          //               setting.colorSystem[setting.colorNumber]),
          //     ]),
          body: providerMassage.screen[providerMassage.currentIndex],
          drawer: Drawer_Screen(),
        ),
      ],
    );
  }
}
