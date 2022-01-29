import 'package:flutter/material.dart';
import 'package:new_flutter_calculator/utils/utils.dart';

class Button extends StatelessWidget {

  Function()? action;
  String text;
  bool enabled;
  String enabledText;
  bool error;

  Button({Key? key, this.text = '',
    this.action,
    this.enabled = true,
    this.enabledText = '',
    this.error = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? action : () => showInSnackBar(context, enabledText),
      child: UnconstrainedBox(
        child: Container(
          decoration: BoxDecoration(
            color: enabled ? Colors.redAccent : Colors.grey,
            borderRadius: BorderRadius.circular(36),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 50),
            child: Center(child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text, style: const TextStyle(fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),),
                error ? const Icon(Icons.error) : Container()
              ],
            )),
          ),
        ),
      ),
    );
  }
}