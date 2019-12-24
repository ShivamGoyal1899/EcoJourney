import 'package:EcoJourney/screens/RegistrationScreens/loginVerificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroSliderScreen extends StatefulWidget {
  @override
  _IntroSliderScreenState createState() => _IntroSliderScreenState();
}

class _IntroSliderScreenState extends State<IntroSliderScreen> {
  List<Slide> slides = new List();

  Function goToTab;

  @override
  void initState() {
    super.initState();
    slides.add(
      new Slide(
        title: "Save Time",
        styleTitle: TextStyle(
            color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
        description: "Get to your destination within 30 min or less.",
        styleDescription: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500),
        pathImage: "assets/images/ic_logo.png",
        heightImage: 100.0,
      ),
    );
    slides.add(
      new Slide(
        title: "Earn GreenPoints",
        styleTitle: TextStyle(
            color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
        description: "Wanna Save money? It's the right place here.",
        styleDescription: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500),
        pathImage: "assets/images/ic_logo.png",
      ),
    );
    slides.add(
      new Slide(
        title: "Reduce Pollution",
        styleTitle: TextStyle(
            color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
        description:
            "Solve pollution problems regularly & win exciting cash prizes.",
        styleDescription: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500),
        pathImage: "assets/images/ic_logo.png",
      ),
    );
  }

  void onDonePress() {
    // Back to the first tab
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => LoginVerificationScreen()),
    );
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Text("NEXT");
  }

  Widget renderDoneBtn() {
    return Text("DIVE IN");
  }

  Widget renderSkipBtn() {
    return Text("SKIP");
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 0.0, top: 0.0),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 150.0,
              ),
              GestureDetector(
                  child: Image.asset(
                currentSlide.pathImage,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              )),
              SizedBox(height: 100.0),
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroSlider(
        // List slides
        slides: this.slides,

        // Skip button
        renderSkipBtn: this.renderSkipBtn(),
        colorSkipBtn: Colors.white,
        highlightColorSkipBtn: Colors.white30,
        isShowSkipBtn: true,

        // Next button
        renderNextBtn: this.renderNextBtn(),

        // Done button
        renderDoneBtn: this.renderDoneBtn(),
        onDonePress: this.onDonePress,
        colorDoneBtn: Colors.white,
        highlightColorDoneBtn: Colors.white30,
        borderRadiusDoneBtn: 30.0,
        isShowDoneBtn: true,

        // Dot indicator
        colorDot: Colors.white,
        sizeDot: 5.0,
        typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
        isShowDotIndicator: true,

        // Tabs
        listCustomTabs: this.renderListCustomTabs(),
        backgroundColorAllSlides: Colors.black,
        refFuncGoToTab: (refFunc) {
          this.goToTab = refFunc;
        },

        // Show or hide status bar
        shouldHideStatusBar: false,

        // On tab change completed
        onTabChangeCompleted: this.onTabChangeCompleted,
      ),
    );
  }
}
