import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsappplugin_in_progress/ThemeModel.dart';

class SettingScrren extends StatefulWidget {
  const SettingScrren({Key? key}) : super(key: key);

  @override
  State<SettingScrren> createState() => _SettingScrrenState();
}

class _SettingScrrenState extends State<SettingScrren> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: Text(
            "Settings",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 23),
          ),
          backgroundColor:
              themeNotifier.isDark ? Color(0xff008069) : Color(0xff1F2C34),
        ),
        backgroundColor:
            themeNotifier.isDark ? Colors.white : Color(0xff121b22),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                          child: Icon(
                        Icons.mode_night_outlined,
                        color: Color(0xff8596a0),
                        size: 40,
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Night Mode",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: themeNotifier.isDark
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              child: Text(
                                "Inhance your Experience \nwith Night Mode",
                                style: TextStyle(
                                  color: Color(0xff8596a0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        child: Switch.adaptive(
                          activeColor: Color(0xff00a884),
                          value: themeNotifier.isDark ? false : true,
                          onChanged: (value) {
                            themeNotifier.isDark
                                ? themeNotifier.isDark = false
                                : themeNotifier.isDark = true;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
