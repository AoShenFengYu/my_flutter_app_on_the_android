import 'dart:async' show Future;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show MethodChannel, rootBundle;

void main() => runApp(MyApp());

// 無狀態
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: MyHomePageWidget(),
    );
  }
}

// 有狀態，需要有一個Status
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}

// - 很像是 ViewModel, 裡面有數據, 也有提供方法去操作數據
// - 底線開頭代表此類為私有，不能被此dart以外的文件引用
// - Status的生命週期就是每次修改時，就調用build(context)重建自己
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // debugPrint('_MyHomePageState build: $context');
//
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
//      body: Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: Column(
//          // Column is also a layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug painting" (press "p" in the console, choose the
//          // "Toggle Debug Paint" action from the Flutter Inspector in Android
//          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//          // to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}

/*****/ /*****/
/*****/ /*****/

/*****/ /*****/ /*****/ /*****/ /*****/ /*****/ /*****/ /*****/ /*****/ /*****/
class Item {
  String name;
  int number;
  Color color;

  Item(this.name, this.number, {this.color});
}

class MyHomePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('_MyHomePageWidgetState build');
    return new MyInheritedWidget(
      key: myInheritedWidgetKey,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('Title'),
        ),
        body: new Container(
          decoration: BoxDecoration(
            image: DecorationImage(
//              image: AssetImage("david_assets/images/img_pikachu.jpg"),
//              fit: BoxFit.cover,
              image: NetworkImage("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576662437498&di=15e4c0391d30114d17b5439e3c15ab8f&imgtype=0&src=http%3A%2F%2Fgss0.baidu.com%2F9fo3dSag_xI4khGko9WTAnF6hhy%2Fzhidao%2Fpic%2Fitem%2F7dd98d1001e939010b5cffdc70ec54e737d196f1.jpg"),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new WidgetA(),
              new Container(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new IconTheme(
                      data: new IconThemeData(color: Colors.red),
                      // shopping_cart 是 Flutter 提供的圖
                      child: new Icon(Icons.shopping_cart),
                    ),
                    new WidgetB(),
                  ],
                ),
              ),
              new Container(
                child: new RaisedButton(
                  child: new Text('Show Dialog'),
                  onPressed: () {
                    debugPrint('Show Dialog Button onPressed');
                    showDialog(
                      context: context,
                      builder: (ctx) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              new DialogWidget(),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              new WidgetC(),
              new WidgetD(),
              new Container(
                width: 300,
                height: 50,
                child: new AndroidView(
                  viewType: "david_plugin_view",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyInheritedWidget extends StatefulWidget {
  MyInheritedWidget({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

//  @override
//  MyInheritedWidgetState createState() => new MyInheritedWidgetState();
  @override
  MyInheritedWidgetState createState() {
    debugPrint('MyInheritedWidgetState createState');
    return new MyInheritedWidgetState();
  }

  static MyInheritedWidgetState of(
      [BuildContext context, bool rebuild = true]) {
    return rebuild
        ? context.dependOnInheritedWidgetOfExactType<_MyInherited>().data
        : context.findAncestorWidgetOfExactType<_MyInherited>().data;
  }
}

class MyInheritedWidgetState extends State<MyInheritedWidget> {
  /// List of Items
  List<Item> _items = <Item>[];

  /// Getter (number of items)
  int get itemsCount => _items.length;

  /// Helper method to add an Item
  void addItem(String reference) {
    debugPrint('MyInheritedWidgetState addItem: $reference');

    //用setState(VoidCallback fn)來修改數據，修改完以後，會自動調用重建Status的代碼
    //() {...}是一個沒有被命名的function，裡面在做數據的修改
    setState(() {
      _items.add(new Item(reference, 99));
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('MyInheritedWidgetState build');
    return new _MyInherited(
      data: this,
      child: widget.child,
    );
  }
}

GlobalKey myInheritedWidgetKey = new GlobalKey();

class _MyInherited extends InheritedWidget {
  _MyInherited({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  final MyInheritedWidgetState data;

  @override
  bool updateShouldNotify(_MyInherited oldWidget) {
    return true;
  }
}

class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('- WidgetA build');
    final MyInheritedWidgetState state = MyInheritedWidget.of(context);
    return new Container(
      child: new RaisedButton(
        child: new Text('Add Item'),
        onPressed: () {
          debugPrint('WidgetA onPressed');
          state.addItem('new item');
        },
      ),
    );
  }
}

class WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('- WidgetB build');
    final MyInheritedWidgetState state = MyInheritedWidget.of(context);
    return new Text(
      '${state.itemsCount}',
      style: TextStyle(color: Colors.blue),
    );
  }
}

class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('- WidgetC build');
    return new Text('I am Widget:\n' + loadAsset().toString());
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('david_assets/jsons/json_test.txt');
  }
}

class DialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('- DialogWidget build');
    return new Container(
      child: new RaisedButton(
        child: new Text('Dialog b'),
        onPressed: () {
          debugPrint('DialogWidget b onPressed');
          // final MyInheritedWidgetState state = MyInheritedWidget.of(context);
          final MyInheritedWidgetState state =
              myInheritedWidgetKey.currentState;
          state.addItem('new item from dialog');
        },
      ),
    );
  }
}

class WidgetD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('- WidgetD build');
    return new RaisedButton(
      child: new Text('Call David \'s plugin'),
      onPressed: () {
        debugPrint('WidgetD Button onPressed');
        // 調用自己寫的插件
        callDavidPlugToShowToast();
      },
    );
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('david_assets/jsons/json_test.txt');
  }

  void callDavidPlugToShowToast() async {
    try {
      const platform = const MethodChannel("david_plugin_channel");
      String result = await platform.invokeMethod("showCustomTaost");
      debugPrint('call plugin showCustomTaost result: ' + result);
    } on Exception catch (e) {
      print(e.toString());
      debugPrint(e.toString());
    }
  }
}
