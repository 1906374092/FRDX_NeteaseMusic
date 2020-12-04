import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/material.dart' hide Action;
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/manager/local_storage.dart';
import 'package:zmusic_flutter/manager/notification/event_bus.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/utils/colors.dart';
import 'package:zmusic_flutter/utils/iconfont.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_controlpad_component/action.dart';
import 'package:zmusic_flutter/views/global_music_player_page/player_manager.dart';
import 'package:zmusic_flutter/views/common/page_util.dart';
import 'action.dart';
import 'state.dart';

Effect<GlobalPlayerLocalplaylistState> buildEffect() {
  return combineEffects(<Object, Effect<GlobalPlayerLocalplaylistState>>{
    Lifecycle.initState: _onInit,
    GlobalPlayerLocalplaylistAction.changePlayOption: _onChangePlayOption,
    GlobalPlayerLocalplaylistAction.close: _onClose,
    GlobalPlayerLocalplaylistAction.deleteItem: _onDeleteItem,
    GlobalPlayerLocalplaylistAction.deleteAll: _onDeleteAll,
    GlobalPlayerLocalplaylistAction.tapItem: _onTapItem,
  });
}

void _onInit(Action action, Context<GlobalPlayerLocalplaylistState> ctx) {
  _setPlayOption(ctx);
  _readLocalPlayList(ctx);
}

void _setPlayOption(Context<GlobalPlayerLocalplaylistState> ctx) async {
  PlayListOption option =
      await ApplicationManager.sharedInstance().playerManager.playListOption;

  ctx.dispatch(GlobalPlayerLocalplaylistActionCreator.onSetPlayOption(option));
}

void _readLocalPlayList(Context<GlobalPlayerLocalplaylistState> ctx) async {
  StorageManager manager = await StorageManager.getInstance();
  ctx.dispatch(GlobalPlayerLocalplaylistActionCreator.onSetLocalPlayList(
      manager.localPlayList));
}

void _onChangePlayOption(
    Action action, Context<GlobalPlayerLocalplaylistState> ctx) async {
  StorageManager manager = await StorageManager.getInstance();
  switch (manager.playListOption) {
    case PlayListOption.OrderCycle:
      PageUtil.showToast("随机播放");
      manager.playListOption = PlayListOption.RandomCycle;
      ctx.dispatch(GlobalPlayerLocalplaylistActionCreator.onSetPlayOption(
          PlayListOption.RandomCycle));
      ctx.dispatch(GlobalPlayerControlpadActionCreator.onSetPlayListOptionIcon(
          XCIcons.random_play));
      break;
    case PlayListOption.RandomCycle:
      PageUtil.showToast("单曲循环");
      manager.playListOption = PlayListOption.SingleCycle;
      ctx.dispatch(GlobalPlayerLocalplaylistActionCreator.onSetPlayOption(
          PlayListOption.SingleCycle));
      ctx.dispatch(GlobalPlayerControlpadActionCreator.onSetPlayListOptionIcon(
          XCIcons.single_cycle));
      break;
    case PlayListOption.SingleCycle:
      PageUtil.showToast("列表循环");
      manager.playListOption = PlayListOption.OrderCycle;
      ctx.dispatch(GlobalPlayerLocalplaylistActionCreator.onSetPlayOption(
          PlayListOption.OrderCycle));
      ctx.dispatch(GlobalPlayerControlpadActionCreator.onSetPlayListOptionIcon(
          XCIcons.sequential_play));
      break;
    default:
  }
}

void _onClose(Action action, Context<GlobalPlayerLocalplaylistState> ctx) {
  Navigator.of(ctx.context).pop();
}

void _onDeleteItem(
    Action action, Context<GlobalPlayerLocalplaylistState> ctx) async {
  if (ctx.state.localPlayList.length == 1) {
    _onDeleteAll(action, ctx);
    return;
  }
  SongData song = action.payload;
  ctx.state.localPlayList.remove(song);
  ctx.dispatch(GlobalPlayerLocalplaylistActionCreator.onSetLocalPlayList(
      ctx.state.localPlayList));
  StorageManager manager = await StorageManager.getInstance();
  manager.removeFromLocalPlayList(song.id);
}

void _onDeleteAll(Action action, Context<GlobalPlayerLocalplaylistState> ctx) {
  showCupertinoDialog(
    context: ctx.context,
    builder: (context) {
      return CupertinoAlertDialog(
        content: Text(
          "确定要清空播放列表？",
          style: TextStyle(color: ColorDefine.Main_Subtitle_Text, fontSize: 15),
        ),
        actions: [
          CupertinoDialogAction(
            child: Text("取消"),
            onPressed: () {
              Navigator.of(ctx.context).pop();
            },
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text("确定"),
            onPressed: () async {
              Navigator.of(ctx.context).pop();
              Navigator.of(ctx.context).pop();
              Navigator.of(ctx.context).pop();
              bus.emit(BusEvent.ResetMiniPlayer);
              ApplicationManager.sharedInstance().playerManager.player.stop();
              StorageManager manager = await StorageManager.getInstance();
              manager.removeAllFromLocalPlayList();
            },
          ),
        ],
      );
    },
  );
}

void _onTapItem(Action action, Context<GlobalPlayerLocalplaylistState> ctx) {
  SongData song = action.payload;
  // ctx.state.itemTapCallback != null
  //     ? ctx.state.itemTapCallback(song)
  //     : ApplicationManager.logger
  //         .w("local list item tap callback not implement");
  ctx.dispatch(GlobalPlayerControlpadActionCreator.onHandleItemTap(song));
  ctx.dispatch(GlobalPlayerLocalplaylistActionCreator.onClose());
}
