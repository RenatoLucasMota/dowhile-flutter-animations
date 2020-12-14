import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:workshop_rocketseat/components/dots_component.dart';
import 'package:lottie/lottie.dart';
//import 'package:simple_animations/simple_animations.dart';
import 'package:workshop_rocketseat/pages/views/name_page.dart';
import 'package:workshop_rocketseat/pages/views/password_page.dart';
import 'package:workshop_rocketseat/pages/views/start_page.dart';
import '../views/email_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  
  @override
  bool get wantKeepAlive => true;

PageController pageController;
  int _pageIndex = 0;
  CustomAnimationControl controllerLogo = CustomAnimationControl.PLAY;

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    super.initState();
  }

  _toNextPage() {
    //pageController.jumpToPage(_pageIndex + 1);
    pageController.animateToPage(
      _pageIndex + 1,
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInExpo,
    );
  }

  _toPreviousPage() {
    //pageController.jumpToPage(_pageIndex - 1);
    pageController.animateToPage(
      _pageIndex - 1,
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInExpo,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex > 0) {
          _toPreviousPage();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.purpleAccent,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.deepOrangeAccent, Colors.deepPurple]),
              ),
            ),
            PageView(
              allowImplicitScrolling: false,
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: (index) {
                _pageIndex = index;
                setState(() {});
              },
              scrollDirection: Axis.vertical,
              children: [
                StartPage(
                  onTap: () {
                    _toNextPage();
                  },
                ),
                NamePage(onTap: () => _toNextPage()),
                EmailPage(onTap: () => _toNextPage()),
                PasswordPage(
                  onTap: () {},
                  onBack: () => _toPreviousPage(),
                ),
              ],
            ),
            AnimatedPositioned(
              curve: Curves.easeInExpo,
              duration: Duration(milliseconds: 200),
              top: 60,
              right: _pageIndex == 0 ? -32 : 32,
              child: DotsComponent(
                pageIndex: _pageIndex,
              ),
            ),
            AnimatedPositioned(
                curve: Curves.easeInExpo,
                duration: Duration(milliseconds: 200),
                bottom: 32,
                right: _pageIndex == 0 ? -32 : 32,
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        Feather.arrow_up,
                        color: Colors.white.withOpacity(0.6),
                      ),
                      onPressed: () {
                        _toPreviousPage();
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Feather.arrow_down,
                        color: Colors.white.withOpacity(0.6),
                      ),
                      onPressed: () {
                        _toNextPage();
                      },
                    ),
                  ],
                )),
            AnimatedPositioned(
              top: _pageIndex == 0 ? 80 : 32,
              width: _pageIndex == 0 ? 200 : 80,
              left: _pageIndex == 0
                  ? MediaQuery.of(context).size.width / 2 - (200 / 2)
                  : 24,
              curve: Curves.easeIn,
              duration: Duration(milliseconds: 450),
              child: CustomAnimation(
                curve: Curves.elasticIn,
                control: controllerLogo,
                delay: Duration(milliseconds: 100),
                builder: (context, child, value) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                },
                tween: Tween(begin: 0.0, end: 1.0),
                child: Lottie.asset('assets/animations/rocket.json',
                    width: 200, height: 200),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
