import 'package:flutter/material.dart';

import '../../config/constants.dart';

class CustomDrawer extends StatelessWidget {
  Function onDrawerClick;
   CustomDrawer({Key? key,
  required this.onDrawerClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.mediaquery.size.width*0.8,
      color: Colors.white,
      child:Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 170,
            width: Constants.mediaquery.size.width*0.8,
            color:Constants.theme.primaryColor,
            child: Text("News App",
            style: Constants.theme.textTheme.titleLarge,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                onDrawerClick();
              },
              child: Row(
                children: [
                  Icon(Icons.list,
                      size:40,
                      color:Colors.black
                  ),
                  const SizedBox(width: 8.0,),
                  Text("Categories",
                    style: Constants.theme.textTheme.titleLarge?.copyWith(
                      color: Colors.black,
                    )

                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.settings,
                      size:40,
                      color:Colors.black
                  ),
                  const SizedBox(width: 8.0,),
                  Text("Settings",
                    style: Constants.theme.textTheme.titleLarge?.copyWith(
                      color: Colors.black,
                    )

                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }

}
