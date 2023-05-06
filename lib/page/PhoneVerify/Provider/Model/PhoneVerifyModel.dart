class UserExistsModel {
  bool? status;
  String? newPassword;
  String? login;
  int? statusCode;

  UserExistsModel({this.status, this.newPassword, this.login, this.statusCode});

  UserExistsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    newPassword = json['new_password'];
    login = json['login'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['new_password'] = this.newPassword;
    data['login'] = this.login;
    data['status_code'] = this.statusCode;
    return data;
  }
}
