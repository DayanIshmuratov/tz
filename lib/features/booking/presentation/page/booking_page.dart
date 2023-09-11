import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tz/common/templates/styles/custom_styles.dart';
import 'package:tz/common/templates/widgets/app_bar_widget.dart';
import 'package:tz/common/templates/widgets/error_widget.dart';
import 'package:tz/common/templates/widgets/loading_widget.dart';
import 'package:tz/features/booking/domain/entities/booking_entity.dart';
import 'package:tz/features/booking/presentation/widgets/about_booking_widget.dart';
import 'package:tz/features/booking/presentation/widgets/payment_info_widget.dart';
import '../../../../common/templates/colors/app_colors.dart';
import '../state/booking_cubit.dart';
import '../widgets/booking_hotel_info_widget.dart';


class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<TouristInfoWidget> tourists = [];
  int touristCount = 0;
  final List<String> touristNumbersName = ["Второй", "Третий", "Четвертый", "Пятый", "Шестой", "Седьмой", "Восьмой", "Девятый", "Десятый"];

  void _addContainer() {
    if(touristCount < touristNumbersName.length) {
      setState(() {
        touristCount++;
        tourists.add(TouristInfoWidget(touristNumbersName[touristCount - 1]));
      });
    }
  }

  String formatNumberWithSpaces(int number) {
    String numberStr = number.toString();
    String formattedNumber = '';
    int count = 0;

    for (int i = numberStr.length - 1; i >= 0; i--) {
      formattedNumber = numberStr[i] + formattedNumber;
      count++;
      if (count % 3 == 0 && i > 0) {
        formattedNumber = ' ' + formattedNumber;
      }
    }

    return formattedNumber;
  }

  @override
  Widget build(BuildContext context) {
    context.read<BookingCubit>().getData();
    return Scaffold(
      appBar: const CustomAppBarWidget(
        text: 'Бронирование',
        leadingIcon: Icon(Iconsax.arrow_left_2),
      ),
      body: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          if (state is BookingLoading) {
            return const LoadingWidget();
          }
          if (state is BookingLoaded) {
            final booking = state.booking;
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                    children: [
                      const SizedBox(height: 8),
                      BookingHotelInfoWidget(booking: state.booking,),
                      const SizedBox(height: 8),
                      AboutBookingWidget(booking: state.booking),
                      const SizedBox(height: 8),
                      CustomerInfoWidget(),
                      const SizedBox(height: 8),
                      TouristInfoWidget("Первый"),
                      Column(children: tourists),
                      addTouristButtonWidget(context),
                      const SizedBox(height: 8),
                      PaymentInfoWidget(booking: state.booking),
                      const SizedBox(height: 10),
                      toPaymentPageButton(context, booking),
                    ]),
              ),
            );
          }
          if (state is BookingError) {
            return ErrorTextWidget(message: state.message);
          } else {
            return const ErrorTextWidget(message: 'Неожиданная ошибка');
          }
        },
      ),
    );
  }

  Container addTouristButtonWidget(BuildContext context) {
    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Добавить туриста', style: Theme.of(context).textTheme.titleMedium),
                            InkWell(
                              onTap: () {
                                _addContainer();
                              },
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.0),
                                  color: AppColors.blueText,
                                ),
                                child: const Icon(
                                  Iconsax.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
  }

  Container toPaymentPageButton(BuildContext context, BookingEntity booking) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: BorderDirectional(
          top: BorderSide(color: AppColors.elevatedButtonStroke),
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            log('Го ту зе некст скрин');
            Navigator.of(context).pushNamed('payment_page');
          }
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)),
          minimumSize: const Size.fromHeight(50),
        ),
        child: Text(
            'Оплатить ${formatNumberWithSpaces(booking.tourPrice + booking.fuelCharge + booking.serviceCharge)} ₽',
            style: Theme.of(context).textTheme.elevatedButtonTextStyle,
      ),
    ),
    );
  }
}

class CustomerInfoWidget extends StatefulWidget {
  CustomerInfoWidget({Key? key}) : super(key: key);

  @override
  State<CustomerInfoWidget> createState() => _CustomerInfoWidgetState();
}

