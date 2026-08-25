import 'package:flutter/material.dart';

class FFButtonOptions {
  const FFButtonOptions({
    this.textStyle,
    this.elevation,
    this.height,
    this.width,
    this.padding,
    this.color,
    this.disabledColor,
    this.disabledTextColor,
    this.splashColor,
    this.iconSize,
    this.iconColor,
    this.iconPadding,
    this.borderRadius,
    this.borderSide,
  });

  final TextStyle? textStyle;
  final double? elevation;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final Color? splashColor;
  final double? iconSize;
  final Color? iconColor;
  final EdgeInsetsGeometry? iconPadding;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
}

class FFButtonWidget extends StatelessWidget {
  const FFButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.iconData,
    required this.options,
    this.showLoadingIndicator = true,
  });

  final String text;
  final Widget? icon;
  final IconData? iconData;
  final VoidCallback? onPressed;
  final FFButtonOptions options;
  final bool showLoadingIndicator;

  @override
  Widget build(BuildContext context) {
    Widget textWidget = Text(
      text,
      style: options.textStyle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );

    return SizedBox(
      height: options.height ?? 44,
      width: options.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: options.color ?? Theme.of(context).primaryColor,
          elevation: options.elevation ?? 2,
          padding: options.padding ?? const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: options.borderRadius ?? BorderRadius.circular(8),
            side: options.borderSide ?? BorderSide.none,
          ),
        ),
        child: textWidget,
      ),
    );
  }
}
