import 'package:easy_whats/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../provider/provider_setting.dart';
import '../../styles/colors.dart';

class Drawer_Screen extends StatelessWidget {

   var formKey = GlobalKey<FormState>();
   late SettingProvider  setting ;
  @override
  Widget build(BuildContext context) {
     setting = Provider.of<SettingProvider>(context);
    return Form(
      key: formKey,
      child: Drawer(
        backgroundColor: setting.colorSystem[setting.colorNumber],
        width: MediaQuery.of(context).size.width * 0.5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: setting.colorSystem[setting.colorNumber],
            centerTitle: true,
            title: Text(
              'easy message',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
              ),
            ),
          ),
          backgroundColor: setting.colorSystem[setting.colorNumber],
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Container()),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: setting.colorSystem[setting.colorNumber] ==
                                setting.colorSystem[0]
                            ? MASTERDRAWER
                            : setting.colorSystem[setting.colorNumber],
                      ),
                      child: CircleAvatar(
                        child: Text('1'),
                        backgroundColor: MASTERCOLOR,
                      ),
                    ),
                    onTap: () {
                      setting.systemColorChange(0);
                      sharedPreferences.setInt('colorSystemIndex', 0);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: setting.colorSystem[setting.colorNumber] ==
                                setting.colorSystem[1]
                            ? MASTERDRAWER
                            : setting.colorSystem[setting.colorNumber],
                      ),
                      child: CircleAvatar(
                        child: Text('2'),
                        backgroundColor: MASTERCOLORTOW,
                      ),
                    ),
                    onTap: () {
                      setting.systemColorChange(1);
                      sharedPreferences.setInt('colorSystemIndex', 1);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: setting.colorSystem[setting.colorNumber] ==
                                setting.colorSystem[2]
                            ? MASTERDRAWER
                            : setting.colorSystem[setting.colorNumber],
                      ),
                      child: CircleAvatar(
                        child: Text('3'),
                        backgroundColor: MASTERCOLORTHREE,
                      ),
                    ),
                    onTap: () {
                      setting.systemColorChange(2);
                      sharedPreferences.setInt('colorSystemIndex', 2);
                    },
                  ),
                ),
                Expanded(child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 40,
                      child: TextFormField(
                        controller: setting.controller,
                        keyboardType: TextInputType.number,
                       validator: (value) {
                         if(value!.length<2||value.length>4){
                           return "خطاء بكود الدولة";
                         }
                         else null;
                       },
                        onChanged: (value){
                     codeInter();

                        },
                      ),
                    ),
                    Text('كود الدولة',style: Theme.of(context).textTheme.headline1,),
                  ],
                ),
                SizedBox(height: 10,),
                Text(
                  'Mohammed Zewin',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void codeInter() {
    if(formKey.currentState!.validate()){
      sharedPreferences.setString('code', setting.controller.text);
    }

  }
}
