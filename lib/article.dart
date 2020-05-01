import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:universal_html/prefer_sdk/html.dart' as html;
import './header.dart';
import './footer.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class Article extends StatefulWidget {
  Article({Key key, this.id}) : super(key: key);
  
  final String id;
  @override
  _Article createState() => _Article();
}

class _Article extends State<Article> {


  final appContainer =
      html.document.getElementsByTagName('body')[0] as html.Element;

  bool screenSize() {
    if (MediaQuery.of(context).size.width > 600) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    
    
  }

  @override
  void dispose() {
    super.dispose();
  }

  _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

  @override
  Widget build(BuildContext context) {
     SystemChrome.setApplicationSwitcherDescription(ApplicationSwitcherDescription(
      label: 'Article Page',
    ));
     double width = MediaQuery.of(context).size.width;
    return Scaffold(
      
      body: Stack(
        children: [
          Scrollbar(
        child: ListView(
          padding: EdgeInsets.only(top: screenSize() ? 64 : 56,),
        physics: BouncingScrollPhysics(),
                addAutomaticKeepAlives: true,
                cacheExtent: 6000.0,
                scrollDirection: Axis.vertical,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(
                
                screenSize() ? width * 0.1 : width * 0.05,
                20,
                screenSize() ? width * 0.1 : width * 0.05,
                20
                
              ),
          child: Column(
            children: [

              Container(
                    height: 400,
                    color: Colors.grey.withOpacity(0.1),
                    child: Center(child: Icon(Icons.image, color: Colors.black12, size: 80,),),
                  ),
                  Container(height: 30,),
                  Container(
                    color: Colors.grey.withOpacity(0.1),
                    padding: EdgeInsets.all(20),
                    alignment: Alignment(-1, 0),
                  child: Text('TITLE OF STORY ' + widget.id, style: TextStyle(fontWeight: FontWeight.normal),)
                  ),
                  Container(height: 30,),
                  Container(
                    color: Colors.grey.withOpacity(0.1),
                    padding: EdgeInsets.fromLTRB(20, 100, 20, 100 ),
                    alignment: Alignment(-1, 0),
                    child: Html(
                                useRichText: false,
                                  data: 'HTML CONTENT USING FLUTTER HTML PACKAGE<br><br><a href="https://pub.dev/packages/flutter_html">LINK HERE</a>',
                                  defaultTextStyle: TextStyle(
                                      
                                      height: 1.4),
                                      
                                  onLinkTap: (url) {
                                         _launchURL(url);
                                          }
                                      ),
                                      
   
                           
                  ),

            ],
          
            
          ),
          ),
            Footer(),
        ],
      ),
          ),
      Positioned(
            top: 0,
            left: 0,
            child: Header(),
          ),
        ],
      ),
    );
  }
}