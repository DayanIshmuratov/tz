import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class Peculiarities extends StatelessWidget {
  final List<dynamic> peculiarities;

  const Peculiarities({super.key, required this.peculiarities});
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 2.0,
      children: [
        for (var peculiarity in peculiarities)
          Chip(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            label: Text(
              peculiarity,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.grayText,
              ),
            ),
            backgroundColor: AppColors.grayChip,
          ),
      ],);
  }

}