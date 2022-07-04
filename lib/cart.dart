// import 'package:cart/main.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
//
// class cartpage extends StatefulWidget {
//   List<model> cart;
//
//   cartpage({Key? key, required this.cart}) : super(key: key);
//
//   @override
//   State<cartpage> createState() => _cartpageState();
// }
//
// class _cartpageState extends State<cartpage> {
//   int shipping = 10;
//   int subTotal = 0;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     for (int i = 0; i < widget.cart.length; i++) {
//       int stotal = widget.cart[i].rate * widget.cart[i].qnt;
//       subTotal += stotal;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Your Order"),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height * 0.6,
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: widget.cart.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Image(
//                             height: 70,
//                             width: 70,
//                             image: AssetImage(widget.cart[index].image),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Expanded(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "Item :- ${widget.cart[index].name}",
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 8.0),
//                                   child: Row(
//                                     children: [
//                                       Text(
//                                         "Price :-",
//                                         style: TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                       const Icon(
//                                         Icons.currency_rupee,
//                                         size: 15,
//                                       ),
//                                       const SizedBox(
//                                         width: 2,
//                                       ),
//                                       Text(
//                                         widget.cart[index].rate.toString(),
//                                         style: TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.only(top: 10, right: 5),
//                                 child: Text(
//                                   "Total Quantity",
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black),
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   TextButton(
//                                     onPressed: () {
//                                       setState(() {
//                                         if (widget.cart[index].qnt >
//                                             0) {
//                                           widget.cart[index].qnt--;
//                                           int stotal =
//                                               widget.cart[index].rate;
//                                           subTotal -= stotal;
//                                           setState(() {
//                                             widget.cart;
//                                           });
//                                         }
//                                       });
//                                     },
//                                     child: const Icon(Icons.remove),
//                                   ),
//                                   Container(
//                                     color: Colors.white12,
//                                     margin:
//                                     EdgeInsets.only(left: 10, right: 10),
//                                     child: Text(
//                                       widget.cart[index].qnt
//                                           .toString(),
//                                       style: const TextStyle(fontSize: 25),
//                                     ),
//                                   ),
//                                   TextButton(
//                                     onPressed: () {
//                                       setState(() {
//                                         if (widget.cart[index].qnt <
//                                             100) {
//                                           widget.cart[index].qnt++;
//                                           int stotal =
//                                               widget.cart[index].rate;
//                                           subTotal += stotal;
//                                         }
//                                       });
//                                     },
//                                     child: const Icon(Icons.add),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Container(
//                         alignment: Alignment.center,
//                         padding: EdgeInsets.only(left: 10, right: 20),
//                         height: 40,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: Colors.blue.shade900),
//                             color: Colors.blue.shade100),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Your Amount"),
//                             Row(
//                               children: [
//                                 const Icon(Icons.currency_rupee),
//                                 const SizedBox(
//                                   width: 5,
//                                 ),
//                                 widget.cart[index].qnt != 0
//                                     ? Text((widget.cart[index].rate *
//                                     widget.cart[index].qnt)
//                                     .toString())
//                                     : Text('0'),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Card(
//                 child: Container(
//                   // height: 150,
//                   color: Colors.white,
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                         left: 20.0, right: 25, top: 20, bottom: 20),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "SubTotal",
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.w500),
//                             ),
//                             Text(
//                               subTotal.toString(),
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Shipping",
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.w500),
//                             ),
//                             Row(
//                               children: [
//                                 const Icon(
//                                   Icons.currency_rupee,
//                                   size: 15,
//                                 ),
//                                 const SizedBox(
//                                   width: 2,
//                                 ),
//                                 Text(
//                                   shipping.toString(),
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Total",
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.w500),
//                             ),
//                             Text(
//                               "${subTotal + shipping}",
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Container(
//                           alignment: Alignment.center,
//                           width: double.infinity,
//                           height: 50,
//                           color: Colors.teal.shade300,
//                           child: Text(
//                             "PROCEED TO CHECKOUT",
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:cart/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class cartpage extends StatefulWidget {
  List<model> cartlist;

  cartpage(this.cartlist);

  @override
  State<cartpage> createState() => _cartpageState();
}

class _cartpageState extends State<cartpage> {
  var subTotal = 0;
  var shipping = 80;

  @override
  void initState() {
    for (int i = 0; i < widget.cartlist.length; i++) {
      int stotal = widget.cartlist[i].rate * widget.cartlist[i].cnt;
      subTotal += stotal;

      if (widget.cartlist.length == 0) {
        shipping = 0;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Your Cart",
        ),
      ),
      body:
      // widget.cartlist.length == 0 ? Text("Your cart is empty"):
      Container(
        height: 590,
        child: ListView.builder(
          itemCount: widget.cartlist.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
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
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Positioned(
                        left: 280,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (widget.cartlist[index].cnt > 0) {
                                    widget.cartlist[index].cnt--;
                                    if (qnt > 0) {
                                      qnt--;
                                    }
                                    int stotal = widget.cartlist[index].rate;
                                    subTotal -= stotal;
                                    setState(() {
                                      widget.cartlist;
                                    });
                                  }

                                  if (widget.cartlist[index].cnt == 0) {
                                    widget.cartlist.removeAt(index);
                                    setState(() {
                                      widget.cartlist;
                                    });
                                  }
                                });
                              },
                              child: Icon(
                                Icons.remove,
                              ),
                            ),

                            Container(
                              width: 35,
                              child: Center(
                                child: Text(
                                  widget.cartlist[index].cnt.toString(),
                                  // style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (widget.cartlist[index].cnt < 1000) {
                                    widget.cartlist[index].cnt++;

                                    if (qnt < 1000) {
                                      qnt++;
                                    }
                                    int stotal = widget.cartlist[index].rate;
                                    subTotal += stotal;

                                    setState(() {
                                      widget.cartlist;
                                    });
                                  }
                                });
                              },
                              child: Icon(
                                Icons.add,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image:
                                  AssetImage(widget.cartlist[index].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Text(
                                    '• ₹${widget.cartlist[index].rate
                                        .toString()}    ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.orange[900],
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold
                                      // backgroundColor: Colors.white
                                    )),
                                Text(widget.cartlist[index].name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.orange[900],
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold
                                      // backgroundColor: Colors.white
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomSheet: Container(
        height: 170,
        width: double.infinity,
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.only(
        //       topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        //   // boxShadow: [
        //   //   BoxShadow(
        //   //       color: Colors.black26, offset: Offset(0, -1), blurRadius: 20)
        //   // ],
        // ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Subtotal"), Text("₹ ${subTotal}")],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Shipping charges"), Text("₹ ${shipping}")],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "₹ ${subTotal + shipping}",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.orange[900],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 30)
                      ]),
                  child: Center(
                    child: Text(
                      "Proceed to Checkout",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
