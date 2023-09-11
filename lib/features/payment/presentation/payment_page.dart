import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tz/common/templates/colors/app_colors.dart';
import 'package:tz/common/templates/styles/custom_styles.dart';
import 'package:tz/common/templates/widgets/app_bar_widget.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late int randomNumber;

  @override
  void initState() {
    randomNumber = Random().nextInt(100000) + 50000;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBarWidget(
        text: 'Заказ оплачен',
        leadingIcon: Icon(Iconsax.arrow_left_2),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          paymentResultWidget(context),
          toHotelPageButton(context),
        ],
      ),
    );
  }

  Expanded paymentResultWidget(BuildContext context) {
    return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/payment_congrats.png', scale: 2),
                const SizedBox(height: 32),
                Text('Ваш заказ принят в работу',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 16),
                Text(
                  'Подтверждение заказа №$randomNumber может занять некоторое время (от 1 часа до суток).\nКак только мы получим ответ от туроператора, вам на почту придет уведомление.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.grayText,
                        fontWeight: FontWeight.normal,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
  }

  Container toHotelPageButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
          color: Colors.white,
          border:
              Border(top: BorderSide(color: AppColors.elevatedButtonStroke))),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
        },
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          minimumSize: const Size.fromHeight(50),
        ),
        child: Text('Супер!',
            style: Theme.of(context).textTheme.elevatedButtonTextStyle),
      ),
    );
  }
}
