import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/app_core/pakages/iconsax_pakage.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hint,
    this.icon,
    this.type,
    this.txtController,
    this.validator,
    this.disabled = false,
  });

  final String hint;
  final IconData? icon;

  // ------------------------ Determines what type of text field is designed for ------------------------
  final TextInputType? type;
  final TextEditingController? txtController;
  final String? Function(String?)? validator;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    // ------------------------ For show pssword or not ------------------------
    ValueNotifier<bool> obscure = ValueNotifier<bool>(
      type == TextInputType.visiblePassword,
    );

    // ------------------------ Use valueListenableBuilder for show password and show text  ------------------------
    return ValueListenableBuilder(
      valueListenable: obscure,
      builder: (context, isObscure, child) {
        return TextFormField(
          // ------------------------ If readOnly is equal true, fiels is read only ------------------------
          readOnly: disabled,
          controller: txtController,
          validator: validator,
          maxLength: type == TextInputType.number ? 11 : null,

          obscureText:
              type == TextInputType.visiblePassword ? isObscure : false,
          keyboardType: type ?? TextInputType.text,
          decoration: InputDecoration(
            counterText: '',
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0).r,
            fillColor: disabled ? const Color(0xffefefef) : Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0.r),
              borderSide: BorderSide(color: Theme.of(context).dividerColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0.r),
              borderSide: BorderSide(
                  color: disabled
                      ? const Color(0xffefefef)
                      : Theme.of(context).primaryColor,
                  width: 1.5),
            ),
            hintText: hint,
            hintStyle: TextStyle(color: Theme.of(context).hintColor),

            // ------------------------ If suffixIcon is equal true, show icon ------------------------
            // ------------------------ If suffixIcon is equal false, return null ------------------------
            suffixIcon: icon != null || type == TextInputType.visiblePassword
                ? GestureDetector(
                    onTap: () {
                      if (type == TextInputType.visiblePassword) {
                        obscure.value = !obscure.value;
                      }
                    },
                    child: type != TextInputType.visiblePassword
                        ? IconsaxPakage(
                            icon: icon!,
                            iconSize: 23,
                          )
                        : IconsaxPakage(
                            icon: isObscure
                                ? IconsaxPakage.eyeSlash
                                : IconsaxPakage.eye,
                            iconSize: 23,
                          ),
                  )
                : null,
            suffixIconColor: Theme.of(context).hintColor,
          ),
        );
      },
    );
  }
}
