import 'package:json_annotation/json_annotation.dart';

part 'pageConfig.g.dart';

@JsonSerializable()
class PageConfig {
    PageConfig();

    String refreshToast;
    String nodataToast;
    num refreshInterval;
    String title;
    bool fullscreen;
    
    factory PageConfig.fromJson(Map<String,dynamic> json) => _$PageConfigFromJson(json);
    Map<String, dynamic> toJson() => _$PageConfigToJson(this);
}
