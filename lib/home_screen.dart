import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotateanimation;
  late Animation<double> _radiusanimation;
  late Animation<double> _textanimation;
  bool flag = true;
  String text = "Breathe in";

  void playAudio() async {
    final player = AudioPlayer();
    await player.setAsset('assets/music/music.mp3', preload: true);
    player.play();
  }

  @override
  void initState() {
    // playAudio();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4))
          ..forward();

    _rotateanimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _radiusanimation = Tween(begin: 450.0, end: 10.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _textanimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // setState(() {
        //   if (text == "Breathe in")
        //     text = "Breathe out";
        //   else
        //     text = "Breathe in";
        // });
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
        setState(() {
          if (text == "Breathe in")
            text = "Breathe out";
          else
            text = "Breathe in";
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    // player.dispose(); // Release the resources
    super.dispose();
  }

  void modifyAnimation() {
    setState(() {
      if (flag)
        flag = false;
      else
        flag = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color pinkShadowColor = Color.fromARGB(255, 121, 7, 67).withOpacity(0.8);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: flag ? Colors.deepPurple[500] : Colors.pink.shade500,
        title: Text("Meditate",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          enableFeedback: true,
          splashColor: flag ? Colors.pink.shade500 : Colors.deepPurple[500],
          onPressed: modifyAnimation,
          backgroundColor: flag ? Colors.deepPurple[500] : Colors.pink.shade500,
          child: Center(
            child: Text("Tap",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, color: Colors.white)),
          )),
      backgroundColor: flag ? Colors.deepPurple[300] : Colors.pink.shade300,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: _rotateanimation.value,
                  child: Container(
                    width: 225,
                    height: 225,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: flag
                                  ? const Color(0xFF692d94).withOpacity(0.8)
                                  : pinkShadowColor,
                              offset: const Offset(-6, -6)),
                          BoxShadow(
                              color: const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(0.2),
                              offset: const Offset(6, 6))
                        ],
                        color: flag
                            ? Colors.deepPurple[800]
                            : Colors.pink.shade800,
                        borderRadius:
                            BorderRadius.circular(_radiusanimation.value)),
                  ),
                ),
                Transform.rotate(
                  angle: _rotateanimation.value + 0.1,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: flag
                                  ? const Color(0xFF692d94).withOpacity(0.8)
                                  : pinkShadowColor,
                              offset: const Offset(-6, -6)),
                          BoxShadow(
                              color: const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(0.2),
                              offset: const Offset(6, 6))
                        ],
                        color: flag
                            ? Colors.deepPurple[700]
                            : Colors.pink.shade700,
                        borderRadius:
                            BorderRadius.circular(_radiusanimation.value)),
                  ),
                ),
                Transform.rotate(
                  angle: _rotateanimation.value + 0.2,
                  child: Container(
                    width: 175,
                    height: 175,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: flag
                                  ? const Color(0xFF692d94).withOpacity(0.8)
                                  : pinkShadowColor,
                              offset: const Offset(-6, -6)),
                          BoxShadow(
                              color:
                                  Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                              offset: const Offset(6, 6))
                        ],
                        color: flag ? Colors.deepPurple[600] : Colors.pink[600],
                        borderRadius:
                            BorderRadius.circular(_radiusanimation.value)),
                  ),
                ),
                Transform.rotate(
                  angle: _rotateanimation.value + 0.3,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: flag
                                  ? const Color(0xFF692d94).withOpacity(0.8)
                                  : pinkShadowColor,
                              offset: const Offset(-6, -6)),
                          BoxShadow(
                              color: const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(0.2),
                              offset: const Offset(6, 6))
                        ],
                        color: flag ? Colors.deepPurple[500] : Colors.pink[500],
                        borderRadius:
                            BorderRadius.circular(_radiusanimation.value)),
                  ),
                ),
                Transform.rotate(
                  angle: _rotateanimation.value + 0.4,
                  child: Container(
                    width: 125,
                    height: 125,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: flag
                                  ? const Color(0xFF692d94).withOpacity(0.8)
                                  : pinkShadowColor,
                              offset: const Offset(-6, -6)),
                          BoxShadow(
                              color: const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(0.2),
                              offset: const Offset(6, 6))
                        ],
                        color: flag ? Colors.deepPurple[400] : Colors.pink[400],
                        borderRadius:
                            BorderRadius.circular(_radiusanimation.value)),
                  ),
                ),
                Transform.rotate(
                  angle: _rotateanimation.value + 0.5,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: flag
                                  ? const Color(0xFF692d94).withOpacity(0.8)
                                  : pinkShadowColor,
                              offset: const Offset(-6, -6)),
                          BoxShadow(
                              color: const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(0.1),
                              offset: const Offset(6, 6))
                        ],
                        color: flag ? Colors.deepPurple[300] : Colors.pink[300],
                        borderRadius:
                            BorderRadius.circular(_radiusanimation.value)),
                  ),
                ),
                GestureDetector(
                  onTap: modifyAnimation,
                  child: Transform.rotate(
                    angle: _rotateanimation.value + 0.6,
                    child: Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: flag
                                    ? const Color(0xFF692d94).withOpacity(0.8)
                                    : pinkShadowColor,
                                offset: const Offset(-6, -6)),
                            BoxShadow(
                                color: const Color.fromARGB(255, 0, 0, 0)
                                    .withOpacity(0.1),
                                offset: const Offset(6, 6))
                          ],
                          color:
                              flag ? Colors.deepPurple[100] : Colors.pink[100],
                          borderRadius:
                              BorderRadius.circular(_radiusanimation.value)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Center(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: flag
                    ? Colors.purple.shade900.withOpacity(_textanimation.value)
                    : Colors.pink.shade900.withOpacity(_textanimation.value),
              ),
            ),
          )
        ],
      ),
    );
  }
}
