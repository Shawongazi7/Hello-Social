import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef ErrorDialogBuilder = Widget Function(
  String title,
  String message,
  String buttonLabel,
  Function onPressed,
);

typedef LoadingWidgetBuilder = Widget Function(
  bool isLoading,
  Widget loadingWidget,
);

typedef LoadingInitBuilder = Widget Function(
  BuildContext context,
  Widget? child,
);

typedef ErrorDialogCallback = Function();

enum LoadingState {
  show,
  error,
  stop,
}

class Loading {
  Loading._internal();

  static final Loading _singleton = Loading._internal();

  static Loading instance() => _singleton;

  static void instanceShow({
    bool? onlyBlankScreen,
    bool? useWidget,
    Widget? loadingWidget,
    AlignmentGeometry? alignment,
    Color? opaqueColor,
    SystemUiOverlayStyle? systemUiOverlayStyle,
  }) {
    _singleton.show(
        useWidget: useWidget,
        alignment: alignment,
        loadingWidget: loadingWidget,
        systemUiOverlayStyle: systemUiOverlayStyle,
        opaqueColor: opaqueColor,
        onlyBlankScreen: onlyBlankScreen);
  }

  static void instanceHide() {
    _singleton.hide();
  }

  static void instanceShowErrorDialog({
    required String title,
    required String message,
    Function? onPressed,
    String? label,
    ErrorDialogBuilder? errorDialogBuilder,
    AlignmentGeometry? alignment,
    Color? opaqueColor,
    SystemUiOverlayStyle? systemUiOverlayStyle,
    bool? onBackErrorDialogDismiss,
  }) {
    _singleton.showErrorDialog(
      title: title,
      message: message,
      opaqueColor: opaqueColor,
      systemUiOverlayStyle: systemUiOverlayStyle,
      alignment: alignment,
      onBackErrorDialogDismiss: onBackErrorDialogDismiss,
      onPressed: onPressed,
      errorDialogBuilder: errorDialogBuilder,
      label: label,
    );
  }

  final ValueNotifier<LoadingState> _loadingState =
      ValueNotifier(LoadingState.stop);

  bool _LoadingTransitionBuilderIsCalled = false;
  bool _LoadingInitIsCalled = false;
  bool _useWidget = false;

  LoadingCustomization _customization = LoadingCustomization();
  LoadingCustomization _currentCustomization = LoadingCustomization();

  bool get isLoading => _loadingState.value == LoadingState.show ? true : false;

  LoadingState get loadingState => _loadingState.value;

  ValueNotifier<LoadingState> get loadingStateNotifier => _loadingState;

  _initialized({LoadingCustomization? customization}) {
    print('Initialized!');
    if (customization != null) {
      _customization = _defaultCustomization().copyWith(
        loadingWidget: customization.loadingWidget,
        errorDialogBuilder: customization.errorDialogBuilder,
        isDismissible: customization.isDismissible,
        opaqueColor: customization.opaqueColor,
        onlyBlankScreen: customization.onlyBlankScreen,
        alignment: customization.alignment,
        systemUiOverlayStyle: customization.systemUiOverlayStyle,
        onBackErrorDialogDismiss: customization.onBackErrorDialogDismiss,
        onPressedErrorDialogButton: customization.onPressedErrorDialogButton,
        errorDialogMessage: customization.errorDialogMessage,
        errorDialogButtonLabel: customization.errorDialogButtonLabel,
        errorDialogTitle: customization.errorDialogTitle,
      );
    } else {
      _customization = _defaultCustomization();
    }
  }

  void show({
    bool? onlyBlankScreen,
    bool? useWidget,
    Widget? loadingWidget,
    AlignmentGeometry? alignment,
    Color? opaqueColor,
    SystemUiOverlayStyle? systemUiOverlayStyle,
  }) {
    checkExceptions();
    _useWidget = useWidget ?? false;
    _currentCustomization = _customization.copyWith(
      onlyBlankScreen: onlyBlankScreen,
      loadingWidget: loadingWidget,
      alignment: alignment,
      opaqueColor: opaqueColor,
      systemUiOverlayStyle: systemUiOverlayStyle,
    );
    _loadingState.value = LoadingState.show;
    print('Loading Started!');
  }

  hide() {
    checkExceptions();
    if (_loadingState.value == LoadingState.stop) return;
    if (_loadingState.value == LoadingState.error) return;
    _loadingState.value = LoadingState.stop;
    _useWidget = false;
    print('Loading Stopped!');
  }

