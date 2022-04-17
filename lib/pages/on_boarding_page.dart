import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../pages/home_page.dart';

class OnBoardingPage extends StatefulWidget {

  const OnBoardingPage({Key? key,}) : super(key: key);
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();


  void _onIntroEnd(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: SvgPicture.asset('assets/images/$assetName.svg', width: 250.0),
      alignment: Alignment.bottomCenter,
    );
  }


  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "More than just shorter links",
          body:"Build your brand's recognition and get detailed insights on how your links are performing",
          image: _buildImage('illustration'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Brand Recognition",
          body: "Boost your brand recognition with each click. Generic links don't mean a thing. Branded links help instill confidence in your content\n\nThis app made by Emin Yazan for Grisoft",
          image: _buildImage('logo'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      showSkipButton: true,
      nextFlex: 0,
      skip:  const Text("Skip"),
      next:  const Icon(Icons.arrow_forward),
      done:  const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}