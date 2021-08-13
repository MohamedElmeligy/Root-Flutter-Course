import 'package:flutter/material.dart';

import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AudioPlayer _player = AudioPlayer();

  double _currentSliderValue = 50;

  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    // Try to load audio from a source and catch any errors.
    try {
      await _player.setAudioSource(AudioSource.uri(Uri.parse(
          "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3")));
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final double sh = MediaQuery.of(context).size.height;
    final double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Now Playing",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: sh * 0.5,
            width: sw,
            color: Colors.amber,
            // child: Image.network(
            //     "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pixelstalk.net%2Fwp-content%2Fuploads%2F2016%2F07%2FMusic-Note-Image-Free-Download.jpg&f=1&nofb=1"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Song"),
                    Text("Authorrrrrrrrrrrr"),
                  ],
                ),
                Expanded(child: SizedBox()),
                IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Slider(
            value: _currentSliderValue,
            min: 0,
            max: 100,
            label: _currentSliderValue.toString(),
            onChanged: (double value) {
              _player.seek(Duration(milliseconds: value.round()));
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.repeat),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.repeat),
                onPressed: () {},
              ),
              TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
                onPressed: () {
                  print("playing");
                  _player.setVolume(1.0);
                  _player.play();
                  
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Icon(
                    Icons.star_outline,
                    color: Colors.black,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.repeat),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.repeat),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
