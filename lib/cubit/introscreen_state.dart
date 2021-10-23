

part of 'introscreen_cubit.dart';

class IntroscreenState {
  bool introScreenValue;
  IntroscreenState({
    required this.introScreenValue,
  });

  Map<String, dynamic> toMap() {
    return {
      'introScreenValue': introScreenValue,
    };
  }

  factory IntroscreenState.fromMap(Map<String, dynamic> map) {
    return IntroscreenState(
      introScreenValue: map['introScreenValue'],
    );
  }

  String toJson() => json.encode(toMap());

  factory IntroscreenState.fromJson(String source) => IntroscreenState.fromMap(json.decode(source));
}
