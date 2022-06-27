import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size size;
  bool _isExpanded = false;
  double _redSliderValue = 100;
  double _greenSliderValue = 100;
  double _blueSliderValue = 100;
  double _alphaSliderValue = 100;

  late Color color;

  @override
  void didChangeDependencies() {
    setColor();

    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: Text('Photo Filtering App'),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'images/p1.jpeg',
                fit: BoxFit.cover,
                color: color,
                colorBlendMode: BlendMode.color,
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(microseconds: 300),
              bottom: _isExpanded ? 0 : -(size.height / 2) + 100,
              child: Container(
                width: size.width,
                height: size.height / 2,
                color: Colors.black.withOpacity(0.7),
                child: ListView(
                  padding: const EdgeInsets.all(0),
                  children: [
                    ListTile(
                      title: const Text(
                        'Filter Setings',
                        style: txtWhite18,
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        icon: Icon(
                          !_isExpanded
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      'Red',
                      style: txtWhite18,
                      textAlign: TextAlign.center,
                    ),
                    Slider(
                      min: 0,
                      max: 255,
                      divisions: 255,
                      value: _redSliderValue,
                      label: _redSliderValue.round().toString(),
                      onChanged: (value) {
                        setState(() {
                          _redSliderValue = value;
                          setColor();
                        });
                      },
                    ),

                    Text(
                      'Green',
                      style: txtWhite18,
                      textAlign: TextAlign.center,
                    ),
                    Slider(
                      min: 0,
                      max: 255,
                      divisions: 255,
                      value: _greenSliderValue,
                      label: _greenSliderValue.round().toString(),
                      onChanged: (value) {
                        setState(() {
                          _greenSliderValue = value;
                          setColor();
                        });
                      },
                    ),

                    Text(
                      'Blue',
                      style: txtWhite18,
                      textAlign: TextAlign.center,
                    ),
                    Slider(
                      min: 0,
                      max: 255,
                      divisions: 255,
                      value: _blueSliderValue,
                      label: _blueSliderValue.round().toString(),
                      onChanged: (value) {
                        setState(() {
                          _blueSliderValue = value;
                          setColor();
                        });
                      },
                    ),

                    Text(
                      'Alpha',
                      style: txtWhite18,
                      textAlign: TextAlign.center,
                    ),
                    Slider(
                      min: 0,
                      max: 255,
                      divisions: 255,
                      value: _alphaSliderValue,
                      label: _alphaSliderValue.round().toString(),
                      onChanged: (value) {
                        setState(() {
                          _alphaSliderValue = value;
                          setColor();
                        });
                      },
                    ),




                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  setColor(){
    color =Color.fromARGB(_alphaSliderValue.round(), _redSliderValue.round(), _greenSliderValue.round(), _blueSliderValue.round());

  }
}

const txtWhite18 = TextStyle(fontSize: 22, color: Colors.white);




