
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxsys_mobile/landing_page.dart';

import 'package:rxsys_mobile/profile_page.dart';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:url_launcher/url_launcher.dart';


void main() => runApp(
    MaterialApp(
        routes: {
          '/': (BuildContext context) => MyApp(),
          '/profile_page': (BuildContext context) => ProfilePage(),
        }
    )
    );

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String _linkMessage;
  bool _isCreatingLink = false;
  String _testString =
      "Click to generate the link";

  @override
  void initState() {
    super.initState();
    initDynamicLinks();
  }

  void initDynamicLinks() async {
    final PendingDynamicLinkData data =
    await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      Navigator.pushNamed(context,  deepLink.path);
    }

    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
          final Uri deepLink = dynamicLink?.link; // dynamicLink?.link is getting from link: in parameters

          // testing
//          print("dynamicLink?.link = ${dynamicLink?.link}");

          if (deepLink != null) {
            Navigator.pushNamed(context, deepLink.path);
//            Navigator.pushNamed(context, "profile_page");
            print("deeplink.path = ${deepLink.path}");
          }
        }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });
  }


  Future<void> _createDynamicLink(bool short) async {
    setState(() {
      _isCreatingLink = true;
    });



  final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: "https://rxsys.page.link",
      link: Uri.parse("https://tinhtranflutter.rxsys_mobile.com/profile_page"), // this is the deep link
//      link: Uri.parse("https://example.com/anything"),

      androidParameters: AndroidParameters(
        packageName: "com.tinhtranflutter.rxsys_mobile",
        minimumVersion: 0,
      ),
      iosParameters: IosParameters(
        bundleId: "com.tinhtranflutter.rxsysMobile",
        minimumVersion: "1.0.0",
        appStoreId: "962194608",
      ),
      dynamicLinkParametersOptions: DynamicLinkParametersOptions(
        shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: "Testing Dynamic Links",
        description: "Dynamic Links using Flutter API",
      ));

  Uri url;

  if (short) {
    ShortDynamicLink shortLink = await parameters.buildShortLink();
    url = shortLink.shortUrl;
    print("Url = $url");
  } else {
    url = await parameters.buildUrl();
    print("Url = $url");

  }

  setState(() {
    print("checking");
  _linkMessage = url.toString();
  _isCreatingLink = false;
  });
  }
  void displayValue() {
    print("value is null");
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dynamic Links Example'),
        ),
        body: Builder(builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: !_isCreatingLink
                          ? () => _createDynamicLink(false)
                          : null,
                      child: const Text('Generate Long Link'),
                    ),
                    RaisedButton(
                      onPressed: !_isCreatingLink
                          ? () {
                        print("short link clicked");
                        _createDynamicLink(true);
                      }
                          : displayValue,
                      child: const Text('Generate Short Link'),
                    ),
                  ],
                ),
                InkWell(
                  child: Text(
                    _linkMessage ?? '',
                    style: const TextStyle(color: Colors.blue),
                  ),
                  onTap: () async {
                    if (_linkMessage != null) {
                      await launch(_linkMessage);
                    }
                  },
                  onLongPress: () {
                    Clipboard.setData(ClipboardData(text: _linkMessage));
                    Scaffold.of(context).showSnackBar(
                      const SnackBar(content: Text('Copied Link!')),
                    );
                  },
                ),
                Text(_linkMessage == null ? '' : _testString)
              ],
            ),
          );
        }),
      ),
    );
  }
}
