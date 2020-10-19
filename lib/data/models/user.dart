
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

List<User> usersFromJson(List<dynamic> list) =>
    List<User>.from(list.map((x) => User.fromJson(x)));

@JsonSerializable()
class User {
  
  String username;
  String fullName;
  String sessionToken;
  bool isDriver;
  bool isHubHero;
  bool isLineHaulDriver;
  int staffId;
  int driverId;

  User({
    this.username,
    this.fullName,
    this.sessionToken,
    this.isDriver,
    this.isHubHero,
    this.isLineHaulDriver,
    this.staffId,
    this.driverId,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String,dynamic> toJson() => _$UserToJson(this);

}
