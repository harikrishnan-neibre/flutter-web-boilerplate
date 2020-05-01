import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  @override
  _Footer createState() => _Footer();
}

class _Footer extends State<Footer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 50, bottom: 50),
        color: Colors.grey.withOpacity(0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '© COPYRIGHT 2020. ALL RIGHTS RESERVED',
              style: TextStyle(fontSize: 12, color: Colors.black87),
            ),
          ],
        ));
  }
}
