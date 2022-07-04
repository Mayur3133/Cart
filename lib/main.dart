import 'package:badges/badges.dart';
import 'package:cart/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'empty page.dart';

void main() {
  runApp(MaterialApp(
    home: cart(),
    debugShowCheckedModeBanner: false,
  ));
}

int qnt = 0;

class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  List<model> cart = [];

  List<model> lst = [
    model(
      image: "image/1.jpg",
      rate: 1000,
      name: 'Headphone',
      cnt: 0,
    ),
    model(
      image: "image/2.jpg",
      rate: 1200,
      name: 'Headphone',
      cnt: 0,
    ),
    model(
      image: "image/9.jpg",
      rate: 80000,
      name: 'iphone12',
      cnt: 0,
    ),
    model(
      image: "image/4.jpg",
      rate: 59000,
      name: 'iphone11',
      cnt: 0,
    ),
    model(
      image: "image/7.jpg",
      rate: 3100,
      name: ' Ear buds ',
      cnt: 0,
    ),
    model(
      image: "image/6.jpg",
      rate: 1100,
      name: 'Neckband',
      cnt: 0,
    ),
    model(
      image: "image/8.jpg",
      rate: 1300,
      name: 'Earbuds',
      cnt: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          qnt != 0
              ? Badge(
                  position: BadgePosition.topEnd(top: 0, end: 3),
                  // animationDuration: Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.scale,

                  badgeContent: Text(
                    qnt > 99 ? "99+" : qnt.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                    onPressed: () async {
                      cart.clear();
                      setState(
                        () async {
                          for (int i = 0; i < lst.length; i++) {
                            var item = lst[i];
                            if (item.cnt > 0) {
                              cart.add(lst[i]);
                              print(cart);
                            }
                          }
                          if (cart.isEmpty) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => empty(),
                                ));
                          }
                          if (cart.length > 0) {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => cartpage(cart),
                              ),
                            );
                            setState(() {});
                          }
                        },
                      );
                    },
                    icon: const Icon(Icons.shopping_cart),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(right: 1),
                  child: IconButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => empty(),
                          )),
                      icon: Icon(Icons.shopping_cart)))
          // Container()
        ],
        title: Text("Product List"),
      ),
      body: ListView.builder(
        itemCount: lst.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                 EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 8),
            child: Container(
              width: double.infinity,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Colors.grey.shade200,
                    Colors.grey.shade100,
                  ],
                ),
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: AssetImage(lst[index].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text('• ₹${lst[index].rate.toString()}    ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.orange[900],
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold
                                        // backgroundColor: Colors.white
                                        )),
                                Text(lst[index].name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.orange[900],
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold
                                        // backgroundColor: Colors.white
                                        )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (lst[index].cnt > 0) {
                                    lst[index].cnt--;
                                    if (qnt > 0) {
                                      qnt--;
                                    }
                                  }
                                });
                              },
                              icon: Icon(Icons.remove)),
                          Container(
                            child: Text('${lst[index].cnt.toString()}'),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (lst[index].cnt < 1000) {
                                    lst[index].cnt++;
                                    if (qnt < 1000) {
                                      qnt++;
                                    }
                                  }
                                });
                              },
                              icon: Icon(Icons.add)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class model {
  final String image;
   int rate;
  final String name;
   int cnt;

  model({
    required this.image,
    required this.name,
    required this.rate,
    required this.cnt,
  });
}
