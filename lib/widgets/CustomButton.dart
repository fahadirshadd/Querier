import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:querier/widgets/CustomText.dart';

class CustomButton extends StatelessWidget {
  final title, route;
  final GestureTapCallback onPressed;
  CustomButton(
      {Key? key, required this.title, this.route, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          primary: Colors.black,
        ),
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: CustomText(
            text: title,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
