import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/news.dart';

class NewsReadPage extends StatelessWidget {
  const NewsReadPage({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _Image(news: news),
          const _Appbar(),
          Container(
            margin: const EdgeInsets.only(top: 240),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 42),
                _Title(news: news),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 16,
                    ),
                    children: [
                      _Content(news: news),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: AppColors.grey,
      ),
    );
  }
}

class _Appbar extends StatelessWidget {
  const _Appbar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.main,
            AppColors.main,
            const Color(0xff555FB4).withOpacity(0.8),
            const Color(0xff555FB4).withOpacity(0.5),
            const Color(0xff555FB4).withOpacity(0.2),
            const Color(0xff555FB4).withOpacity(0),
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            news.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 26,
              fontWeight: FontWeight.w700,
              fontFamily: 'SFB',
            ),
          ),
        ),
        Container(
          height: 20,
          width: 54,
          decoration: BoxDecoration(
            color: AppColors.main,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              news.date,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 9,
                fontWeight: FontWeight.w300,
                fontFamily: 'SFL',
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Text(
      news.content,
      style: const TextStyle(
        color: Color(0xff787878),
        fontSize: 22,
        fontWeight: FontWeight.w500,
        fontFamily: 'SFM',
      ),
    );
  }
}
