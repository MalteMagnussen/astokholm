import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

enum Direction { left, right }

class MyArrow extends StatelessWidget {
  const MyArrow({
    Key? key,
    required this.pageController,
    required this.direction,
  }) : super(key: key);

  Future<void> goToNextPage() {
    return pageController.nextPage(duration: duration(), curve: Curves.easeIn);
  }

  Future<void> goToPreviousPage() {
    return pageController.previousPage(
        duration: duration(), curve: Curves.easeOut);
  }

  Duration duration() => const Duration(milliseconds: 300);
  final PdfController pageController;
  final Direction direction;
  final double padding = 15;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30,
      icon: Icon(direction == Direction.right
          ? Icons.arrow_forward_ios
          : Icons.arrow_back_ios),
      onPressed: () {
        direction == Direction.right ? goToNextPage() : goToPreviousPage();
      },
    );
  }
}
