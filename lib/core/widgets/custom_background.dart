import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CustomBackgroundWidget extends StatelessWidget {
  final Widget? child;
  const CustomBackgroundWidget({Key? key,this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
    decoration: BoxDecoration(
      image: DecorationImage(image:AssetImage ("assets/images/pattern.png"),
      fit: BoxFit.cover
      ),
    ),
      child: child,

    );
  }
}
