import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.textEditingController,
      required this.title,
      required this.hintText,
      this.validator,
      this.obsecure = false,
      this.autovalidateMode,
      this.keyboardType,
      this.maxLines = 1,
      this.minLines,
      this.enabled = true,
      this.textInputAction,
      this.onSubmit})
      : super(key: key);

  final TextEditingController textEditingController;
  final String title;
  final String hintText;
  final String? Function(String?)? validator;
  final bool obsecure;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final bool enabled;
  final TextInputAction? textInputAction;
  final Function()? onSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          color: Colors.white,
          child: TextFormField(
            // onEditingComplete: () => onSubmit != null ? onSubmit!() : null,
            textInputAction: textInputAction,
            enabled: enabled,
            obscureText: obsecure ? true : false,
            controller: textEditingController,
            validator: validator,
            autovalidateMode: autovalidateMode,
            minLines: minLines,
            maxLines: maxLines,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}
