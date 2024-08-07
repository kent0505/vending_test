import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Column(
        children: [
          CustomAppbar('Settings'),
          SizedBox(height: 100),
          _SettingsTile(
            asset: 's1',
            title: 'Share with friends',
          ),
          _Divider(),
          _SettingsTile(
            asset: 's2',
            title: 'Terms of use',
          ),
          _Divider(),
          _SettingsTile(
            asset: 's3',
            title: 'Help center',
          ),
          _Divider(),
          _SettingsTile(
            asset: 's4',
            title: 'Privacy Policy',
          ),
          _Divider(),
          _SettingsTile(
            asset: 's5',
            title: 'Send notification',
            notification: true,
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.asset,
    required this.title,
    this.notification = false,
  });

  final String asset;
  final String title;
  final bool notification;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: CupertinoButton(
        onPressed: notification ? null : () {},
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            const SizedBox(width: 20),
            SvgPicture.asset('assets/$asset.svg'),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xff1B1B1B),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'SFM',
              ),
            ),
            const Spacer(),
            if (notification) const _Switch(),
            const SizedBox(width: 14),
          ],
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5,
      margin: const EdgeInsets.only(
        left: 20,
        right: 14,
      ),
      color: AppColors.main,
    );
  }
}

class _Switch extends StatefulWidget {
  const _Switch();

  @override
  State<_Switch> createState() => __SwitchState();
}

class __SwitchState extends State<_Switch> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        setState(() {
          active = !active;
        });
      },
      padding: EdgeInsets.zero,
      minSize: 31,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 51,
        height: 31,
        decoration: BoxDecoration(
          color: active ? AppColors.main : Colors.grey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              top: 2,
              left: active ? 22 : 2,
              child: Container(
                height: 27,
                width: 27,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
