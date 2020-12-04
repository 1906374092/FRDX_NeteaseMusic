import 'package:json_annotation/json_annotation.dart';

part 'liveUrl.g.dart';

@JsonSerializable()
class LiveUrl {
    LiveUrl();

    String httpPullUrl;
    String hlsPullUrl;
    String rtmpPullUrl;
    
    factory LiveUrl.fromJson(Map<String,dynamic> json) => _$LiveUrlFromJson(json);
    Map<String, dynamic> toJson() => _$LiveUrlToJson(this);
}
