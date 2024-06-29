import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodandgrocery/widget/creditcard.dart';
import 'package:foodandgrocery/widget/inputfield_widget.dart';
import 'package:get/get.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  FlipCardController cardController = FlipCardController();

  @override
  void initState() {
    super.initState();

    // Add listeners to the controllers to update the state when the text changes
    _cardNumberController.addListener(_updateCard);
    _nameController.addListener(_updateCard);
    _dateController.addListener(_updateCard);
    _cvcController.addListener(_updateCard);
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _nameController.dispose();
    _dateController.dispose();
    _cvcController.dispose();
    super.dispose();
  }

  void _updateCard() {
    setState(() {
      if (_cardNumberController.text.isNotEmpty &&
          _nameController.text.isNotEmpty &&
          _dateController.text.isNotEmpty &&
          _cvcController.text.length == 1) {
          cardController.toggleCard();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(CupertinoIcons.back, color: Color(0xFF2d0c57)),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Credit/Debit card',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF2d0c57)),
                ),
                SizedBox(height: 20,),
                FlipCard(
                    key: cardKey,
                    flipOnTouch: true,
                    controller: cardController,
                    front: CreditCardFont(
                      cardNumber: _cardNumberController.text,
                      cardHolderName: _nameController.text,
                      expiryDate: _dateController.text,
                    ),
                    back: CreditCardBack(
                      cvcNumber: _cvcController.text,
                    ),
                  ),
                SizedBox(height: 20,),
                Center(child: Icon(Icons.camera_alt, color: Colors.grey.shade600, size: 25,)),
                SizedBox(height: 20,),
                Text('Card number', style: TextStyle(fontSize: 14, color: Color(0xFF9586A8))),
                SizedBox(height: 5,),
                CustomTextfield(
                  controller: _cardNumberController,
                  isBorder: true,
                  borderColor: Colors.grey.shade600,
                  focusedColor: Color(0xFF2d0c57),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(16),
                    CardNumberInputFormatter(),
                  ],
                  isSuffixIcon: true,
                  iconWidget: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(height: 1, width: 1, child: Image.asset('assets/image/master.png')),
                  ),
                ),
                SizedBox(height: 20,),
                Text('Name on card', style: TextStyle(fontSize: 14, color: Color(0xFF9586A8))),
                SizedBox(height: 5,),
                CustomTextfield(
                  controller: _nameController,
                  isBorder: true,
                  borderColor: Colors.grey.shade600,
                  focusedColor: Color(0xFF2d0c57),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Expiry date', style: TextStyle(fontSize: 14, color: Color(0xFF9586A8))),
                          SizedBox(height: 5,),
                          CustomTextfield(
                            controller: _dateController,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
                              LengthLimitingTextInputFormatter(5),
                            ],
                            onChanged: (value) {
                              String text = _dateController.text;
                              if (text.length == 2 && !text.contains('/')) {
                                _dateController.value = TextEditingValue(
                                  text: '$text/',
                                  selection: TextSelection.collapsed(offset: 3),
                                );
                              }
                            },
                            isBorder: true,
                            borderColor: Colors.grey.shade600,
                            focusedColor: Color(0xFF2d0c57),
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('CVC', style: TextStyle(fontSize: 14, color: Color(0xFF9586A8))),
                          SizedBox(height: 5,),
                          CustomTextfield(
                            controller: _cvcController,
                            isBorder: true,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
                              LengthLimitingTextInputFormatter(3),
                            ],
                            borderColor: Colors.grey.shade600,
                            focusedColor: Color(0xFF2d0c57),
                            keyboardType: TextInputType.number,
                            isSuffixIcon: true,
                            icon: Icons.credit_card,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap:(){},
                  child: Container(
                    height: 56,
                    width: MediaQuery.of(context).size.width,
                    child: Center(child: Text('use this card'.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 15),)),
                    decoration: BoxDecoration(
                        color: Color(0xFF0BCE83),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text.replaceAll(' ', '');
    final buffer = StringBuffer();

    for (int i = 0; i < newText.length; i++) {
      if (i % 4 == 0 && i != 0) {
        buffer.write(' ');
      }
      buffer.write(newText[i]);
    }

    final formattedText = buffer.toString();
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
