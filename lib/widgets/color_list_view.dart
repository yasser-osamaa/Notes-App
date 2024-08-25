
import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected, required this.color});
  final Color color;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 32,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 32,
          );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int colorIndex = 0;
  List<Color> colors = [
    const Color(0xff8C1C13),
    const Color(0xffBF4342),
    const Color(0xffE7D7C1),
    const Color(0xffA78A7F),
    const Color(0xff735751),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () {
                colorIndex = index;
                setState(() {});
              },
              child: ColorItem(
                isSelected: index == colorIndex,
                color: colors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