class _CustomerInfoWidgetState extends State<CustomerInfoWidget> {
  final _phoneController = MaskedTextController(mask: '+7 (***) ***-**-**');
  final _emailController = TextEditingController();

  bool _isPhoneNumberValid = true;
  bool _isEmailValid = true;

  void _validateEmail(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    final bool isValid = emailRegex.hasMatch(email);

    setState(() {
      _isEmailValid = isValid;
    });
  }

  void _validatePhone (String phoneNumber) {
    if (phoneNumber.length == 18){
      setState(() {
        _isPhoneNumberValid = true;
      });
    } else {
      setState(() {
        _isPhoneNumberValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Информация о покупателе', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  color: _isPhoneNumberValid ? AppColors.textFieldBackGround : AppColors.validationFail,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
              style: const TextStyle(fontSize: 16),
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Номер телефона',
                hintText: '+7 (***) ***-**-**',
                labelStyle: Theme.of(context).textTheme.textFieldLabelStyle,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                errorText: _isPhoneNumberValid ? null : 'Введите корректный номер телефона',
              ),
              validator: (value) {
                if (value!.length == 18) {
                  setState(() {
                    _isPhoneNumberValid = true;
                  });
                  return null;
                } else {
                  setState(() {
                    _isPhoneNumberValid = false;
                  });
                  return 'Введите корректный номер телефона';
                }
              },
              onChanged: (phone) {
                _validatePhone(phone);
              },
            ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: _isEmailValid ? AppColors.textFieldBackGround : AppColors.validationFail,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  style: const TextStyle(fontSize: 16),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Почта',
                    labelStyle: Theme.of(context).textTheme.textFieldLabelStyle,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    errorText: _isEmailValid ? null : 'Введите корректную почту',
                  ),
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      setState(() {
                        _isEmailValid = true;
                      });
                      return null;
                    } else {
                      setState(() {
                        _isEmailValid = false;
                      });
                      return 'Введите корректную почту';
                    }
                  },
                  onChanged: (email) {
                    _validateEmail(email);
                  },
                ),
              ),
              const SizedBox(height: 8.0),
              Text('Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.grayText,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ]),
      ),
    );
  }
}

class TouristInfoWidget extends StatefulWidget {
  final String touristNumber;

  const TouristInfoWidget(this.touristNumber, {super.key});

  @override
  _TouristInfoWidgetState createState() => _TouristInfoWidgetState();
}

class _TouristInfoWidgetState extends State<TouristInfoWidget> {
  bool isExpanded = false;
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  final List<bool> _isValidationError = List.generate(6, (index) => false);
  final List<String> fields = [
    'Имя',
    'Фамилия',
    'Дата рождения',
    'Гражданство',
    'Номер загранпаспорта',
    'Срок действия загранпаспорта'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${widget.touristNumber} турист',
                    style: Theme.of(context).textTheme.titleMedium),
                InkWell(
                  child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: AppColors.blueText.withOpacity(0.1),
                      ),
                      child: Icon(
                        isExpanded ? Iconsax.arrow_up_2 : Iconsax.arrow_down_1,
                        color: AppColors.blueText,
                      )),
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                ),
              ],
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  for (int i = 0; i < 6; i++)
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _isValidationError[i]
                                ? AppColors.validationFail
                                : AppColors.textFieldBackGround,
                          ),
                          child: TextFormField(
                            style: Theme.of(context).textTheme.bodyMedium,
                            controller: _controllers[i],
                            decoration: InputDecoration(
                              labelText: fields[i],
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .textFieldLabelStyle,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 16),
                              border: InputBorder.none,
                            ),
                            keyboardType: fields[i] == 'Дата рождения' ||
                                    fields[i] == 'Срок действия загранпаспорта'
                                ? TextInputType.datetime
                                : null,
                            validator: widget.touristNumber == 'Первый' ? (value) {
                              if (value!.isEmpty) {
                                setState(() {
                                  _isValidationError[i] = true;
                                });
                                return 'Поле не может быть пустым';
                              } else {
                                setState(() {
                                  _isValidationError[i] = false;
                                });
                              }
                              return null;
                            } : null,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                      ],
                    ),
                ],
              ),
            )
        ]),
      ),
    );
  }
}
