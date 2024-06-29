import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Veginfo extends StatelessWidget {
  const Veginfo({super.key});

  @override
  Widget build(BuildContext context) {
    var item = Get.arguments;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Hero(
                  tag:'item_image${item['index']}',
                  child: Image.asset(item['image'])),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 240,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Romaine Lettuce',
                        style:
                            TextStyle(fontWeight: FontWeight.w600, fontSize: 30,color: Color(0xFF2d0c57)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          text: '1.10 ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: Color(0xFF2d0c57), // Set default color for text
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '€ / piece',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.grey.shade500, // Custom color for weight
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '~ 150 gr / piece',
                        style:
                            TextStyle(fontWeight: FontWeight.w600, fontSize: 17, color: Color(0xFF06BE77)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Spain',
                        style:
                            TextStyle(fontWeight: FontWeight.w600, fontSize: 22,color: Color(0xFF2d0c57)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Lettuce is an annual plant of the daisy family, Asteraceae. It is most often grown as a leaf '
                        'vegetable, but sometimes for its stem and seeds. Lettuce is most often used for salads, '
                        'although it is also seen in other kinds of food, such as soups, sandwiches and wraps; it can '
                        'also be grilled.',
                        style:
                            TextStyle(fontWeight: FontWeight.w300, fontSize: 18,color: Colors.grey.shade700),
                      ),
                      Spacer(),
                      Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap:(){},
                              child: Container(
                                height: 50,
                                width: 80,
                                child: Icon(CupertinoIcons.heart,color: Colors.grey.shade600),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey.shade400),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap:(){},
                              child: Container(
                                height: 50,
                                width: 280,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(CupertinoIcons.cart,color: Colors.white,size: 20,),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('ADD TO CART',style: TextStyle(color: Colors.white,fontSize: 15),),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Color(0xFF0BCE83),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
