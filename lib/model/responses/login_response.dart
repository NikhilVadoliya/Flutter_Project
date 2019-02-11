/**
 * Copyright (c) 2015-2016 Sailfin Technologies, Pvt. Ltd.  All Rights Reserved.
 * This software is the confidential and proprietary information
 * (Confidential Information) of Sailfin Technologies, Pvt. Ltd.  You shall not
 * disclose or use Confidential Information without the express written
 * agreement of Sailfin Technologies, Pvt. Ltd.
 */

import 'package:app_demo/model/data/user_data.dart';

import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';
/**
 * Created by nikhil.vadoliya on 18-01-2019.
 */

@JsonSerializable()
class LoginResponse {
  int dateOfRetirement;
  USerData user;

  LoginResponse(this.dateOfRetirement, this.user);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
