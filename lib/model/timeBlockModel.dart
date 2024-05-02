import 'dart:ffi';

class TimeBlockModel {
  String? _userId;
  String? _date;
  String? _weekDay;
  String? _startTime;
  String? _endTime;

  TimeBlockModel(
      {String? userName,
        String? date,
        String? weekDay,
        String? startTime,
        String? endTIme,}) {
    if (userName != null){
      _userId = userName;
    }
    if (date != null) {
      _date = date;
    }
    if (startTime != null) {
      _startTime = startTime;
    }
    if (endTIme != null) {
      _endTime = endTIme;
    }
  }

  String? get userName => _userId;
  set userId(String? userId) => _userId = userId;
  String? get date => _date;
  set date(String? date) => _date = date;
  String? get weekDay => _weekDay;
  set weekDay(String? weekDay) => _weekDay = weekDay;
  String? get startTime => _startTime;
  set startTime(String? startTime) => _startTime = startTime;
  String? get endTIme => _endTime;
  set endTIme(String? endTIme) => _endTime = endTIme;

  TimeBlockModel.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _date = json['date'];
    _weekDay = json['weekDay'];
    _startTime = json['startTime'];
    _endTime = json['endTIme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = _userId;
    data['date'] = _date;
    data['weekDay'] = _weekDay;
    data['startTime'] = _startTime;
    data['endTIme'] = _endTime;
    return data;
  }
}