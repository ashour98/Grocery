import 'package:flutter/material.dart';
import 'package:grocery_app/API/DBHelper.dart';
import 'package:grocery_app/Model/Product.dart';

class ProductInfo extends StatefulWidget {
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  DBHelper database = DBHelper();

  int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage(product.pLocation),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Container(
              height: MediaQuery.of(context).size.height * .1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back)),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "CartScreen");
                      },
                      child: Icon(Icons.shopping_cart))
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                Opacity(
                  child: Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * .4,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  product.pName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '\$${product.pPrice}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 30),
                                ),
                              ]),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            product.pDescription ?? "",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: Material(
                                  color: Colors.green,
                                  child: GestureDetector(
                                    onTap: Add,
                                    child: SizedBox(
                                      child: Icon(Icons.add),
                                      height: 28,
                                      width: 28,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                _quantity.toString(),
                                style: TextStyle(fontSize: 50),
                              ),
                              ClipOval(
                                child: Material(
                                  color: Colors.green,
                                  child: GestureDetector(
                                    onTap: subtract,
                                    child: SizedBox(
                                      child: Icon(Icons.remove),
                                      height: 28,
                                      width: 28,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ButtonTheme(
                              minWidth: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * .09,
                              child: Builder(
                                builder: (context) => RaisedButton(
                                  child: Text(
                                    'Add to Cart',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  onPressed: () {
                                    Product p = Product(
                                        product.pPrice * _quantity,
                                        _quantity,
                                        product.pName,
                                        product.pPrice,
                                        product.pDescription,
                                        product.pLocation);
                                    database.AddNewItem(p);
                                    print('The data saved');
                                  },
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  opacity: .7,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void subtract() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
      });
    }
  }

  void Add() {
    setState(() {
      _quantity++;
    });
  }
/*
  void AddToCart(context,product) {
    CartItem cartItem= Provider.of<CartItem>(context,listen: false);
    bool exist=false;
    var ProductsinCart= cartItem.products;
    for(var ProductinCart in ProductsinCart){
      if(ProductinCart == product) {
        exist = true;
      }
    }
    if(exist){
      product.pQuantity+= _quantity;
    }
    else{
      cartItem.addProduct(product);
      product.pQuantity=_quantity;
    }
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Added to Cart'),
    ));
  }*/
}
