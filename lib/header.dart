import 'package:flutter/material.dart';
import 'package:universal_html/prefer_sdk/html.dart' as html;

import './home.dart';



  Map<int, Color> color = {
  50: Color.fromRGBO(255, 187, 0, .1),
  100: Color.fromRGBO(255, 187, 0, .2),
  200: Color.fromRGBO(255, 187, 0, .3),
  300: Color.fromRGBO(255, 187, 0, .4),
  400: Color.fromRGBO(255, 187, 0, .5),
  500: Color.fromRGBO(255, 187, 0, .6),
  600: Color.fromRGBO(255, 187, 0, .7),
  700: Color.fromRGBO(255, 187, 0, .8),
  800: Color.fromRGBO(255, 187, 0, .9),
  900: Color.fromRGBO(255, 187, 0, 1),
};


MaterialColor colorCustom = MaterialColor(0xFFFFBB00, color);



class Header extends StatefulWidget {
  @override
  _Header createState() => _Header();
}

class _Header extends State<Header> {

  double _animatedHeight = 0.0;
  double _opacity = 0.0;

  @override
  void initState()  {
    
    super.initState();
   
  }

  

  

 final appContainer 
     = html.document.getElementsByTagName('body')[0] as html.Element;

  @override
  Widget build(BuildContext context) {

    
    
    bool screenSize() {
      if (MediaQuery.of(context).size.width > 600) {
        return true;
      } else {
        return false;
      }
    }

    return Stack(
      children: [

        screenSize() ? Container() :
        AnimatedOpacity(duration: const Duration(milliseconds: 120),
        opacity: _opacity,
        //curve: Curves.,
                  child: Container(
                    height: _animatedHeight,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    offset: Offset(0.0, 2.0), //(x,y)
                    blurRadius: 10.0,
                  ),
                ],
                      border: Border(
            
            bottom: BorderSide(width: 1.0, color: Colors.black12),
          ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(
            screenSize()
                ? MediaQuery.of(context).size.width * 0.1
                : MediaQuery.of(context).size.width * 0.05,
            0,
            screenSize()
                ? MediaQuery.of(context).size.width * 0.1
                : MediaQuery.of(context).size.width * 0.05,
            0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 56,),
                Container(height: 20,),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.grey.withOpacity(0.3),
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    onTap: (){
                      setState((){
                      _opacity = 0.0;
                      _animatedHeight=0.0;
                      });
                      Navigator.pushNamed(context, '/');
                    },
                    child: Container(
                      height: 30.0,
                      width: double.infinity,
                      alignment: Alignment(-1, 0),
                      child: Text('HOME', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),),
                    ),
                  ),
                ),
                Container(height: 20,),
                
                
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.grey.withOpacity(0.3),
                     hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    onTap: (){
                      setState((){
                      _opacity = 0.0;
                      _animatedHeight=0.0;
                      });
                      Navigator.pushNamed(context, '/stories');
                    },
                    child: Container(
                      height: 30.0,
                      width: double.infinity,
                      alignment: Alignment(-1, 0),
                      child: Text('STORIES', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87,)),
                    ),
                  ),
                ),
                Container(height: 20,),
                
              ],
              )


                  ),

                ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: screenSize() ? 64 : 56,
        color: Colors.deepOrange,
        padding: EdgeInsets.fromLTRB(
            screenSize()
                ? MediaQuery.of(context).size.width * 0.1
                : MediaQuery.of(context).size.width * 0.05,
            0,
            screenSize()
                ? MediaQuery.of(context).size.width * 0.1
                : MediaQuery.of(context).size.width * 0.0,
            0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        child: MouseRegion(
                          onHover: (_) => appContainer.style.cursor = 'pointer',
                    onExit: (_) => appContainer.style.cursor = 'default',
                    
                    child: Text('Logo', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900)),
                    
                    
                      
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, Home.route);
                    }
                    ),
                  ],
                )),
            Expanded(
              flex: 7,
              child: screenSize()
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                        child: MouseRegion(
                          onHover: (_) => appContainer.style.cursor = 'pointer',
                    onExit: (_) => appContainer.style.cursor = 'default',
                        child: FlatButton(
                          color: Colors.transparent,
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          splashColor: Colors.white.withOpacity(0.5),
                          onPressed: (){
                           Navigator.pushNamed(context, Home.route);
                          },
                          child: Text('HOME', style: TextStyle(color: Colors.white),),
                        ),
                        ),
                    ),
                    Container(width: 10,),
                    
                    GestureDetector(
                        child: MouseRegion(
                          onHover: (_) => appContainer.style.cursor = 'pointer',
                    onExit: (_) => appContainer.style.cursor = 'default',
                        child: FlatButton(
                          color: Colors.transparent,
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          splashColor: Colors.white.withOpacity(0.5),
                          onPressed: (){
                            
                        Navigator.pushNamed(context, '/stories');
                            
                          },
                          child: Text('STORIES', style: TextStyle(color: Colors.white),),
                        ),
                         ),
                    ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Builder(
                          builder: (context) => Material(
                            color: Colors.transparent,
                            child: InkWell(
                              hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          splashColor: Colors.white.withOpacity(0.5),
                              onTap: ()=>setState((){
                    
                    _opacity != 0.0 ? _opacity = 0.0 : _opacity=1.0;
                     _opacity != 0.0 ? _animatedHeight = 180.0 : _animatedHeight=0.0;
                    }),
                              child: Container(
                                width: 56,
                                height: 56,
                                
                                child: _opacity == 1.0 ? Icon(Icons.close, color: Colors.white,) : Icon(Icons.menu, color: Colors.white,),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
        ),
        
        
        ],
        );
  }

}
