/*
 * @Description: 
 * @Author: zhangyf
 * @Date: 2020-11-20 15:39:58
 * @LastEditTime: 2020-12-07 14:57:33
 * @LastEditors: zhangyf
 */
import 'package:audioplayers/audioplayers.dart';
import 'package:zmusic_flutter/manager/local_storage.dart';
import 'package:zmusic_flutter/manager/notification/event_bus.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/network/api.dart';
import 'package:zmusic_flutter/views/common/page_util.dart';

class PlayerManager {
  PlayerManager() {
    ///全局单例音频播放器初始化
    player = AudioPlayer();
    player.setReleaseMode(ReleaseMode.STOP);

    ///初始化播放列表
    // setCurrentPlayList();
    bus.on(BusEvent.PlayAudioWithSong, (arg) async {
      SongData resource = arg;
      sonngData = resource;
      String receiveSongId = resource.id.toString();
      songName = resource.name;
      coverUrl = resource.album.picUrl;
      author = resource.artists[0].name;
      Map checkResult = await API.song.checkMusicRequest(receiveSongId);
      CheckMusicResponse checkResponse =
          CheckMusicResponse.fromJson(checkResult);
      if (!checkResponse.success) {
        PageUtil.showToast(checkResponse.message);
        return;
      }

      Map songAudioInfo = await API.song.getSongUrlRequest(receiveSongId);
      SongAudioResponse songAudioResponse =
          SongAudioResponse.fromJson(songAudioInfo);
      if (player.state == AudioPlayerState.PLAYING) {
        if (receiveSongId != songId) {
          player.stop();
          player.play(songAudioResponse.data[0].url);
        }
      } else {
        player.play(songAudioResponse.data[0].url);
      }
      songId = receiveSongId;
      player.onDurationChanged.listen((Duration totalTime) {
        totalDuration = totalTime;
      });
    });
    player.onPlayerCompletion.listen((event) async {
      SongData song = sonngData;
      int currentIndex = 0;
      StorageManager manager = await StorageManager.getInstance();
      List<SongData> localList = manager.localPlayList;
      for (SongData item in localList) {
        if (item.id == song.id) {
          currentIndex = localList.indexOf(item);
        }
      }
      int nextIndex;
      if (localList.length == 1) {
        nextIndex = 0;
      } else {
        if (currentIndex == localList.length - 1) {
          nextIndex = 0;
        } else {
          nextIndex = currentIndex + 1;
        }
      }
      PlayListOption option = manager.playListOption;
      if (option == PlayListOption.SingleCycle) {
        bus.emit(BusEvent.PlayAudioWithSong, song);
      } else {
        bus.emit(BusEvent.PlayAudioWithSong, localList[nextIndex]);
        bus.emit(BusEvent.AutoPlayNext, localList[nextIndex]);
      }
    });
  }

  AudioPlayer player;

  String songId;
  String songName;
  String coverUrl;
  String author;
  SongData sonngData;
  Duration totalDuration;
  bool canPlay = false;

  List<SongData> _currentPlayList = [];

  Future<PlayListOption> get playListOption async {
    StorageManager manager = await StorageManager.getInstance();
    return manager.playListOption;
  }

  ///实时播放列表
  Future setCurrentPlayList() async {
    StorageManager manager = await StorageManager.getInstance();
    switch (manager.playListOption) {
      case PlayListOption.OrderCycle:
        _currentPlayList = manager.localPlayList;
        break;
      case PlayListOption.RandomCycle:
        _currentPlayList = manager.localPlayList;
        _currentPlayList.shuffle();
        break;
      case PlayListOption.SingleCycle:
        _currentPlayList = manager.localPlayList;
        break;
      default:
        break;
    }
    return;
  }

  List<SongData> get getCurrentPlayList {
    return _currentPlayList;
  }
}

enum PlayListOption {
  SingleCycle,
  OrderCycle,
  RandomCycle,
}
