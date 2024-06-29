import 'package:flutter/widgets.dart';
import 'package:foodandgrocery/model/vegname_model.dart';
import 'package:foodandgrocery/screen/veginfo.dart';
import 'package:foodandgrocery/widget/filter_chip_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodandgrocery/widget/inputfield_widget.dart';
import 'package:get/get.dart';

class Vegetables extends StatefulWidget {
  Vegetables({super.key});

  @override
  State<Vegetables> createState() => _VegetablesState();
}

class _VegetablesState extends State<Vegetables> {
  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF6F5F5),
        body: Stack(
          children: [
            Positioned(
                right: 0,
                top: 0,
                child: Image.asset('assets/image/Vector.png')),
            Positioned(
              top: 10,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(CupertinoIcons.back,color: Color(0xFF2d0c57),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  Text(
                    'Vegetables',
                    style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color: Color(0xFF2d0c57)),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 48,
                    width: 374,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(27)),
                        color: Colors.white
                    ),
                    child: CustomTextfield(
                      isBorder: true,
                      hint: 'Search',
                      hintFontSize: 15,
                      borderColor: Colors.grey.shade400,
                      focusedColor: Color(0xFF2d0c57),
                      isPrefixIcon: true,
                      icon: Icons.search,
                      iconSize: 22,
                      borderRadius: 27,
                      controller: search,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          FilterChipWidget(),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: vegetable.length,
                            itemBuilder: (BuildContext context, int index) {
                              var itemname = vegetable[index];
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: InkWell(
                                  onTap: () => Get.to(Veginfo(),arguments: {'image': itemname.image,'index': index}),
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    height: 150,
                                    //color: Colors.purple[100],
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(8), // Image border
                                            child: SizedBox.fromSize(
                                              child: Hero(
                                                  tag: 'item_image$index',
                                                  child: Image.asset(itemname.image, fit: BoxFit.cover)),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                itemname.name,
                                                style: TextStyle(
                                                    color: Color(0xFF2d0c57),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(height: 10),
                                              RichText(
                                                text: TextSpan(
                                                  text: '${itemname.price} ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22,
                                                    color: Color(0xFF2d0c57), // Set default color for text
                                                  ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: itemname.weight,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey.shade500, // Custom color for weight
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                                children: [
                                                  InkWell(
                                                    onTap: (){},
                                                    child: Container(
                                                      height: 40,
                                                      width: 78,
                                                      child: Icon(CupertinoIcons.heart,color: Colors.grey.shade500),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                              color: Colors.grey.shade400),
                                                          borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(10))),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  InkWell(
                                                    onTap: (){},
                                                    child: Container(
                                                      height: 40,
                                                      width: 78,
                                                      child: Icon(CupertinoIcons.cart,color: Colors.white,size: 20,),
                                                      decoration: BoxDecoration(
                                                          color: Color(0xFF0BCE83),
                                                          borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(10))),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
