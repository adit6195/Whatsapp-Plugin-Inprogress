import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsappplugin_in_progress/ThemeModel.dart';
import 'package:whatsappplugin_in_progress/settings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String dialCode = "91";
  void _onCountryChange(CountryCode countryCode) {
    dialCode = countryCode.toString();
  }

  TextEditingController _numberController = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  _launchUrl(String number, messgae) async {
    var url = 'whatsapp://send?phone=' + dialCode + number + '&text=' + messgae;
    Uri myUri = Uri.parse(url);
    if (await canLaunchUrl(myUri)) {
      await launchUrl(myUri);
    } else {
      throw "Could Not launch";
    }
  }

  SelectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => SettingScrren()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            PopupMenuButton(
              color: themeNotifier.isDark ? Colors.white : Color(0xff1F2C34),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  child: Text(
                    'Settings',
                    style: TextStyle(
                      color: themeNotifier.isDark ? Colors.black : Colors.white,
                    ),
                  ),
                  value: 0,
                ),
              ],
              onSelected: (item) => SelectedItem(context, item),
            )
          ],
          title: Text(
            "WhatsApp Plugin",
            style: TextStyle(
                color: themeNotifier.isDark ? Colors.white : Color(0xff8596a0),
                fontWeight: FontWeight.w500,
                fontSize: 23),
          ),
          backgroundColor:
              themeNotifier.isDark ? Color(0xff008069) : Color(0xff1F2C34),
        ),
        backgroundColor:
            themeNotifier.isDark ? Colors.white : Color(0xff121b22),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                              child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 8),
                            child: Text("Country Code",
                                style: TextStyle(
                                  color: themeNotifier.isDark
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 18,
                                )),
                          )),
                          Container(
                              child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8, right: 8, left: 17),
                            child: Text("WhatsApp Number",
                                style: TextStyle(
                                  color: themeNotifier.isDark
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 18,
                                )),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 59,
                            width: 130,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff00a884)),
                                borderRadius: BorderRadius.circular(6)),
                            child: CountryCodePicker(
                              padding: EdgeInsets.all(2),
                              alignLeft: true,
                              // barrierColor: Colors.amber,
                              //alignLeft: true,
                              initialSelection: "IN",
                              textStyle: TextStyle(
                                color: themeNotifier.isDark
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              onChanged: _onCountryChange,
                              showCountryOnly: true,
                              showFlag: true,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 59,
                            width: 200,
                            child: Form(
                              key: _formkey,
                              child: TextFormField(
                                validator: (value) {
                                  if (value != null && value.length == 10) {
                                    return null;
                                  }
                                  return "Invalid Number";
                                },
                                cursorColor: Color(0xff00a884),
                                style: TextStyle(
                                  color: themeNotifier.isDark
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                controller: _numberController,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff00a884),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff00a884),
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      ),
                                    ),
                                    fillColor: Colors.black,
                                    alignLabelWithHint: true,
                                    labelText: "Number",
                                    labelStyle: TextStyle(
                                      color: themeNotifier.isDark
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                    hintStyle:
                                        TextStyle(color: Color(0xff87959e))),
                                //maxLength: 10,
                                keyboardType: TextInputType.phone,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Type your Message",
                          style: TextStyle(
                            color: themeNotifier.isDark
                                ? Colors.black
                                : Colors.white,
                            fontSize: 18,
                          )),
                    )),
                    SizedBox(
                      height: 13,
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      cursorColor: Color(0xff00a884),
                      style: TextStyle(
                        color:
                            themeNotifier.isDark ? Colors.black : Colors.white,
                      ),
                      controller: _messageController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff00a884),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff00a884),
                            ),
                          ),
                          alignLabelWithHint: true,
                          labelText: "Message",
                          labelStyle: TextStyle(
                            color: themeNotifier.isDark
                                ? Colors.black
                                : Colors.white,
                          ),
                          hintStyle: TextStyle(color: Color(0xff87959e))),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff00a884),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Message',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            _launchUrl(_numberController.text,
                                _messageController.text);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
