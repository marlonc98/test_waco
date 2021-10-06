 import 'dart:io';

 import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

 class WebViewPage extends StatefulWidget {
   static const route = '/webview';
   final String url;
   WebViewPage({Key? key, required this.url}):super(key: key);
   @override
   WebViewPageState createState() => WebViewPageState();
 }

 class WebViewPageState extends State<WebViewPage> {
   @override
   void initState() {
     super.initState();
         // Enable hybrid composition.
 if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
   }

   @override
   Widget build(BuildContext context) {
     return WebView(
       initialUrl: widget.url,
     );
   }
 }