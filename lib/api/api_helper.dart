import 'dart:convert';

import 'package:app_demo/app.dart';
import 'package:app_demo/model/base_response.dart';
import 'package:app_demo/model/request/signup_request.dart';
import 'package:app_demo/model/request/training_list_request.dart';
import 'package:app_demo/model/request/update_profile_request.dart';
import 'package:app_demo/model/responses/login_r.dart';
import 'package:app_demo/model/responses/otp_response.dart';
import 'package:app_demo/model/responses/signup_require_response.dart';
import 'package:app_demo/model/responses/signup_response.dart';
import 'package:app_demo/model/responses/traninig_list_response.dart';
import 'package:app_demo/model/responses/updated_profile_response.dart';
import 'package:app_demo/model/responses/user_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  LoginR login(http.Response response) {
    final Map parsed = json.decode(response.body);
    LoginR responseModel = new LoginR.fromJson(parsed);
    return responseModel;
  }

  Future<BaseResponse> generateOTP(
      BuildContext context, String mobile, String emp) async {
    BaseResponse responseModel;
    http.Response response = await App.api.postApi(
        context: context,
        isProgressBar: true,
        urlPath: 'otp/generate/$mobile/$emp');
    final Map parsed = json.decode(response.body);
    responseModel = new BaseResponse.fromJson(parsed);
    return responseModel;
  }

  Future<OTPResponse> validateOTP(
      BuildContext context, String mobile, String emp, String otp) async {
    http.Response response = await App.api.postApi(
        context: context,
        isProgressBar: true,
        urlPath: 'otp/validate/$mobile/$otp/$emp');
    final Map parsed = json.decode(response.body);
    OTPResponse responseModel = new OTPResponse.fromJson(parsed);
    return responseModel;
  }

  Future<BaseResponse> regenerateOtp(
      BuildContext context, String mobile) async {
    http.Response response = await App.api.postApi(
        context: context,
        isProgressBar: true,
        urlPath: 'otp/regenerate/$mobile');
    final Map parsed = json.decode(response.body);
    BaseResponse responseModel = new BaseResponse.fromJson(parsed);
    return responseModel;
  }

  Future<RequireDataResponse> getRequireDataForSignUp(
      BuildContext context) async {
    http.Response response = await App.api.getApi(
        context: context,
        isProgressBar: false,
        urlPath: 'signup/getRequiredData');
    final Map parsed = json.decode(response.body);
    RequireDataResponse responseModel =
        new RequireDataResponse.fromJson(parsed);
    return responseModel;
  }

  Future<SignUpResponse> signUp(
      BuildContext context, SignUpRequest request) async {
    http.Response response = await App.api.postApi(
        context: context,
        isProgressBar: true,
        urlPath: 'signup',
        requestData: request.toJson());
    final Map parsed = json.decode(response.body);
    SignUpResponse responseModel = new SignUpResponse.fromJson(parsed);
    return responseModel;
  }

  Future<BaseResponse> logOut(BuildContext context) async {
    http.Response response = await App.api
        .postApi(context: context, isProgressBar: true, urlPath: 'logout');
    final Map parsed = json.decode(response.body);
    BaseResponse responseModel = new BaseResponse.fromJson(parsed);
    return responseModel;
  }

  Future<UserResponse> getUserProfile(BuildContext context) async {
    http.Response response = await App.api.getApi(
        context: context, isProgressBar: true, urlPath: 'attendee/getProfile');
    final Map parsed = json.decode(response.body);
    UserResponse responseModel = new UserResponse.fromJson(parsed);
    return responseModel;
  }

  Future<UpdateProfileResponse> updateProfile(
      BuildContext context, UpdateProfileRequest request) async {
    http.Response response = await App.api.postApi(
        context: context,
        isProgressBar: true,
        urlPath: 'attendee/updateProfile',
        requestData: request.toJson());
    final Map parsed = json.decode(response.body);
    UpdateProfileResponse responseModel =
        new UpdateProfileResponse.fromJson(parsed);
    return responseModel;
  }

  Future<TrainingListResponse> getTrainingList(
      BuildContext context, int page, TrainingListRequest request) async {
    http.Response response = await App.api.postApi(
        context: context,
        isProgressBar: true,
        urlPath: 'training/list/${page}',
        requestData: request.toJson());
    final Map parsed = json.decode(response.body);
    TrainingListResponse responseModel =
        new TrainingListResponse.fromJson(parsed);
    return responseModel;
  }

  Future<TrainingListResponse> getMyTrainingList(
      BuildContext context, int page, TrainingListRequest request) async {
    http.Response response = await App.api.postApi(
        context: context,
        isProgressBar: true,
        urlPath: 'training/list/my/${page}',
        requestData: request.toJson());
    final Map parsed = json.decode(response.body);
    TrainingListResponse responseModel =
    new TrainingListResponse.fromJson(parsed);
    return responseModel;
  }
}
