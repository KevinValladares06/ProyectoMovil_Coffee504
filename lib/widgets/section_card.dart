import 'package:flutter/material.dart';
import '../Styles/app_styles.dart';

class SectionCard extends StatelessWidget {
  final Widget child;

  const SectionCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.padding,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(padding: AppSizes.cardPadding, child: child),
      ),
    );
  }
}
