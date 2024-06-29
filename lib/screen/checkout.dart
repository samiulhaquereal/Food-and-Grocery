import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodandgrocery/screen/payment.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF6F5F5),
        appBar: AppBar(
          backgroundColor: Color(0xFFF6F5F5),
          title: Text('Checkout',style: TextStyle(fontSize: 17,color: Color(0xFF2d0c57)),),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(CupertinoIcons.back,color: Color(0xFF2d0c57),),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment method',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Color(0xFF2d0c57)),
                  ),
                  InkWell(onTap: (){
                    Get.to(PaymentPage());
                  }, child: Text('CHANGE',style: TextStyle(color: Color(0xFF7203FF),fontSize: 15,fontWeight: FontWeight.w500),)),
                ],
              ),
              SizedBox(height: 15, ),
              Row(
                children: [
                  Icon(Icons.credit_card,color: Color(0xFF2d0c57)),
                  SizedBox(width: 20),
                  Text('**** **** **** 4747',style: TextStyle(color: Colors.grey.shade500,fontSize: 17)),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery address',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Color(0xFF2d0c57)),
                  ),
                  InkWell(onTap: (){}, child: Text('CHANGE',style: TextStyle(color: Color(0xFF7203FF),fontSize: 15,fontWeight: FontWeight.w500),)),
                ],
              ),
              SizedBox(height: 15, ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.home_outlined,color: Color(0xFF2d0c57)),
                  SizedBox(width: 20),
                  Container(
                    width: 300,
                    child: Text('Alexandra Smith \n'
                        'cesu 31 k-2 5.st, SIA Chili \n'
                        'Riga \n'
                        'LV-1012 \n'
                        'Latvia',style: TextStyle(color: Colors.grey.shade500,fontSize: 17)),
                  )
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery option',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Color(0xFF2d0c57)),
                  ),
                  InkWell(onTap: (){}, child: Text('CHANGE',style: TextStyle(color: Color(0xFF7203FF),fontSize: 15,fontWeight: FontWeight.w500),)),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Icon(Icons.directions_walk,color: Color(0xFF2d0c57)),
                  SizedBox(width: 20),
                  Text('I’ll pick it up myself',style: TextStyle(color: Colors.grey.shade500,fontSize: 17)),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Icon(Icons.directions_bike,color: Color(0xFF2d0c57)),
                  SizedBox(width: 20),
                  Text('By courier',style: TextStyle(color: Colors.grey.shade500,fontSize: 17)),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Icon(Icons.airplanemode_active,color: Color(0xFF2d0c57)),
                  SizedBox(width: 20),
                  Text('By Drone',style: TextStyle(color: Colors.grey.shade500,fontSize: 17)),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Non-contact-delivery',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Color(0xFF2d0c57)),
                  ),
                  Switch(value: true, onChanged:(_){})
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
