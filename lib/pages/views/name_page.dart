import 'package:flutter/material.dart';

class NamePage extends StatelessWidget {
  final VoidCallback onTap;
  const NamePage({Key key, @required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 160),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Legal te conhecer como gostaria de ser chamado?',
                            style: textTheme.headline6
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    TextField(
                      maxLength: 64,
                      cursorColor: Colors.white,
                      style: textTheme.subtitle1.copyWith(color: Colors.white),
                      decoration: InputDecoration(
                        counterStyle: textTheme.caption
                            .copyWith(color: Colors.white.withOpacity(0.6)),
                        hintText: 'Como me chamam...',
                        hintStyle: textTheme.subtitle1
                            .copyWith(color: Colors.white.withOpacity(0.6)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('CONTINUAR',
                      style: textTheme.subtitle2.copyWith(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
