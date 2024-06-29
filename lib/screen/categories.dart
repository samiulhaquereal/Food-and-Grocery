import 'package:foodandgrocery/model/category_model.dart';
import 'package:foodandgrocery/screen/vegetables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodandgrocery/widget/inputfield_widget.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  Categories({super.key});


  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(CupertinoIcons.back,color: Color(0xFF2d0c57)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
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
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: category.length,
                itemBuilder: (BuildContext context, int index) {
                  var itemname = category[index];
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: ()=> Get.to(Vegetables()),
                      child: Container(
                        height: 100,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade200),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                // Image border
                                child: SizedBox.fromSize(
                                  child: Image.asset(
                                      itemname.image,
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Text(itemname.name,style: TextStyle(color: Color(0xFF2d0c57),fontWeight: FontWeight.bold,fontSize: 18),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Text('(${itemname.stock.toString()})',style: TextStyle(color: Colors.grey.shade400,fontSize: 12)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
