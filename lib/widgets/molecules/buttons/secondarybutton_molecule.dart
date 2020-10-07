import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Styles;

class SecondaryButton extends StatelessWidget {
  final Function onTap;
  final String text;

  SecondaryButton({this.onTap, this.text = ''});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(context),
      child: SizedBox(
        height: 52.0.w,
        child: BaseContainer(
            color: Styles.orangeE23C18,
            child: ButtonText(text.toUpperCase(), color: Colors.white,),
        ),
      ),
    );
  }
}