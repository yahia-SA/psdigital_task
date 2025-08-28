import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';

class ToogleWidget extends StatefulWidget {
  const ToogleWidget({super.key, this.isActive = false, this.onChanged});
  final bool isActive;
  final ValueChanged<bool>? onChanged;

  @override
  State<ToogleWidget> createState() => _ToogleWidgetState();
}

class _ToogleWidgetState extends State<ToogleWidget> {
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    _isActive = widget.isActive;
  }

  void _toggle() {
    setState(() {
      _isActive = !_isActive;
    });
    widget.onChanged?.call(_isActive);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 52.w,
        height: 32.h,
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: AppColor.black,
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 300),
          alignment:
              _isActive ? Alignment.centerLeft : Alignment.centerRight,
          curve: Curves.easeOut,
          child: Container(
            width: 24.w,
            height: 24.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _isActive ? AppColor.orange : AppColor.gray,
            ),
            child: Icon(Icons.done, color: AppColor.black, size: 16.w),
          ),
        ),
      ),
    );
  }
}
