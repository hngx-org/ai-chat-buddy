import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.validator,
    required this.controller,
    this.autovalidateMode,
    this.isPassword = true,
  });

  final String label;
  final String hint;
  final String? Function(String?) validator;
  final AutovalidateMode? autovalidateMode;
  final TextEditingController controller;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword ? obscureText : false,
          autovalidateMode: widget.autovalidateMode,
          validator: (value) {
            return widget.validator(value);
          },
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: obscureText
                        ? Icon(MdiIcons.eyeOutline)
                        : Icon(MdiIcons.eyeOffOutline),
                  )
                : null,
            hintText: widget.hint,
            hintStyle: const TextStyle(
              color: Colors.white38,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
