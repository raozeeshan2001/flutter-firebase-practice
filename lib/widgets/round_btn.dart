import 'package:flutter/material.dart';

class RoundBtn extends StatefulWidget {
  final String title;
  final VoidCallback ontap;
  final bool loading;
  const RoundBtn(
      {super.key,
      required this.title,
      required this.ontap,
      this.loading = false});

  @override
  State<RoundBtn> createState() => _RoundBtnState();
}

class _RoundBtnState extends State<RoundBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        height: 50,
        child: Center(
          child: widget.loading
              ? CircularProgressIndicator()
              : Text(
                  widget.title,
                  style: TextStyle(color: Colors.white),
                ),
        ),
        decoration: BoxDecoration(
            color: Colors.purple, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
