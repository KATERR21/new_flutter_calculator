import 'package:flutter/material.dart';

class Sliders extends StatefulWidget {

  Function(int price) onChange;
  int size;

  Sliders({Key? key, required this.onChange, this.size = 0}) : super(key: key);

  @override
  _SlidersState createState() => _SlidersState(value: size.toDouble());
}

class _SlidersState extends State<Sliders> {
  double value;
  _SlidersState({this.value = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(36)),
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Text(
                value.round().toString(),
                style: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          SizedBox(
            height: 10,
            child: Slider.adaptive(
              activeColor: Colors.red,
              value: value,
              min: 25,
              max: 35,
              divisions: 2,
              label: value.round().toString(),
              onChanged: (double value) {
                widget.onChange(value.toInt());
                setState(() {this.value = value;});
              },
            ),
          ),
        ],
      ),
    );
  }
}