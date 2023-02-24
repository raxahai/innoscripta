import 'package:flutter/material.dart';

class LoaderWidget extends StatefulWidget {
  const LoaderWidget({Key? key, required this.isLoading, required this.child})
      : super(key: key);

  final bool isLoading;
  final Widget child;

  @override
  State<LoaderWidget> createState() => _LoaderWidgetState();
}

class _LoaderWidgetState extends State<LoaderWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));

    offset = Tween<Offset>(
            begin: const Offset(0.0, -2.0), end: const Offset(0.0, 4.5))
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    handleController();
    return AbsorbPointer(
      absorbing: widget.isLoading,
      child: Stack(
        children: <Widget>[
          Container(child: widget.child),
          Align(
            alignment: const Alignment(0.0, -1.2),
            child: SlideTransition(
              position: offset,
              child: const RefreshProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xff2C6DFA),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void handleController() {
    if (widget.isLoading) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }
}
