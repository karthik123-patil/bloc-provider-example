/// success : true
/// message : "Login Successfully"
/// user : {"id":"2021USRID1640872190299","isApproved":true,"jwt_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjIwMjFVU1JJRDE2NDA4NzIxOTAyOTkiLCJkZXZpY2VJRCI6IjEyMzQ1NiIsInJvbGVOYW1lIjoiRFJJVkVSIiwiaWF0IjoxNjQxOTE4NTg1fQ.T-FCqlV2k_ehWUENFI1CnoIDHxLZ7oGMQUpG1L5Iy88","activeRideId":"2022RIDE1641897600772","obj":{"id":"2021USRID1640872190299","firstName":"vishal","lastName":"driver","email":"vishalpvijayan711@gmail.com","password":"","isOnline":true,"phone":"7877559474","dob":"1988-12-23","address":"brnnn","city":"bengaluru","emergencyContact":"9166710988","isAvailable":false,"isApproved":true,"isRideAssigned":true,"stripeCustomerId":null,"roleName":"DRIVER","deviceID":"57d1b80b7e816cb3","deviceToken":"dtezdTZqS42l9no-5iH6CP:APA91bFPrg9QgBZzLo4_NtLvoJfjIl-zo6L2F5V1RlxKzs1Ak0XCZxYX3FAGGy5_EUCFsrh2RHkVhpxJzqoWLQ_KhBXElNtagwsCiOj2K-I2gH-i5nCTmV73eZTs0o51Q0HImIu-IZJz","isActive":true,"isEmailVerified":false,"createdAt":"2021-12-30T13:49:50.000Z","updatedAt":"2022-01-11T11:20:12.000Z"}}

class LoginResponse {
  LoginResponse({
    bool? success,
    String? message,
    User? user,}){
    _success = success;
    _message = message;
    _user = user;
  }

  LoginResponse.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  bool? _success;
  String? _message;
  User? _user;

  bool? get success => _success;
  String? get message => _message;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// id : "2021USRID1640872190299"
/// isApproved : true
/// jwt_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjIwMjFVU1JJRDE2NDA4NzIxOTAyOTkiLCJkZXZpY2VJRCI6IjEyMzQ1NiIsInJvbGVOYW1lIjoiRFJJVkVSIiwiaWF0IjoxNjQxOTE4NTg1fQ.T-FCqlV2k_ehWUENFI1CnoIDHxLZ7oGMQUpG1L5Iy88"
/// activeRideId : "2022RIDE1641897600772"
/// obj : {"id":"2021USRID1640872190299","firstName":"vishal","lastName":"driver","email":"vishalpvijayan711@gmail.com","password":"","isOnline":true,"phone":"7877559474","dob":"1988-12-23","address":"brnnn","city":"bengaluru","emergencyContact":"9166710988","isAvailable":false,"isApproved":true,"isRideAssigned":true,"stripeCustomerId":null,"roleName":"DRIVER","deviceID":"57d1b80b7e816cb3","deviceToken":"dtezdTZqS42l9no-5iH6CP:APA91bFPrg9QgBZzLo4_NtLvoJfjIl-zo6L2F5V1RlxKzs1Ak0XCZxYX3FAGGy5_EUCFsrh2RHkVhpxJzqoWLQ_KhBXElNtagwsCiOj2K-I2gH-i5nCTmV73eZTs0o51Q0HImIu-IZJz","isActive":true,"isEmailVerified":false,"createdAt":"2021-12-30T13:49:50.000Z","updatedAt":"2022-01-11T11:20:12.000Z"}

class User {
  User({
    String? id,
    bool? isApproved,
    String? jwtToken,
    String? activeRideId,
    Obj? obj,}){
    _id = id;
    _isApproved = isApproved;
    _jwtToken = jwtToken;
    _activeRideId = activeRideId;
    _obj = obj;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _isApproved = json['isApproved'];
    _jwtToken = json['jwt_token'];
    _activeRideId = json['activeRideId'];
    _obj = json['obj'] != null ? Obj.fromJson(json['obj']) : null;
  }
  String? _id;
  bool? _isApproved;
  String? _jwtToken;
  String? _activeRideId;
  Obj? _obj;

  String? get id => _id;
  bool? get isApproved => _isApproved;
  String? get jwtToken => _jwtToken;
  String? get activeRideId => _activeRideId;
  Obj? get obj => _obj;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['isApproved'] = _isApproved;
    map['jwt_token'] = _jwtToken;
    map['activeRideId'] = _activeRideId;
    if (_obj != null) {
      map['obj'] = _obj?.toJson();
    }
    return map;
  }

}

