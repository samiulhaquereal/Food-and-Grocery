import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreditCardFont extends StatelessWidget {

  final String? cardNumber;
  final String? cardHolderName;
  final String? expiryDate;

  CreditCardFont({
    this.cardNumber,
    this.cardHolderName,
    this.expiryDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 240,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFB993D6),
            Color(0xFF8CA6DB),
          ]
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -50,
            left: 140,
            child: Container(
              height: 335,
              width: 335,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.2),
                  borderRadius: BorderRadius.all(Radius.circular(300))
              ),
            ),
          ),
          Positioned(
            right: 25,
            top: 20,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Color(0xFFFFD25F).withOpacity(.8),
                  borderRadius: BorderRadius.all(Radius.circular(50))
              ),
            ),
          ),
          Positioned(
            right: 50,
            top: 20,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Color(0xFFF24E1E).withOpacity(.8),
                borderRadius: BorderRadius.all(Radius.circular(50))
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 50,
            right: 50,
            child: cardNumber?.isEmpty ?? true ? Text('XXXX  XXXX  XXXX  XXXX',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ) : Text( cardNumber!,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 35,),
          Positioned(
            bottom: 30,
            left: 20,
            child: Text(
              cardHolderName?.isEmpty ?? true ? 'Card Holder Name' : cardHolderName!,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 20,
            child: Text(
              expiryDate?.isEmpty ?? true ? '**/**' : expiryDate!,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CreditCardBack extends StatelessWidget {

  final String? cvcNumber;

  CreditCardBack({
    this.cvcNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 240,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFFB993D6),
              Color(0xFF8CA6DB),
            ]
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('LOST OR STOLEN, PLEASE RETURN TO ANY BRANCH OF BANK',style: TextStyle(color: Colors.white,fontSize: 12)),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              color: Colors.black,
            ),
          ),
          Positioned(
            top: 110,
            left: 15,
            right: 50,
            child: Container(
              height: 50,
              color: Colors.white,
            ),
          ),
          Positioned(
            top: 125,
            right: 70,
            child: Text(cvcNumber?.isEmpty ?? true ? 'XXX' : cvcNumber!),
          ),
          Positioned(
            top: 175,
            left: 25,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('ISSUED BY BANK',style: TextStyle(color: Colors.white,fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }
}