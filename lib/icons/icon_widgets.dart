import 'package:flutter/material.dart';

// class IconWidget extends
class IconWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  IconData? icon;
  String? image;
  final void Function()? onClick;

  IconWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
    this.image,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Icon(Icons.chevron_right_outlined),
                  IconButton(
                    onPressed: () {},
                    icon: icon != null ? Icon(icon) : SizedBox(),
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(subtitle, style: TextStyle(color: Color(0xff888888))),
                  icon != null ? Icon(icon) : SizedBox(width: 24, height: 24),
                  image != null
                      ? Image.asset(image!)
                      : SizedBox(width: 24, height: 24),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
