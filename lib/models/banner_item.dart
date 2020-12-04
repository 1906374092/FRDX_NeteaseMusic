import 'package:json_annotation/json_annotation.dart';

part 'banner_item.g.dart';

@JsonSerializable()
class Banner_item {
    Banner_item();

    String pic;
    num targetId;
    num adid;
    num targetType;
    String titleColor;
    String typeTitle;
    String url;
    String adurlV2;
    bool exclusive;
    String monitorImpress;
    String monitorClick;
    String monitorType;
    List monitorImpressList;
    List monitorClickList;
    String monitorBlackList;
    String extMonitor;
    String extMonitorInfo;
    String adSource;
    String adLocation;
    String encodeId;
    String event;
    String video;
    String dynamicVideoData;
    String bannerId;
    String alg;
    String scm;
    String requestId;
    bool showAdTag;
    num pid;
    String showContext;
    String adDispatchJson;
    
    factory Banner_item.fromJson(Map<String,dynamic> json) => _$Banner_itemFromJson(json);
    Map<String, dynamic> toJson() => _$Banner_itemToJson(this);
}
