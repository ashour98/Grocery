import 'package:flutter/material.dart';
import 'package:grocery_app/Model/Product.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomBar = 0;
  List<Product> fruit = [
    Product( 0,0,"Apple",3,"Apple / KG",'images/photo/fruits/apple.jpg'),
    Product( 0,0,"banana",4,"banana / KG",'images/photo/fruits/banana.jpg'),
    Product( 0,0,"Kiwi",2,"Kiwi / KG",'images/photo/fruits/kiwi.jpg'),
    Product( 0,0,"Grape",6,"Grapes / KG",'images/photo/fruits/Grapes.jpg'),
  ];

  List<Product> vegetable = [
    Product( 0,0,"Carrot",3,"Carrot / KG",'images/photo/vegetables/carrot.jpg'),
    Product( 0,0,"Onion",4,"onion / KG",'images/photo/vegetables/onion.jpg'),
    Product( 0,0,"Cucumber",2,"Cucumber / KG",'images/photo/vegetables/Cucumber.jpg'),
    Product( 0,0,"Tomato",6,"Tomato / KG",'images/photo/vegetables/Tomato.jpg'),
  ];

  List<Product> bakery = [
    Product( 0,0,"Arabic Bread",3,"Arabic Bread / KG",'images/photo/bakery/Arabic-Bread.jpg'),
    Product( 0,0,"cake",4,"",'images/photo/bakery/cake.jpg'),
    Product( 0,0,"samoli",2,"samoli / KG",'images/photo/bakery/samoli.jpg'),
    Product( 0,0,"Toast",2,"Toast / KG",'images/photo/bakery/Toast.jpg'),
  ];

  List<Product> drinks = [
    Product( 0,0,"'orange juice'",3,"",'images/photo/drinks/orange.jpg'),
    Product( 0,0,"pepsi",2,"",'images/photo/drinks/pepsi.jpg'),
    Product( 0,0,"water",1,"",'images/photo/drinks/water.jpg'),
    Product( 0,0,"Milk",2,"",'images/photo/drinks/milk.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.lightGreen,
            currentIndex: _bottomBar,
            onTap: (value) {
              setState(() {
                _bottomBar = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  label: 'Home', icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: 'favorite', icon: Icon(Icons.favorite)),
              BottomNavigationBarItem(
                  label: 'Notification', icon: Icon(Icons.notifications)),
            ],
          ),
          drawer: Drawer(
            elevation: 10,
            child: ListView(
              children: [
                DrawerHeader(
                    child: Column(
                  children: [
                    Text(
                      'Aseel Askari',
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(
                      Icons.person_outline_rounded,
                      size: 30,
                      color: Colors.blue,
                    )
                  ],
                )),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  title: Text('Home'),
                  onTap: () {
                    Navigator.popAndPushNamed(context, "HomePage");
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  title: Text('Sign Out'),
                  onTap: () {
                    Navigator.popAndPushNamed(context, "/");
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.assignment_outlined,
                    color: Colors.black,
                  ),
                  title: Text('About'),
                  onTap: () {
                    Navigator.pushNamed(context, "About");
                  },
                )
              ],
            ),
          ),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                // By default our  icon color is white
                color: Colors.black,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                // By default our  icon color is white
                color: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, "CartScreen");
                },
              ),
              SizedBox(width: 5)
            ],
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text(
                    "Fruits",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Vegetables",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Bakery",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Drinks",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Items(fruit, context),
              Items(vegetable, context),
              Items(bakery, context),
              Items(drinks, context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget Items(List<Product> ll, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: GridView.count(
      childAspectRatio: 2 / 2.5,
      shrinkWrap: true,
      crossAxisCount: 2,
      children: List.generate(ll.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 130,
                      width: 150,
                      child: Image.asset(
                      ll[index].pLocation)),
                  Text(ll[index].pName),
                  FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context, "ProductInfo",arguments: ll[index]);
                      },
                      child: Text("view item"))
                ],
              ),
            ),
          ),
        );
      }),
    ),
  );
}
