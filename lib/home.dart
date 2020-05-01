import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:universal_html/prefer_sdk/html.dart' as html;
import './header.dart';
import './story.dart' deferred as story;
import './article.dart' deferred as article;
import './footer.dart';
import 'package:responsive_grid/responsive_grid.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Web Boilerplate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.deepOrange,
        canvasColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Home.route,
      onGenerateRoute: onGenerateRoute,
    ),
  );
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  List<Path> paths = [
    Path(
      r'^' + Articles.route + r'/(?<slug>[\w-]+)$',
      (context, matches) => Articles(id: matches['slug']),
    ),
    Path(
      r'^' + Stories.route,
      (context, matches) => Stories(),
    ),
    Path(
      r'^' + Home.route,
      (context, matches) => Home(),
    ),
  ];

  for (Path path in paths) {
    //print(path.pattern);
    final regExpPattern = RegExp(path.pattern);
    if (regExpPattern.hasMatch(settings.name)) {
      final match = regExpPattern.firstMatch(settings.name);
      Map<String, String> groupNameToMatch = {};
      for (String groupName in match.groupNames) {
        groupNameToMatch[groupName] = match.namedGroup(groupName);
      }
      return MaterialPageRoute<void>(
        builder: (context) => path.builder(context, groupNameToMatch),
        settings: settings,
      );
    }
  }

  return null;
}

class Path {
  const Path(this.pattern, this.builder);

  final String pattern;

  final Widget Function(BuildContext, Map<String, String>) builder;
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  static String route = '/';

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final appContainer =
      html.document.getElementsByTagName('body')[0] as html.Element;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
      label: 'Home Page',
    ));
    double width = MediaQuery.of(context).size.width;
    bool screenSize() {
      if (MediaQuery.of(context).size.width > 600) {
        return true;
      } else {
        return false;
      }
    }

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
                  Container(height: 20,),
                  Container(
                    
                    
                    child: ResponsiveGridRow(
                      children: [
                        ResponsiveGridCol(lg: 6, md: 12, xs: 6,
                        
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                            0,0,5,0
                            ),
                          height: 300,
                          color: Colors.grey.withOpacity(0.1),
                          child: Center(
                            child: Text('GRID 1'),
                          ),
                        ),
                        ),
                        ResponsiveGridCol(lg: 6, md: 12, xs: 6,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                            5,0,0,0
                            ),
                          height: 300,
                          color: Colors.grey.withOpacity(0.1),
                          child: Center(
                            child: Text('GRID 2'),
                          ),
                        ),
                        )

                    ],)
                  ),
                  Container(height: 20,),
                  Container(
                    height: 300,
                    color: Colors.grey.withOpacity(0.1),
                    child: Center(child: Text('SECTION 1')),
                  ),
                  Container(height: 20,),
                  Container(
                    height: 300,
                    color: Colors.grey.withOpacity(0.1),
                    child: Center(child: Text('SECTION 2')),
                  ),
                  Container(height: 20,),
                  Container(
                    height: 300,
                    color: Colors.grey.withOpacity(0.1),
                    child: Center(child: Text('SECTION 3')),
                  ),
                  Container(height: 20,),
                  Container(
                    height: 300,
                    color: Colors.grey.withOpacity(0.1),
                    child: Center(child: Text('SECTION 4')),
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

class Articles extends StatelessWidget {
  Articles({Key key, this.id}) : super(key: key);
  static String route = '/article';
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: article.loadLibrary(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return new Center(child: new CircularProgressIndicator());
              case ConnectionState.waiting:
                return new Center(child: new CircularProgressIndicator());
              case ConnectionState.active:
                return new Center(child: new CircularProgressIndicator());
              case ConnectionState.done:
                return article.Article(id: id);
              default:
                return new Center(child: new CircularProgressIndicator());
            }
          }),
    );
  }
}

class Stories extends StatelessWidget {
  static String route = '/stories';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
      label: 'Story List',
    ));
    return Scaffold(
      body: FutureBuilder(
          future: story.loadLibrary(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return new Center(child: new CircularProgressIndicator());
              case ConnectionState.waiting:
                return new Center(child: new CircularProgressIndicator());
              case ConnectionState.active:
                return new Center(child: new CircularProgressIndicator());
              case ConnectionState.done:
                return story.Story();
              default:
                return new Center(child: new CircularProgressIndicator());
            }
          }),
    );
  }
}
