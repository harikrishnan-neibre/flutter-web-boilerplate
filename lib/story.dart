import 'package:flutter/material.dart';
import 'package:universal_html/prefer_sdk/html.dart' as html;
import './header.dart';
import './footer.dart';
import 'package:responsive_grid/responsive_grid.dart';

class Story extends StatefulWidget {
  Story({Key key}) : super(key: key);
  

  @override
  _Story createState() => _Story();
}

class _Story extends State<Story> {


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

  List<ResponsiveGridCol> _buildItems() {
    List<ResponsiveGridCol> items = [];

    bool screenSize() {
      if (MediaQuery.of(context).size.width > 600) {
        return true;
      } else {
        return false;
      }
    }

    for (var index = 0; index < 8; index++) {
      items.add(ResponsiveGridCol(
          lg: 6,
          xs: 12,
          child: Container(
            height: 200,
            color: Colors.grey.withOpacity(0.1),
            margin: EdgeInsets.fromLTRB(
              screenSize() ? index.isEven ? 0 : 10 : 0,
               10,
               screenSize() ? index.isEven ? 10 : 0 : 0,
               10
            ),
            padding: EdgeInsets.all(20),
            
             
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Text('STORY ' + (index + 1).toString(), style: TextStyle(fontWeight: FontWeight.normal)),
              Container(height: 20,),
              Container(
                
              child: Text('STORY ' + (index + 1).toString() + ' SHORT DESCRIPTION'),
              ),
              
              Container(height: 20,),
              GestureDetector(
                        child: MouseRegion(
                          onHover: (_) => appContainer.style.cursor = 'pointer',
                    onExit: (_) => appContainer.style.cursor = 'default',
              child: Container(
                height: 40, 
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  border: Border.all(color: Colors.orangeAccent)
                ),
              child: FlatButton(
                hoverColor: Colors.orangeAccent.withOpacity(0.1),
                          focusColor: Colors.transparent,
                          splashColor: Colors.white.withOpacity(0.5),
                child: Text('READ', style: TextStyle(color: Colors.orangeAccent),), 
                onPressed: (){
                  Navigator.pushNamed(context, '/article/' + (index + 1).toString());
                },),
              ),
                        ),
              ),
              ],
            ),
             
      )));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    
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
                10,
                screenSize() ? width * 0.1 : width * 0.05,
                10
                
              ),
          child: ResponsiveGridRow(
            children: _buildItems()
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