  showErrorDialog({
    required String title,
    required String message,
    Function? onPressed,
    String? label,
    ErrorDialogBuilder? errorDialogBuilder,
    AlignmentGeometry? alignment,
    Color? opaqueColor,
    SystemUiOverlayStyle? systemUiOverlayStyle,
    bool? onBackErrorDialogDismiss,
  }) {
    if (_loadingState.value == LoadingState.show) {
      print('Loading Stopped!');
    }
    checkExceptions();
    _currentCustomization = _customization.copyWith(
      errorDialogBuilder: errorDialogBuilder,
      alignment: alignment,
      opaqueColor: opaqueColor,
      systemUiOverlayStyle: systemUiOverlayStyle,
      errorDialogTitle: title,
      errorDialogMessage: message,
      errorDialogButtonLabel: label,
      onBackErrorDialogDismiss: onBackErrorDialogDismiss,
      onPressedErrorDialogButton: () async {
        if (onPressed != null) {
          await onPressed();
        }
        _onCloseErrorDialog();
      },
    );
    _loadingState.value = LoadingState.error;
    print('Loading Error Dialog Show!');
  }

  _onCloseErrorDialog() {
    if (_loadingState.value == LoadingState.stop) return;
    HapticFeedback.selectionClick();
    _loadingState.value = LoadingState.stop;
    _useWidget = false;
    print('Loading Error Dialog Closed!');
  }

  _stopLoadingAnyState() {
    if (loadingState == LoadingState.show) {
      hide();
    }
    if (loadingState == LoadingState.error) {
      _onCloseErrorDialog();
    }
  }

  Widget _overlyWidget(Widget? child) {
    return Material(
      key: UniqueKey(),
      child: Overlay(
        initialEntries: [
          OverlayEntry(
            builder: (context) {
              if (child == null) {
                return Container();
              }
              return child;
            },
          ),
          OverlayEntry(
            opaque: false,
            canSizeOverlay: true,
            builder: (context) {
              return _loadingOverlyEntryWidget();
            },
          ),
        ],
      ),
    );
  }

  Widget _loadingOverlyEntryWidget() {
    return ValueListenableBuilder(
      valueListenable: _loadingState,
      builder: (BuildContext context, LoadingState state, Widget? child) {
        return AnimatedSwitcher(
          duration: const Duration(
            milliseconds: 270,
          ),
          switchInCurve: Curves.fastOutSlowIn,
          switchOutCurve: Curves.fastOutSlowIn,
          child: stateWidget(state),
        );
      },
    );
  }

  Widget stateWidget(LoadingState state) {
    if (state == LoadingState.show && _useWidget == false) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        key: UniqueKey(),
        value: _currentCustomization.systemUiOverlayStyle!.copyWith(
          statusBarColor: Colors.transparent,
        ),
        child: Container(
          alignment: _currentCustomization.alignment,
          color: _currentCustomization.opaqueColor,
          child: _currentCustomization.loadingWidget,
        ),
      );
    }
    if (state == LoadingState.error) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        key: UniqueKey(),
        value: _currentCustomization.systemUiOverlayStyle!.copyWith(
          statusBarColor: Colors.transparent,
        ),
        child: Container(
          alignment: _currentCustomization.alignment,
          color: _currentCustomization.opaqueColor,
          child: _currentCustomization.errorDialogBuilder!(
            _currentCustomization.errorDialogTitle!,
            _currentCustomization.errorDialogMessage!,
            _currentCustomization.errorDialogButtonLabel!,
            _currentCustomization.onPressedErrorDialogButton!,
          ),
        ),
      );
    }

    return Container(
      key: UniqueKey(),
    );
  }

  checkExceptions() {
    if (!_LoadingInitIsCalled) {
      throw Exception(
          'You need to use the LoadingService "LoadingInit" widget before MaterialApp or GetMaterialApp to initialized the LoadingService.');
    }
    if (!_LoadingTransitionBuilderIsCalled) {
      throw Exception(
          'You need to use the LoadingService "LoadingTransitionBuilder" function in the MaterialApp or GetMaterialApp builder variable. Otherwise, this LoadingService will not work.');
    }
  }

  print(String message, {String? error}) {
    if (!kDebugMode) return;
    dev.log(
      message,
      name: 'Loading Service',
      error: error,
    );
  }
}

LoadingCustomization _defaultCustomization() {
  return LoadingCustomization(
    loadingWidget: _defaultLoadingWidget(),
    errorDialogBuilder: _defaultErrorDialogWidget(),
    isDismissible: false,
    onBackErrorDialogDismiss: true,
    opaqueColor: Colors.black26,
    onlyBlankScreen: false,
    alignment: Alignment.center,
    systemUiOverlayStyle: SystemUiOverlayStyle.light,
    errorDialogTitle: 'Error Occurred!',
    errorDialogMessage:
        'Oops! Something went wrong. It looks like there was a problem processing your request. Please try again later.',
    errorDialogButtonLabel: 'Closed',
    onPressedErrorDialogButton: () async {},
  );
}

Widget _defaultLoadingWidget() {
  return const CircularProgressIndicator(
    color: Colors.blue,
  );
}

ErrorDialogBuilder _defaultErrorDialogWidget() {
  return (String title, String message, String buttonLabel,
      Function onPressed) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 28),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
          const SizedBox(height: 6),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: Colors.grey),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              onPressed();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              alignment: Alignment.center,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Center(
              child: Text(
                buttonLabel,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  };
}

