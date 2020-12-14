import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class StartPage extends StatefulWidget {
  final VoidCallback onTap;

  const StartPage({Key key, @required this.onTap}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage>
    with AutomaticKeepAliveClientMixin {
  CustomAnimationControl buttonController = CustomAnimationControl.PLAY;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 110),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 180),
                child: Column(
                  children: [
                    CustomAnimation(
                        control: buttonController,
                        delay: Duration(milliseconds: 1200),
                        curve: Curves.easeIn,
                        child: Text(
                          'BEM VINDOS A BORDO',
                          style:
                              textTheme.headline5.copyWith(color: Colors.white),
                        ),
                        tween: Tween(begin: 0.0, end: 1.0),
                        builder: (context, child, value) {
                          return Opacity(
                            opacity: value,
                            child: child,
                          );
                        }),
                    SizedBox(
                      height: 16,
                    ),
                    CustomAnimation(
                        control: buttonController,
                        delay: Duration(milliseconds: 1400),
                        curve: Curves.easeIn,
                        child: Text(
                          'Vamos decolar nessa aventura!',
                          style: textTheme.subtitle2.copyWith(
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                        tween: Tween(begin: 0.0, end: 1.0),
                        builder: (context, child, value) {
                          return Opacity(
                            opacity: value,
                            child: child,
                          );
                        }),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 46),
                    child: Container(
                      height: 48,
                      width: double.infinity,
                      child: CustomAnimation(
                          control: buttonController,
                          delay: Duration(milliseconds: 800),
                          curve: Curves.bounceIn,
                          child: RaisedButton(
                              child: Text('OLÁ, COMANDANTE',
                                  style: textTheme.button
                                      .copyWith(color: Colors.purpleAccent)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                              onPressed: widget.onTap),
                          tween: Tween(begin: 0.0, end: 1.0),
                          builder: (context, child, value) {
                            return Transform.scale(
                              scale: value,
                              child: child,
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomAnimation(
                      control: buttonController,
                      delay: Duration(milliseconds: 1600),
                      curve: Curves.easeIn,
                      child: Text('JÁ TENHO UMA CONTA',
                          style: textTheme.subtitle2
                              .copyWith(color: Colors.white)),
                      tween: Tween(begin: 0.0, end: 1.0),
                      builder: (context, child, value) {
                        return Opacity(
                          opacity: value,
                          child: child,
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
