import 'package:flutter/material.dart';

import 'package:fc_app/HomePage/index.dart';
import 'package:fc_app/My/index.dart';
import 'package:fc_app/WaitThing/index.dart';
import 'package:fc_app/AlarmThing/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '智慧管廊一体化监控平台',
      theme: new ThemeData(
//        brightness: Brightness.dark,
        bottomAppBarColor: Colors.grey[600],
      ),
      home: MyHomePage(title: '智慧管廊一体化监控平台'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController;
  int page = 0;
  var bottomTittles = ['首页', '代办', '告警', '我的'];
  var bottomIcons = [0xe670, 0xe629, 0xe607, 0xe60e];

  Text getBottomText(int index) {
    return new Text(
      bottomTittles[index],
      style: new TextStyle(
          color: this.page == index ? Color(0xFF50DCE9) : Color(0xFF30414c)),
    );
  }

  Icon getbottomIcon(int index) {
    return new Icon(
      IconData(bottomIcons[index], fontFamily: "iconfont"),
      size: 20.0,
      color: this.page == index ? Color(0xFF50DCE9) : Color(0xFF30414c),
    );
  }

  List<BottomNavigationBarItem> bottomNavigationBarItems() {
    List<BottomNavigationBarItem> _b = [];
    for (var i = 0; i < 4; i++) {
      _b.add(new BottomNavigationBarItem(
        icon: getbottomIcon(i),
        title: getBottomText(i),
      ));
    }
    return _b;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text(widget.title),
//        backgroundColor: Color(0xFF162B37),
      ),
      body: PageView(
        children: <Widget>[
          new HomePage(),
          new WaitThing(),
          new AlarmThing(),
          new MySelf(),
        ],
        controller: pageController,
        onPageChanged: pageOnChange,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: bottomNavigationBarItems(),
        type: BottomNavigationBarType.fixed,
        onTap: pageOnTap,
        currentIndex: page,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = new PageController(initialPage: this.page);
  }

  void pageOnChange(int p) {
    setState(() {
      this.page = p;
    });
  }

  void pageOnTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 100), curve: Curves.ease);
  }
}
