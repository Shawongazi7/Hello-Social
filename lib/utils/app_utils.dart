import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class AppUtils {
  AppUtils._(); // Private constructor for singleton

  // Singleton instance
  static final AppUtils _instance = AppUtils._();

  // Public getter for the instance
  static AppUtils get instance => _instance;

  void showSuccessToast(String message,
      {Duration duration = const Duration(seconds: 3)}) {
    toastification.show(
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: duration,
      title: Text(message),
    );
  }

  void showErrorToast(String message,
      {Duration duration = const Duration(seconds: 3)}) {
    toastification.show(
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: duration,
      title: Text(message),
    );
  }

  void showInfoToast(String message,
      {Duration duration = const Duration(seconds: 3)}) {
    toastification.show(
      type: ToastificationType.info,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: duration,
      title: Text(message),
    );
  }

  void showWarningToast(String message,
      {Duration duration = const Duration(seconds: 3)}) {
    toastification.show(
      type: ToastificationType.warning,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: duration,
      title: Text(message),
    );
  }

  void showCustomToast({
    required Widget title,
    Duration autoCloseDuration = const Duration(seconds: 3),
    Alignment alignment = Alignment.topRight,
    ToastificationStyle style = ToastificationStyle.fillColored,
    Color? primaryColor,
    Color? backgroundColor,
    Color? foregroundColor,
    EdgeInsets? padding,
    EdgeInsets? margin,
    BorderRadius? borderRadius,
    List<BoxShadow>? boxShadow,
    bool showProgressBar = true,
    CloseButtonShowType closeButtonShowType = CloseButtonShowType.onHover,
    bool closeOnClick = false,
    bool pauseOnHover = true,
    bool dragToClose = true,
    bool applyBlurEffect = true,
    ToastificationCallbacks? callbacks,
  }) {
    toastification.show(
      type: ToastificationType.info,
      // Use a valid type instead of 'custom'
      style: style,
      autoCloseDuration: autoCloseDuration,
      title: title,
      alignment: alignment,
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      boxShadow: boxShadow,
      showProgressBar: showProgressBar,
      closeButtonShowType: closeButtonShowType,
      closeOnClick: closeOnClick,
      pauseOnHover: pauseOnHover,
      dragToClose: dragToClose,
      applyBlurEffect: applyBlurEffect,
      callbacks:
          callbacks ?? const ToastificationCallbacks(), // Provide a default value
    );
  }
}
