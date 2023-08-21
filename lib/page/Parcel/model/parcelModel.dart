class ParcelListModel {
  int? id;
  String? tracking;
  String? createdAt;
  dynamic cashCollection;
  dynamic hasExchange;
  Customer? customer;
  Merchant? merchant;
  Status? status;

  ParcelListModel(
      {this.id,
      this.tracking,
      this.createdAt,
      this.customer,
      this.merchant,
      this.status});

  ParcelListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tracking = json['tracking'];
    cashCollection = json['cash_collection'];
    hasExchange = json['has_exchange'];
    createdAt = json['created_at'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    merchant = json['merchant'] != null
        ? new Merchant.fromJson(json['merchant'])
        : null;
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
  }
}

class Customer {
  String? name;
  String? phone;
  String? address;

  Customer({this.name, this.phone, this.address});

  Customer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
  }
}

class Merchant {
  int? id;
  String? name;
  String? phone;
  String? company;
  String? address;
  dynamic lat;
  dynamic lng;

  Merchant({this.id, this.name, this.phone, this.company, this.address});

  Merchant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lat = json['lat'];
    lng = json['lng'];
    phone = json['phone'];
    company = json['company'];
    address = json['address'];
  }
}

class Status {
  dynamic showMerchant;
  dynamic showCustomer;
  dynamic pickupDoneBtn;
  dynamic merchantRejectBtn;
  dynamic deliveryDoneBtn;
  dynamic rescheduleBtn;
  dynamic customerRejectBtn;
  dynamic returnDoneBtn;
  String? label;
  ParcelIcons? icon;
  ParcelIcons? color;

  Status(
      {this.showMerchant,
      this.showCustomer,
      this.pickupDoneBtn,
      this.merchantRejectBtn,
      this.deliveryDoneBtn,
      this.rescheduleBtn,
      this.customerRejectBtn,
      this.returnDoneBtn,
      this.label,
      this.icon,
      this.color});

  Status.fromJson(Map<String, dynamic> json) {
    showMerchant = json['show_merchant'];
    showCustomer = json['show_customer'];
    pickupDoneBtn = json['pickup_done_btn'];
    merchantRejectBtn = json['merchant_reject_btn'];
    deliveryDoneBtn = json['delivery_done_btn'];
    rescheduleBtn = json['reschedule_btn'];
    customerRejectBtn = json['customer_reject_btn'];
    returnDoneBtn = json['return_done_btn'];
    label = json['label'];
    icon = json['icon'] != false ? ParcelIcons.fromJson(json['icon']) : null;
    color = json['color'] != false ? ParcelIcons.fromJson(json['color']) : null;
  }
}

class ParcelIcons {
  dynamic code;
  dynamic bgColor;
  dynamic fontColor;

  ParcelIcons({this.code, this.bgColor, this.fontColor});

  ParcelIcons.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    bgColor = json['bg_color'];
    fontColor = json['font_color'];
  }
}
