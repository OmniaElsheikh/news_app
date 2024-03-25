import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../../models/category_model.dart';
//import library 'package:cashed_network_image/cached_network_image';

class CategoryItemWidget extends StatelessWidget {
  final int index;
  final CategoryModel categoryModel;
  final Function? onCategoryClicked;
  const CategoryItemWidget({Key? key,
    required this.index,
    required this.categoryModel,
    this.onCategoryClicked
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() {
        if(onCategoryClicked==null)return;
        onCategoryClicked!(categoryModel);
      },
      child: Container(
        decoration: BoxDecoration(
      color: categoryModel.backgrounColor,
        borderRadius:BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
          bottomRight: index % 2 ==0? Radius.circular(0.0):Radius.circular(25),
          bottomLeft: index % 2 ==0? Radius.circular(25.0):Radius.circular(0),

        )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(categoryModel.image,
            fit:BoxFit.cover
            ),
            Text(categoryModel.title,
            style: Constants.theme.textTheme.bodyMedium,),

          ],
        ),
      ),
    );
  }
}
