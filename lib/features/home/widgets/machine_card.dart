import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class MachineCard extends StatelessWidget {
  const MachineCard({super.key});

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
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 20,
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text(
                          'Drinks',
                          style: TextStyle(
                            color: AppColors.main,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'SFL',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Coffee machine',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'SFB',
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Rue des Degres',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'SFL',
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 72,
            color: Colors.white,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Products',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'SFL',
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 20,
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text(
                          'Coffee',
                          style: TextStyle(
                            color: Color(0xffA68120),
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'SFL',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
