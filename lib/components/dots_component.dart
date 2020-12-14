import 'package:flutter/material.dart';

class DotsComponent extends StatelessWidget {
  final int pageIndex;

  const DotsComponent({Key key, this.pageIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Dot(
          active: pageIndex == 1,
        ),
        Dot(
          active: pageIndex == 2,
        ),
        Dot(
          active: pageIndex == 3,
        ),
      ],
    );
  }
}

class Dot extends StatelessWidget {
  final bool active;

  const Dot({Key key, this.active}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: AnimatedContainer(
        duration: Duration(
          milliseconds: 450,
        ),
        decoration: BoxDecoration(
            color: active ? Colors.white : Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(24)),
        height: active ? 18 : 12,
        width: 4,
      ),
    );
  }
}
