import 'package:cardoctor/res/color.dart';
import 'package:flutter/material.dart';

class PrimaryTextField extends StatefulWidget {
  PrimaryTextField({
    this.hintText = '',
    this.prefixIcon,
    this.labelText = '',
    Key? key,
    required TextInputType keyboardType,
    required TextEditingController controller,
    required String? Function(String value) onChanged,
    required String? Function(dynamic value) validator,
  }) : super(key: key);
  final IconData? prefixIcon;
  final String hintText;
  final String labelText;
  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        elevation: 16,
        shadowColor: Colors.black54,
        child: TextFormField(
            validator: (value) {},
            controller: null,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 6),
              prefixIcon: widget.prefixIcon != null
                  ? Icon(widget.prefixIcon,
                      size: 20, color: AppColors.iconBackgroundColor)
                  : const SizedBox.shrink(),
              //border: InputBorder.none,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              hintText: widget.hintText,
              labelText: widget.labelText,
              hintStyle: TextStyle(
                color: AppColors.hintColor,
                fontWeight: FontWeight.normal,
              ),
              //       labelStyle: TextStyle(
              //           color: AppColors.hintColor, fontWeight: FontWeight.normal)),
            )));
  }
}
