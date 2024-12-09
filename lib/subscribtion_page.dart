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
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 71.h,
            left: 16.w,
            child: const BackButton(),
          ),
          const SizedBox(height: 16),
          Positioned(
            top: 91.h,
            left: 91.w,
            child: SizedBox(
              height: 24.h,
              width: 262.w,
              child: const Text(
                'Выберите подписку',
                style: AppStyles.displayLarge,
              ),
            ),
          ),
          Positioned(
            top: 179.h,
            child: SubscriptionCard(
              isSelected: false,
              title: '1 месяц',
              description: 'Описание',
              price: '1000р',
              onTap: () {
                print('1 месяц выбран');
              },
              title2: 'Описание',
            ),
          ),
          Stack(
            children: [
              Positioned(
                top: 335.h,
                left: 32.w,
                child: SubscriptionCard(
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
                    print('6 месяцев выбран');
                  },
                  title2: 'Описание',
                ),
              ),
              Positioned(
                top: 320.h,
                left: 289.w,
                child: Container(
                  alignment: Alignment.center,
                  height: 35.h,
                  width: 75.w,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(13.r),
                  ),
                  child: Text(
                    'выгодно',
                    style: AppStyles.purchaseText,
                  ),
                ),
              ),
              Positioned(
                top: 628.h,
                left: 36.w,
                child: GestureDetector(
                  onTap: () {
                    print('Покупка выполнена');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    height: 60.h,
                    width: 317.w,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF6B66D8),
                          Color(0xFFBABAD7),
                        ],
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
              ),
            ],
          ),
          Positioned(
            top: 791.h,
            left: 57.w,
            child: Row(
              children: [
                const Text('terms of use', style: AppStyles.policyText),
                SizedBox(width: 15.w),
                const Text('policy privacy', style: AppStyles.policyText),
                SizedBox(width: 15.w),
                ElevatedButton(
                  onPressed: () {
                    print('Восстановить покупку');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff6B66D8).withOpacity(0.1),
                  ),
                  child: const Text(
                    'Restore purchase',
                    style: AppStyles.policyText,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Positioned(
                top: 80.h,
                left: -199.w,
                child: Container(
                  width: 317,
                  height: 359,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff6B66D8),
                        spreadRadius: 10.r,
                        blurStyle: BlurStyle.normal,
                        blurRadius: 100.r,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 370.h,
                left: 221.w,
                child: Container(
                  width: 317.w,
                  height: 359.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff6B66D8),
                        spreadRadius: 10.r,
                        blurStyle: BlurStyle.normal,
                        blurRadius: 100.r,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
        width: 321.w,
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF).withOpacity(0.1),
          borderRadius: BorderRadius.circular(29),
          border: isSelected
              ? GradientBoxBorder(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFFFFFFFF).withOpacity(0.1),
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
                    print('Button pressed');
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
                    child: Icon(
                      isSelected ? Icons.check_circle : Icons.radio_button_off,
                      color: Colors
                          .white, // This is necessary to show the gradient
                      size: 32,
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
                  crossAxisAlignment: CrossAxisAlignment.end,
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
            SizedBox(height: 30),
            Row(
              children: [
                if (features != null)
                  Column(
                    children: features!
                        .map(
                          (feature) => Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                size: 6,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                feature,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
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
