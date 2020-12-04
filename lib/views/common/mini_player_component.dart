/*
 * @Description: 
 * @Author: zhangyf
 * @Date: 2020-11-19 14:30:03
 * @LastEditTime: 2020-12-02 17:07:01
 * @LastEditors: zhangyf
 */
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/manager/local_storage.dart';
import 'package:zmusic_flutter/manager/notification/event_bus.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/router/router.dart';
import 'package:zmusic_flutter/views/global_music_player_page/player_manager.dart';
import 'package:zmusic_flutter/views/common/page_util.dart';

class MiniPlayerPlayAnimationGenerator {
  MiniPlayerPlayAnimationGenerator(
      {this.imageKey, this.imageUrl, this.tickerProvider});
  final GlobalKey imageKey;
  final String imageUrl;
  final TickerProvider tickerProvider;

  AnimationController _controller;
  AnimationController get controller {
    if (_controller == null) {
      _controller = AnimationController(
          duration: Duration(milliseconds: 800), vsync: tickerProvider);
    }
    return _controller;
  }

  void showAnimation(BuildContext context) {
    OverlayEntry _loadingEntry = new OverlayEntry(builder: (context) {
      RenderBox renderBox = imageKey.currentContext.findRenderObject();
      Offset offset = renderBox.localToGlobal(Offset.zero);
      Animation<double> left = Tween<double>(
              begin: offset.dx,
              end: ApplicationManager.sharedInstance().deviceInfo.screenWidth -
                  44 -
                  7)
          .animate(
              CurvedAnimation(parent: controller, curve: Curves.easeInOut));

      Animation<double> top = Tween<double>(
              begin: offset.dy,
              end: ApplicationManager.sharedInstance()
                      .deviceInfo
                      .statusBarHeight +
                  7)
          .animate(CurvedAnimation(parent: controller, curve: Curves.ease));

      Animation<double> size = Tween<double>(begin: 60, end: 26).animate(
          CurvedAnimation(
              parent: controller,
              curve: Interval(0.0, 0.6, curve: Curves.ease)));

      Animation<double> opacity = Tween<double>(begin: 1.0, end: 0.5).animate(
          CurvedAnimation(parent: controller, curve: Curves.bounceInOut));
      return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Positioned(
              top: top.value,
              left: left.value,
              child: Opacity(
                opacity: opacity.value,
                child: ClipOval(
                  child: Container(
                    width: size.value,
                    height: size.value,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                    ),
                  ),
                ),
              ));
        },
      );
    });
    OverlayState overlayState = Overlay.of(context);

    overlayState.insert(_loadingEntry);

    controller.forward();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        bus.emit(BusEvent.PlayMusicSendCoverUrl, imageUrl);
        _loadingEntry.remove();
        controller.dispose();
      }
    });
  }
}

class MiniPlayerOverlayConfiger {
  static bool _isShow = false;
  static void showPlayer(BuildContext context) {
    OverlayState overlayState = Overlay.of(context);
    if (!_isShow) {
      _isShow = true;
      overlayState.insert(ApplicationManager.sharedInstance().miniPlayerEntry);
    }
  }

  static void dismissPlayer() {
    if (_isShow) {
      _isShow = false;
      ApplicationManager.sharedInstance().miniPlayerEntry.remove();
    }
  }
}

class MiniTopBarPlayerComponent extends StatefulWidget {
  MiniTopBarPlayerComponent({
    Key key,
  }) : super(key: key);
  @override
  _MiniPlayerComponentState createState() => _MiniPlayerComponentState();
}

class _MiniPlayerComponentState extends State<MiniTopBarPlayerComponent>
    with SingleTickerProviderStateMixin {
  bool _offstage = false;
  AnimationController _controller;
  String playingSongId;
  String playingSongImageUrl;
  double progressValue = 0;
  PlayerManager get playerManager =>
      ApplicationManager.sharedInstance().playerManager;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 7), vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });
    bus.on(BusEvent.PlayMusicSendCoverUrl, (arg) {
      this.setState(() {
        playingSongImageUrl = arg;
      });
    });
    bus.on(BusEvent.ShowMiniPlayer, (arg) {
      this.setState(() {
        _offstage = false;
      });
    });
    bus.on(BusEvent.DismissMiniPlayer, (arg) {
      _offstage = true;
    });
    bus.on(BusEvent.ResetMiniPlayer, (arg) {
      this.setState(() {
        playingSongImageUrl = null;
        playingSongId = null;
      });
    });

    playerManager.player.onAudioPositionChanged.listen((Duration duration) {
      this.setState(() {
        progressValue = duration.inMilliseconds /
            playerManager.totalDuration.inMilliseconds;
      });
    });
    bus.on(BusEvent.PlayAudioWithSong, (arg) {
      SongData song = arg;
      this.setState(() {
        playingSongImageUrl = song.album.picUrl;
        playingSongId = song.id.toString();
      });
    });
    setOriginData();
  }

  void setOriginData() async {
    StorageManager manager = await StorageManager.getInstance();
    List<SongData> localPlayList = manager.localPlayList;
    if (localPlayList != null) {
      this.setState(() {
        playingSongImageUrl = localPlayList[0].album.picUrl;
        playingSongId = localPlayList[0].id.toString();
      });
    }
    PlayerManager playerManager =
        ApplicationManager.sharedInstance().playerManager;
    if (playerManager.player.state == AudioPlayerState.PLAYING) {
      _controller.forward();
    }
    playerManager.player.onPlayerStateChanged.listen((event) {
      if (event == AudioPlayerState.PLAYING) {
        _controller.forward();
      } else {
        _controller.stop();
      }
    });
    SongData current = localPlayList[0];
    playerManager.author = current.artists[0].name;
    playerManager.coverUrl = current.album.picUrl;
    playerManager.songId = current.id.toString();
    playerManager.songName = current.name;
    playerManager.sonngData = current;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (playingSongImageUrl == null) {
          PageUtil.showToast("暂无正在播放的音乐");
          return;
        }
        ApplicationManager.sharedInstance().router.navigateTo(
            context, XCAppRouter.globalMusicPlayer,
            transition: TransitionType.custom,
            transitionBuilder: (context, animation, secondaryAnimation, child) {
          final Animatable curve = CurveTween(curve: Curves.easeInOut);
          animation.drive(curve);

          return ScaleTransition(
            alignment: Alignment.topRight,
            scale: animation,
            child: child,
          );
        }, transitionDuration: Duration(seconds: 1));
      },
      child: Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          child: Offstage(
            offstage: _offstage,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    value: progressValue,
                    strokeWidth: 2,
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
                RotationTransition(
                  turns: _controller,
                  child: SizedBox(
                    width: 26,
                    height: 26,
                    child: ClipOval(
                      child: playingSongImageUrl == null
                          ? Image(
                              image: AssetImage(
                                  "images/player/mini_player_bg.png"))
                          : CachedNetworkImage(
                              width: 26,
                              height: 26,
                              fit: BoxFit.fill,
                              imageUrl: playingSongImageUrl,
                              placeholder: (context, url) => Image(
                                  image: AssetImage(
                                      "images/player/mini_player_bg.png")),
                              errorWidget: (context, url, error) => Image(
                                  image: AssetImage(
                                      "images/player/mini_player_bg.png")),
                            ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
