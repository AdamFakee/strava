import 'dart:convert';

class SActivityModel {
  int? id;
  String? createAt;
  final String timer;
  final String pace;
  final String distance;
  final bool status;
  final String routePoints;
  final String userId;
  final String imagePath;
  
  SActivityModel({
    this.id,
    this.createAt,
    required this.timer,
    required this.pace,
    required this.distance,
    required this.status,
    required this.routePoints,
    required this.userId,
    required this.imagePath
  });

  SActivityModel copyWith({
    int? id,
    String? createAt,
    String? timer,
    String? pace,
    String? distance,
    bool? status,
    String? routePoints,
    String? userId,
    String? imagePath
  }) {
    return SActivityModel(
      id: id ?? this.id,
      createAt: createAt ?? this.createAt,
      timer: timer ?? this.timer,
      pace: pace ?? this.pace,
      distance: distance ?? this.distance,
      status: status ?? this.status,
      routePoints: routePoints ?? this.routePoints,
      userId: userId ?? this.userId,
      imagePath: imagePath ?? this.imagePath
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'timer': timer,
      'pace': pace,
      'distance': distance,
      'status': status ? 1 : 0,
      'routePoints': routePoints,
      'userId': userId,
      'imagePath': imagePath
    };
  }

  factory SActivityModel.fromMap(Map<String, dynamic> map) {
    return SActivityModel(
      id: map['id'],
      createAt: map['createAt'] as String,
      timer: map['timer'] as String,
      pace: map['pace'] as String,
      distance: map['distance'] as String,
      status: map['status'] == 1 ? true : false,
      routePoints: map['routePoints'] as String,
      userId: map['userId'] as String,
      imagePath: map['imagePath']
    );
  }

  String toJson() => json.encode(toMap());

  factory SActivityModel.fromJson(String source) => SActivityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ActivityModel(id: $id, createAt: $createAt, timer: $timer, pace: $pace, distance: $distance, status: $status, routePoints: $routePoints, userId: $userId), imagePath: $imagePath';
  }

  @override
  bool operator ==(covariant SActivityModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.createAt == createAt &&
      other.timer == timer &&
      other.pace == pace &&
      other.distance == distance &&
      other.status == status &&
      other.routePoints == routePoints &&
      other.userId == userId && other.imagePath == imagePath;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      createAt.hashCode ^
      timer.hashCode ^
      pace.hashCode ^
      distance.hashCode ^
      status.hashCode ^
      routePoints.hashCode ^
      userId.hashCode ^ imagePath.hashCode;
  }
}
