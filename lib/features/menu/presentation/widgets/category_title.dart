import 'package:flutter/material.dart';
import 'package:psdigital_task/core/theme/app_text.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    super.key,
    required this.title,
    required this.length,
  });
final String title;
final int length;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: title,
        style: AppText.bold22,
        children: [
          TextSpan(
            text: ' ($length Items)',
            style: AppText.regular16,
          ),
        ],
      ),
    );
  }
}
