class TransactionModel {
  int? id;
  String? title;
  String? value;
  TrColor? color;
  String? status;
  String? icon;

  TransactionModel(
      {this.id, this.icon, this.title, this.value, this.color, this.status});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    title = json['title'];
    value = json['value'];
    color = json['color'] != null ? new TrColor.fromJson(json['color']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['value'] = this.value;
    if (this.color != null) {
      data['color'] = this.color!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class TrColor {
  String? code;
  String? bgColor;
  String? fontColor;

  TrColor({this.code, this.bgColor, this.fontColor});

  TrColor.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    bgColor = json['bg_color'];
    fontColor = json['font_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['bg_color'] = this.bgColor;
    data['font_color'] = this.fontColor;
    return data;
  }
}

class RiderHomeParcelModel {
  int? id;
  String? title;
  int? value;
  PrColor? color;
  String? status;
  String? icon;
  RiderHomeParcelModel(
      {this.id, this.title, this.icon, this.value, this.color, this.status});

  RiderHomeParcelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    title = json['title'];
    value = json['value'];
    color = json['color'] != null ? new PrColor.fromJson(json['color']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['value'] = this.value;
    if (this.color != null) {
      data['color'] = this.color!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class PrColor {
  String? code;
  String? bgColor;
  String? fontColor;

  PrColor({this.code, this.bgColor, this.fontColor});

  PrColor.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    bgColor = json['bg_color'];
    fontColor = json['font_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['bg_color'] = this.bgColor;
    data['font_color'] = this.fontColor;
    return data;
  }
}