class LoadingCustomization {
  final Widget? loadingWidget;
  final ErrorDialogBuilder? errorDialogBuilder;
  final Color? opaqueColor;
  final bool? onlyBlankScreen;
  final bool? isDismissible;
  final bool? onBackErrorDialogDismiss;
  final AlignmentGeometry? alignment;
  final SystemUiOverlayStyle? systemUiOverlayStyle;
  final String? errorDialogTitle;
  final String? errorDialogMessage;
  final String? errorDialogButtonLabel;
  final ErrorDialogCallback? onPressedErrorDialogButton;

  LoadingCustomization({
    this.loadingWidget,
    this.errorDialogBuilder,
    this.opaqueColor,
    this.onlyBlankScreen,
    this.isDismissible,
    this.alignment,
    this.systemUiOverlayStyle,
    this.onBackErrorDialogDismiss,
    this.errorDialogTitle,
    this.errorDialogMessage,
    this.errorDialogButtonLabel,
    this.onPressedErrorDialogButton,
  });

  LoadingCustomization copyWith({
    Widget? loadingWidget,
    ErrorDialogBuilder? errorDialogBuilder,
    Color? opaqueColor,
    bool? onlyBlankScreen,
    bool? isDismissible,
    bool? onBackErrorDialogDismiss,
    AlignmentGeometry? alignment,
    SystemUiOverlayStyle? systemUiOverlayStyle,
    String? errorDialogTitle,
    String? errorDialogMessage,
    String? errorDialogButtonLabel,
    ErrorDialogCallback? onPressedErrorDialogButton,
  }) {
    return LoadingCustomization(
      loadingWidget: loadingWidget ?? this.loadingWidget,
      errorDialogBuilder: errorDialogBuilder ?? this.errorDialogBuilder,
      opaqueColor: opaqueColor ?? this.opaqueColor,
      onlyBlankScreen: onlyBlankScreen ?? this.onlyBlankScreen,
      isDismissible: isDismissible ?? this.isDismissible,
      onBackErrorDialogDismiss:
          onBackErrorDialogDismiss ?? this.onBackErrorDialogDismiss,
      alignment: alignment ?? this.alignment,
      systemUiOverlayStyle: systemUiOverlayStyle ?? this.systemUiOverlayStyle,
      errorDialogTitle: errorDialogTitle ?? this.errorDialogTitle,
      errorDialogMessage: errorDialogMessage ?? this.errorDialogMessage,
      errorDialogButtonLabel:
          errorDialogButtonLabel ?? this.errorDialogButtonLabel,
      onPressedErrorDialogButton:
          onPressedErrorDialogButton ?? this.onPressedErrorDialogButton,
    );
  }
}

TransitionBuilder LoadingTransitionBuilder({
  TransitionBuilder? builder,
}) {
  final loading = Loading.instance();
  loading._LoadingTransitionBuilderIsCalled = true;

  return (BuildContext context, Widget? child) {
    if (builder != null) {
      return builder(context, loading._overlyWidget(child));
    } else {
      return loading._overlyWidget(child);
    }
  };
}

class LoadingInit extends StatefulWidget {
  final LoadingInitBuilder builder;
  final LoadingCustomization? customization;
  final Widget? child;

  const LoadingInit({
    super.key,
    required this.builder,
    this.customization,
    this.child,
  });

  @override
  State<LoadingInit> createState() => _LoadingInitState();
}

class _LoadingInitState extends State<LoadingInit> with WidgetsBindingObserver {
  final loading = Loading.instance();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    loading._LoadingInitIsCalled = true;
    loading._initialized(customization: widget.customization);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<bool> didPopRoute() async {
    super.didPopRoute();
    if (loading.loadingState != LoadingState.stop) {
      if (loading._useWidget) {
        loading._stopLoadingAnyState();
        return false;
      }

      if (loading._currentCustomization.isDismissible ?? false) {
        loading._stopLoadingAnyState();
      }

      if (loading.loadingState == LoadingState.error &&
          (loading._currentCustomization.onBackErrorDialogDismiss ?? false)) {
        loading._stopLoadingAnyState();
      }

      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.child);
  }
}

class LoadingWidget extends StatelessWidget {
  final Widget? loadingWidget;
  final LoadingWidgetBuilder builder;

  LoadingWidget({super.key, this.loadingWidget, required this.builder});

  final loading = Loading.instance();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: loading._loadingState,
      builder: (BuildContext context, LoadingState state, Widget? child) {
        Widget loadingWidget0;

        if (loadingWidget == null) {
          loadingWidget0 =
              loading._currentCustomization.loadingWidget ?? Container();
        } else {
          loadingWidget0 = loadingWidget!;
        }

        return builder(
          loading._useWidget == false
              ? false
              : state == LoadingState.show
                  ? true
                  : false,
          loadingWidget0,
        );
      },
    );
  }
}
