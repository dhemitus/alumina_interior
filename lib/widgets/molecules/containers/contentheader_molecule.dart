import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';

class ContentHeader extends StatelessWidget {
  final String head;
  final String body;

  ContentHeader({this.head, this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BodyText2(head),
        SizedBox(height: 14.0.w,),
        SubtitleText2(body),
      ],
    );
  }
}
