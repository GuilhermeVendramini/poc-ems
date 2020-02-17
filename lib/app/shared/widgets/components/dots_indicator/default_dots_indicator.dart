import 'package:flutter/material.dart';

class DefaultDotsIndicator extends AnimatedWidget {
  DefaultDotsIndicator({
    this.pageController,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: pageController);

  final PageController pageController;
  final int itemCount;
  final ValueChanged<int> onPageSelected;
  final Color color;

  Widget _buildDot(int index) {
    IconData _icon = Icons.radio_button_unchecked;

    if ((pageController.page == null && index == 0) ||
        (index == pageController.page)) {
      _icon = Icons.brightness_1;
    }

    return GestureDetector(
      onTap: () => onPageSelected(index),
      child: Icon(
        _icon,
        color: color,
      ),
    );
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
