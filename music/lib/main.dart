import 'package:flutter/material.dart';

import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';

import 'package:music/song.dart';

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

  double _currentSliderValue = 0;
  bool _isPlaying = false;
  int _currentSong = 0;
  double _maxDuration = 0;

  List<Song> _songs = [
    Song(
        song: 'assets/audio/hater.mp3',
        name: "Hater",
        author: "Hamza Namira",
        image:"https://i1.sndcdn.com/artworks-000388256652-ehoebv-t500x500.jpg",
    ),
    Song(
      song: 'assets/audio/ghaba.mp3',
      name: "Ghaba",
      author: "Marwan Pablo",
      image: "https://i1.sndcdn.com/artworks-000388256652-ehoebv-t500x500.jpg",
    ),
    Song(
        song: 'assets/audio/ya2ot.mp3',
        name: "A8la mn el ya2ot",
        author: "Ahmed Mekky",
        image:
            "data:image/jpeg;base64,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"),
  ];

  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.music());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    // Try to load audio from a source and catch any errors.
    try {
      await _player.setAsset('assets/audio/hater.mp3');
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  void play() {
    _isPlaying = true;
    _player.play();
    _maxDuration = _player.duration!.inSeconds.toDouble();
    setState(() {});
  }

  void pause() {
    _isPlaying = false;
    _player.pause();
    setState(() {});
  }

  void next() async {
    _currentSong == _songs.length - 1 ? _currentSong = 0 : _currentSong++;
    await _player.setAsset(_songs[_currentSong].song);
    play();
  }

  void prev() async {
    _currentSong == 0 ? _currentSong = _songs.length - 1 : _currentSong--;
    await _player.setAsset(_songs[_currentSong].song);
    play();
  }

  void forward() {
    _player.seek(Duration(seconds: _player.position.inSeconds + 10));
  }

  void back() {
    _player.seek(Duration(seconds: _player.position.inSeconds - 10));
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
            child: Image.network(_songs[_currentSong].image,fit: BoxFit.cover,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_songs[_currentSong].name),
                    Text(_songs[_currentSong].author),
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
            max: _maxDuration,
            label: _currentSliderValue.toString(),
            onChanged: (double value) {
              _player.seek(Duration(seconds: value.round()));
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.double_arrow),
                onPressed: () => back(),
              ),
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => prev(),
              ),
              TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
                onPressed: () => _isPlaying ? pause() : play(),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.black,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () => next(),
              ),
              IconButton(
                icon: Icon(Icons.double_arrow),
                onPressed: () => forward(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
