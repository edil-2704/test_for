import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:test_new/text_styles.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Circles
          Positioned(
            top: 80,
            left: -199,
            child: Container(
              width: 317.w,
              height: 359.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff6B66D8),
                    spreadRadius: 10.r,
                    blurRadius: 100.r,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 370,
            left: 221,
            child: Container(
              width: 317.w,
              height: 359.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff6B66D8),
                    spreadRadius: 10.r,
                    blurRadius: 100.r,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 71,
            left: 16,
            child: BackButton(
              color: const Color(0xffFFFFFF).withOpacity(0.4),
            ),
          ),

          Positioned(
            top: 91.h,
            left: 91.w,
            child: const Text(
              'Выберите подписку',
              style: AppStyles.displayLarge,
            ),
          ),

          // Main Content
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 71.h),
            child: Column(
              children: [
                SizedBox(height: 100.h),

                // Subscription Cards
                SubscriptionCard(
                  isSelected: false,
                  title: '1 месяц',
                  description: 'Описание',
                  price: '1000р',
                  onTap: () {
                    log('1 месяц выбран');
                  },
                  title2: 'Описание',
                ),
                SizedBox(height: 24.h),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SubscriptionCard(
                      isSelected: true,
                      title: '6 месяцев',
                      description: 'Описание',
                      price: '10 000р',
                      originalPrice: '12 000р',
                      isRecommended: true,
                      features: const [
                        'что входит',
                        'что входит',
                        'что входит',
                        'что входит',
                        'что входит',
                      ],
                      onTap: () {
                        log('6 месяцев выбран');
                      },
                      title2: 'Описание',
                    ),
                    Positioned(
                      top: -20,
                      left: 330,
                      child: Container(
                        alignment: Alignment.center,
                        height: 35,
                        width: 75,
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(13.r),
                        ),
                        child: const Text(
                          'выгодно',
                          style: AppStyles.purchaseText,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.h),

                // Purchase Button
                GestureDetector(
                  onTap: () {
                    log('Покупка выполнена');
                  },
                  child: Container(
                    height: 60.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6B66D8), Color(0xFFBABAD7)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(29.r),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Купить',
                      style: AppStyles.displayLarge,
                    ),
                  ),
                ),
                const Spacer(),

                // Footer
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'terms of use',
                      style: AppStyles.policyText,
                    ),
                    SizedBox(width: 15.w),
                    const Text(
                      'policy privacy',
                      style: AppStyles.policyText,
                    ),
                    SizedBox(width: 15.w),
                    ElevatedButton(
                      onPressed: () {
                        log('Восстановить покупку');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xff6B66D8).withOpacity(0.1),
                      ),
                      child: const Text(
                        'Restore purchase',
                        style: AppStyles.policyText,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Subscription Card Widget
class SubscriptionCard extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String title2;
  final String description;
  final String price;
  final String? originalPrice;
  final bool isRecommended;
  final List<String>? features;
  final VoidCallback onTap;

  const SubscriptionCard({
    super.key,
    required this.isSelected,
    required this.title,
    required this.description,
    required this.price,
    this.originalPrice,
    this.isRecommended = false,
    this.features,
    required this.onTap,
    required this.title2,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.r),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF).withOpacity(0.1),
          borderRadius: BorderRadius.circular(29.r),
          border: isSelected
              ? GradientBoxBorder(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFFFFFFFF).withOpacity(0),
                      const Color(0xFFFFFFFF),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                )
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    log('Button pressed');
                  },
                  icon: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [
                          Color(0xFF6B66D8),
                          Color(0xFFBABAD7),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds);
                    },
                    child: Column(
                      children: [
                        Icon(
                          isSelected
                              ? Icons.check_circle
                              : Icons.radio_button_off,
                          color: Colors
                              .white, // This is necessary to show the gradient
                          size: 32.r,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppStyles.cardText,
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        title2,
                        style: AppStyles.cardText,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      price,
                      style: AppStyles.cardText,
                    ),
                    if (originalPrice != null)
                      Text(
                        originalPrice!,
                        style: AppStyles.cardTextLined,
                      ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            if (features != null)
              Row(
                children: [
                  SizedBox(width: 20.w),
                  Column(
                    children: features!
                        .map(
                          (feature) => Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.circle,
                                  size: 6, color: Colors.white),
                              SizedBox(width: 16.w),
                              Text(
                                feature,
                                style: AppStyles.cardTextEnter,
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
