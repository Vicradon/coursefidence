import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:provider/provider.dart';

// import 'network_status.dart';

class Home extends StatefulWidget {
  Home() : super();

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    final isMobileLayout = shortestSide<600;
    final orientation = MediaQuery.of(context).orientation;
    // Get our connection status from the provider
   // var connectionStatus = Provider.of<ConnectivityStatus>(context);
        return Scaffold(
      appBar: AppBar(
        title: Text("Freestyle"),
      ),
      body: isMobileLayout
          ? phoneUI(orientation)
          : tabletUI(orientation),
    );
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Freestyle"),
//      ),
//      body: connectionStatus == ConnectivityStatus.WiFi
//          ? phoneUI(orientation)
//          : connectionStatus == ConnectivityStatus.Cellular? tabletUI(orientation):offlineUI(orientation),
//    );
  }
}

phoneUI(Orientation orientation) {
  return Container(
    color: Colors.blueAccent,
    child: Text("This is me"),
  );
}

tabletUI(Orientation orientation) {
  return Container(
    color: Colors.green,
  );
}
offlineUI(Orientation orientation) {
  return Container(
    color: Colors.black,
  );
}
