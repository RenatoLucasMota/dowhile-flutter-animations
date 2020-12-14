import 'package:flutter/material.dart';

class PasswordPage extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback onBack;
  const PasswordPage({Key key, @required this.onTap, @required this.onBack}) : super(key: key);
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
                            'Escolha uma senha fácil de lembrar!',
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
                      obscureText: true,
                      maxLength: 8,
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: Colors.white,
                      style: textTheme.headline6.copyWith(color: Colors.white),
                      decoration: InputDecoration(
                        counterStyle: textTheme.caption
                            .copyWith(color: Colors.white.withOpacity(0.6)),
                        hintText: 'Como será minha senha',
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 46),
              child: Container(
                  height: 48,
                  width: double.infinity,
                  child: RaisedButton(
                      child: Text('DECOLAR',
                          style: textTheme.button
                              .copyWith(color: Colors.deepPurple)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      onPressed: onTap)),
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: onBack,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('VOLTAR',
                    style: textTheme.subtitle2.copyWith(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
