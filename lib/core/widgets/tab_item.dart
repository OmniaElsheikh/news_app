import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';

import '../../data/models/source_model.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  final SourceModel sourceModel;

  TabItem({Key? key, required this.sourceModel, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 34,
      padding: EdgeInsets.symmetric(vertical: 4,horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color:isSelected?Constants.theme.primaryColor:Colors.transparent,
        border: Border.all(
          color:Constants.theme.primaryColor,
          width: 2,

        )
      ),
      child: Text(
        sourceModel.name,
        style: Constants.theme.textTheme.bodyMedium?.copyWith(color:isSelected? Colors.white:Constants.theme.primaryColor),

      ),
    );
  }
}
