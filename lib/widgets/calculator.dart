import 'package:flutter/material.dart';
import 'package:new_flutter_calculator/utils/utils.dart';
import 'package:new_flutter_calculator/widgets/images.dart';
import 'package:new_flutter_calculator/widgets/color.dart';
import 'package:new_flutter_calculator/widgets/sliders.dart';
import 'package:new_flutter_calculator/widgets/button.dart';
import 'package:new_flutter_calculator/widgets/padding.dart';
import 'package:new_flutter_calculator/widgets/header.dart';
import 'package:new_flutter_calculator/widgets/radio_group.dart';
import 'package:new_flutter_calculator/widgets/switches.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  bool cheese = false;
  int size = 30;
  int sauce = 0;
  int type = 10;

  String get price {
    int price = 0;
    if (cheese) price += 100;
    price += (size * 6).round();
    price += (sauce * 1).round();
    price += (type * 20).round();
    return '${price} рублей';
  }

  @override
  Widget build(BuildContext context) {
    return ColorQ(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(Images.pizza, height: 150,),),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 14),
                    child: Column(
                      children: [
                        CustomPadding(
                          child: const Text('Калькулятор пиццы',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 36,
                                fontStyle: FontStyle.italic,
                                color: Colors.red),
                          ),
                        ),
                        CustomPadding(
                          child: const Text(
                            'Выберите параметры:',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.deepOrangeAccent),
                          ),
                          padding: const EdgeInsets.only(top: 16),
                        ),
                        CustomPadding(
                          child: Switches(onChange: (value) {
                            setState(() {type = value;});
                          },
                          ),
                          padding: const EdgeInsets.only(top: 30),
                        ),
                        CustomPadding(
                          child: Header(text: 'Размер:',
                            child: Sliders(size: size,
                                onChange: (value) {
                                  setState(() {size = value;});
                                }),
                          ),
                        ),
                        CustomPadding(
                          child: Header(text: 'Соус:',
                            child: RadioGroupState(
                                onChange: (value) {
                                  setState(() {sauce = value;});
                                }),
                          ),
                        ),
                        CustomPadding(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(Images.cheese, height: 60,),
                                      const Text('Дополнительный сыр',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 16)),
                                      Switch(
                                          value: cheese,
                                          onChanged: (value) {
                                            setState(() {cheese = value;});
                                          })
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        CustomPadding(
                          child: Header(text: 'Стоимость:',
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(36)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                child: Text(price),
                              ),
                            ),
                          ),
                        ),
                        CustomPadding(
                          child: Button(text: 'Заказать',
                              action: (){
                                showInSnackBar(context, 'Ваш заказ принят');}),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}