/// id : "2021USRID1640872190299"
/// firstName : "vishal"
/// lastName : "driver"
/// email : "vishalpvijayan711@gmail.com"
/// password : ""
/// isOnline : true
/// phone : "7877559474"
/// dob : "1988-12-23"
/// address : "brnnn"
/// city : "bengaluru"
/// emergencyContact : "9166710988"
/// isAvailable : false
/// isApproved : true
/// isRideAssigned : true
/// stripeCustomerId : null
/// roleName : "DRIVER"
/// deviceID : "57d1b80b7e816cb3"
/// deviceToken : "dtezdTZqS42l9no-5iH6CP:APA91bFPrg9QgBZzLo4_NtLvoJfjIl-zo6L2F5V1RlxKzs1Ak0XCZxYX3FAGGy5_EUCFsrh2RHkVhpxJzqoWLQ_KhBXElNtagwsCiOj2K-I2gH-i5nCTmV73eZTs0o51Q0HImIu-IZJz"
/// isActive : true
/// isEmailVerified : false
/// createdAt : "2021-12-30T13:49:50.000Z"
/// updatedAt : "2022-01-11T11:20:12.000Z"

class Obj {
  Obj({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    bool? isOnline,
    String? phone,
    String? dob,
    String? address,
    String? city,
    String? emergencyContact,
    bool? isAvailable,
    bool? isApproved,
    bool? isRideAssigned,
    dynamic stripeCustomerId,
    String? roleName,
    String? deviceID,
    String? deviceToken,
    bool? isActive,
    bool? isEmailVerified,
    String? createdAt,
    String? updatedAt,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _password = password;
    _isOnline = isOnline;
    _phone = phone;
    _dob = dob;
    _address = address;
    _city = city;
    _emergencyContact = emergencyContact;
    _isAvailable = isAvailable;
    _isApproved = isApproved;
    _isRideAssigned = isRideAssigned;
    _stripeCustomerId = stripeCustomerId;
    _roleName = roleName;
    _deviceID = deviceID;
    _deviceToken = deviceToken;
    _isActive = isActive;
    _isEmailVerified = isEmailVerified;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Obj.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _password = json['password'];
    _isOnline = json['isOnline'];
    _phone = json['phone'];
    _dob = json['dob'];
    _address = json['address'];
    _city = json['city'];
    _emergencyContact = json['emergencyContact'];
    _isAvailable = json['isAvailable'];
    _isApproved = json['isApproved'];
    _isRideAssigned = json['isRideAssigned'];
    _stripeCustomerId = json['stripeCustomerId'];
    _roleName = json['roleName'];
    _deviceID = json['deviceID'];
    _deviceToken = json['deviceToken'];
    _isActive = json['isActive'];
    _isEmailVerified = json['isEmailVerified'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _password;
  bool? _isOnline;
  String? _phone;
  String? _dob;
  String? _address;
  String? _city;
  String? _emergencyContact;
  bool? _isAvailable;
  bool? _isApproved;
  bool? _isRideAssigned;
  dynamic _stripeCustomerId;
  String? _roleName;
  String? _deviceID;
  String? _deviceToken;
  bool? _isActive;
  bool? _isEmailVerified;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get password => _password;
  bool? get isOnline => _isOnline;
  String? get phone => _phone;
  String? get dob => _dob;
  String? get address => _address;
  String? get city => _city;
  String? get emergencyContact => _emergencyContact;
  bool? get isAvailable => _isAvailable;
  bool? get isApproved => _isApproved;
  bool? get isRideAssigned => _isRideAssigned;
  dynamic get stripeCustomerId => _stripeCustomerId;
  String? get roleName => _roleName;
  String? get deviceID => _deviceID;
  String? get deviceToken => _deviceToken;
  bool? get isActive => _isActive;
  bool? get isEmailVerified => _isEmailVerified;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['password'] = _password;
    map['isOnline'] = _isOnline;
    map['phone'] = _phone;
    map['dob'] = _dob;
    map['address'] = _address;
    map['city'] = _city;
    map['emergencyContact'] = _emergencyContact;
    map['isAvailable'] = _isAvailable;
    map['isApproved'] = _isApproved;
    map['isRideAssigned'] = _isRideAssigned;
    map['stripeCustomerId'] = _stripeCustomerId;
    map['roleName'] = _roleName;
    map['deviceID'] = _deviceID;
    map['deviceToken'] = _deviceToken;
    map['isActive'] = _isActive;
    map['isEmailVerified'] = _isEmailVerified;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}