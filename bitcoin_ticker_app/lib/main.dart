import 'package:flutter/material.dart';
import 'currencies.dart';

void main() {
  runApp(const Bitcoin());
}

class Bitcoin extends StatelessWidget {
  const Bitcoin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', //
      routes: {
        '/': (context) => const HomePage(),
        // '/first': (context) => Container(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? currency = "USD";
  String btc = "---";
  String eth = "---";
  String ltc = "---";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        title: Text(
          'BITCOIN TICKER 🤑',
          style: TextStyle(
            fontSize: 25, //
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, //
        backgroundColor: Colors.blue,
      ),
      //body content
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // for center widgets
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                //first Card
                makeCard('1 BTC = $btc $currency'),
                //second card
                makeCard('1 ETH = $eth $currency'),
                //third card
                makeCard('1 LTC = $ltc $currency'),
              ],
            ),
          ),
          //for appbar at the bottom of screen
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              color: Colors.blue,
              child: Center(
                child: DropdownButton<String>(
                  items: currencyList.map((i) {
                    return DropdownMenuItem(
                      value: i,
                      child: Text(i), //
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      currency = value;
                    });
                  },
                ), //
              ),
            ), //
          ),
        ],
      ),
    );
  }

  Widget makeCard(String text) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 400,
      height: 80,
      child: Card(
        color: Colors.blue.shade400, //
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), //
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 21, //
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
