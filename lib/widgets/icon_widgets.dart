import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TransitCardWidget extends StatelessWidget {
  TransitCardWidget({
    super.key,
    this.icon,
    required this.title,
    this.subTitle,
    this.onClick,
    this.image,
  });

  IconData? icon;
  final String title;
  final String? subTitle;
  final void Function()? onClick;
  String? image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(24),
        // margin: EdgeInsets.only(bottom: 3),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Color(0xffF0F2F5))),
          // ignore: deprecated_member_use
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2))],
        ),
        child: Row(
          children: [
            image == null || image!.isEmpty
                ? Icon(icon, size: 25, color: Colors.grey.shade600)
                : Container(
                    width: 56,
                    height: 56,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xffF7F9FC),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Image.asset("$image", width: 25),
                  ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff333333),
                      ),
                    ),
                    Text(
                      subTitle!,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xff888888),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Icon(Icons.chevron_right_outlined),
          ],
        ),
      ),
    );
  }
}
