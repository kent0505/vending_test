import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 117,
      margin: const EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.44),
            blurRadius: 4,
          ),
        ],
      ),
      child: const Row(
        children: [
          Column(
            children: [],
          ),
        ],
      ),
    );
  }
}
