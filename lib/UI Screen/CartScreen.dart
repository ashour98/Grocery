import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/API/DBHelper.dart';
import 'package:grocery_app/Model/Product.dart';

class CartScreen extends StatefulWidget {
  static String id= 'CartScreen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String,dynamic>> products=[];

  Future<void> getdata() async {
    products = await database.getBasketData();

  }
  DBHelper database = DBHelper();
int total =0;
  @override
  void initState() {
    // TODO: implement initState
    getdata().then((value) => setState((){
      print(products.length);
          for(int i = 0 ; i<products.length; i++){
  total+=products[i]['pCount'];
  print(products[i]['pCount']);
          }

    }));

  }

  @override
  Widget build(BuildContext context) {

    final double screenHeight= MediaQuery.of(context).size.height;
    final double screenWidth= MediaQuery.of(context).size.width;
    final double appBarHeight=AppBar().preferredSize.height;
    final double statusAppBar=MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: Colors.black,)),
      ),
      body: Column(
        children: [
          LayoutBuilder(
              builder:(context,contrains) {
                if(products.isNotEmpty) {
                  return Container(
                    height: screenHeight-statusAppBar-appBarHeight-(screenHeight*.09),
                    child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            direction: DismissDirection.endToStart,
                            key: Key(products[index].toString()),
                            onDismissed: (direction){
                              setState(()  {
                                database.deleteData(products[index]["ID"]) ;
                                products.removeAt(index);

                              });
                              Scaffold.of(context).showSnackBar(SnackBar(content: Text('Item Dismissed')));
                            },
                            background: Container(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.delete,color: Colors.white,size: 40,)),
                              color: Colors.red,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: screenHeight * .15,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: screenHeight * .15 / 2,
                                      backgroundImage: AssetImage(
                                          products[index]['pLocation']),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                Text(products[index]['pName'],
                                                  style: TextStyle(fontSize: 18,
                                                      fontWeight: FontWeight
                                                          .bold),),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text('\$ ${products[index]['pPrice']}',
                                                  style: TextStyle(fontSize: 18,
                                                      fontWeight: FontWeight
                                                          .bold),),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            child: Text(
                                              products[index]['pQuantity'].toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),),

                                          )
                                        ],),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                }
                else{
                  return Container(
                      height: screenHeight - (screenHeight*.09) -appBarHeight-statusAppBar ,
                      child: Center(child: Text('Cart is Empty',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)));
                }
              }
          ),
          Builder(
            builder:(context)=> ButtonTheme(
              minWidth: screenWidth,
              height: screenHeight*.09,
              child: RaisedButton(
                  child: Text('order'.toUpperCase()),
                  onPressed: (){

                    showDialog(
                        context: context,
                        builder: (_) => new AlertDialog(
                          title: new Text("Thanks For Shopping with US"),
                          content: new Text("Your Total = $total"),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Done'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        ));

                  }

              ),
            ),
          ),

        ],
      ),
    );

  }



  getTotalPrice(List<Product> products) {

    var price =0;
    for(var product in products){
      price+= product.pCount;
    }
    return price;
  }
}
