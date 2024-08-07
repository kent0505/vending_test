import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.asset = '',
    this.active = true,
    required this.onPressed,
  });

  final String title;
  final String asset;
  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: active ? AppColors.main : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.main,
          width: 1,
        ),
      ),
      child: CupertinoButton(
        onPressed: active ? onPressed : null,
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: active ? Colors.white : AppColors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'SFM',
              ),
            ),
            if (asset.isNotEmpty) ...[
              const SizedBox(width: 7),
              SvgPicture.asset('assets/$asset.svg'),
            ]
          ],
        ),
      ),
    );
  }
}
