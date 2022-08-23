class SalahModel{
  String salahName;
  bool status;
  String shukar;
  SalahModel({required this.salahName,required this.status,required this.shukar});
  factory SalahModel.fromJson(dynamic json) {
    return SalahModel(
      salahName: json["salahName"],
      shukar: json['shukar'],
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() =>
      {"status": status, "salahName": salahName,'shukar':shukar};
}