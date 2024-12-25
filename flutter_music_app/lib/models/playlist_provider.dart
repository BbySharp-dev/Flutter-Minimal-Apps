import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_app/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  // playlist of songs
  final List<Song> _playlist = [
    // song 1
    Song(
      songName: "So Sick",
      artistName: "Neyo",
      albumArtImagePath: "assets/images/album_artwork_1.png",
      audioPath: "audio/chill.mp3",
    ),

    // song 2
    Song(
      songName: "Acid Rap",
      artistName: "Chance the Rapper",
      albumArtImagePath: "assets/images/album_artwork_1.png",
      audioPath: "audio/chill.mp3",
    ),

    // song 3
    Song(
      songName: "Phoenix",
      artistName: "ASAP Rocky",
      albumArtImagePath: "assets/images/album_artwork_1.png",
      audioPath: "audio/chill.mp3",
    ),
  ];

  // current song playing index
  int? _currentSongIndex;

/*
A U D I O P L A Y E R
*/
// audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

// durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

// constructor
  PlaylistProvider() {
    listenToDuration();
  }

// initially not playing
  bool _isPlaying = false;

// play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop(); // stop current song
    await _audioPlayer.play(AssetSource(path)); // play the new song
    _isPlaying = true;
    notifyListeners();
  }

// pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false; // Update to false as the song is paused
    notifyListeners(); // Notify listeners of the change
  }

// resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true; // Update to true as the song is playing again
    notifyListeners(); // Notify listeners of the change
  }

// pause or resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
  }

// seek to a specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

// play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        // go to the next song if it's not the last song
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        // if it's the last song, loop back to the first song
        currentSongIndex = 0;
      }
    }
  }

// play previous song
  void playPreviousSong() async {
    // if more than 2 seconds have passed, restart the current song
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      // if it's within first 2 seconds of the song, go to previous song
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        // if it's the first song, loop back to the last song
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

// listen to duration
  void listenToDuration() {
    // listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    // listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    // listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

// dispose audio player

/*
GETTERS
*/

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

/*
SETTERS
*/

  set currentSongIndex(int? newIndex) {
    // update current song index
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      play(); // play the song at the new index
    }

    // update UI
    notifyListeners();
  }
}
