class LogModel{
  String ?pic;
  DateTime ?time;
  LogModel({this.time, this.pic});
  static LogModel fromJson(Map<String,dynamic> map) => LogModel(
    time: DateTime.parse(map['log_date']),
    pic: "http://162.19.129.112/pi/${map['pic']}"
  );
}