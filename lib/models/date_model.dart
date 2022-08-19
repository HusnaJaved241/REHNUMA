class DateModel{
  dynamic date;
  dynamic month;
  dynamic day;
  DateModel({this.day,this.date,this.month});
  @override
  String toString() {
    return date.toString()+" " + month.toString()+ " " + day.toString();
  }
}