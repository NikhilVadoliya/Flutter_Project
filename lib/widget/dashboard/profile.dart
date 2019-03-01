
import 'package:app_demo/custom_fonts_icons.dart';
import 'package:app_demo/data_manager.dart';
import 'package:app_demo/helper/color_helper.dart';
import 'package:app_demo/helper/string.dart';
import 'package:app_demo/helper/utils.dart';
import 'package:app_demo/interfaces/dialog_callback.dart';
import 'package:app_demo/interfaces/toolbar_click_listener.dart';
import 'package:app_demo/interfaces/update_profile_listener.dart';
import 'package:app_demo/model/data/require_data.dart';
import 'package:app_demo/model/request/update_profile_request.dart';
import 'package:app_demo/model/responses/login_response.dart';
import 'package:app_demo/model/responses/updated_profile_response.dart';
import 'package:app_demo/model/responses/user_response.dart';
import 'package:app_demo/validator/common_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Profile extends StatefulWidget {
  OnUpdateProfile updateDataListener;

  Profile(this.updateDataListener);

  @override
  _ProfileState createState() => _ProfileState(this.updateDataListener);
}

class _ProfileState extends State<Profile> implements DialogCallBack {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _empCode = new TextEditingController();
  TextEditingController _mobileNum = new TextEditingController();
  TextEditingController _firstNameController = new TextEditingController();
  TextEditingController _lastNameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();

  TextEditingController _designationController = new TextEditingController();
  TextEditingController _subAreaController = new TextEditingController();
  TextEditingController _disciplineController = new TextEditingController();
  TextEditingController _officialAddressController =
      new TextEditingController();
  TextEditingController _officialTelephoneController =
      new TextEditingController();
  TextEditingController _residentialAddressController =
      new TextEditingController();
  TextEditingController _residentialTelephone = new TextEditingController();

  OnToolbarClickListener listener;

  LoginResponse loginResponse;
  bool isEnable;
  String selectedRegion;
  List<RequireData> listRegion;
  String selectedRegionId;
  String radioGender;
  DateTime _dateTime = null;
  String selectedDate = '';
  bool isDateAdded = false;
  String btnName;
  int prefillDate;
  UserResponse response;

  OnUpdateProfile updateDataListener;

  _ProfileState(this.updateDataListener);

  @override
  void initState() {
    btnName = 'Edit';
    isEnable = false;
    listRegion = new List<RequireData>();
    listRegion.add(new RequireData('0', ''));
    selectedRegion = '';
    new Future.delayed(const Duration(milliseconds: 500), () {
      getUserName();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 20)),
          TextField(
            enabled: false,
            controller: _empCode,
            style: TextStyle(color: ColorsHelper.blue()),
            keyboardType: TextInputType.number,
            decoration: _textInputDecoration(
                CustomFonts.phonelink_lock, StringHelper.label_employee_code),
          ),
          TextField(
            enabled: false,
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _mobileNum,
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
            keyboardType: TextInputType.number,
            decoration: _textInputDecoration(
                CustomFonts.phonelink_lock, StringHelper.label_mobile_num),
          ),
          TextFormField(
            validator: CommonValidator.emptyValidation,
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _firstNameController,
            enabled: isEnable,
            inputFormatters: [LengthLimitingTextInputFormatter(225)],
            keyboardType: TextInputType.text,
            decoration: _textInputDecoration(
                CustomFonts.phonelink_lock, StringHelper.label_first_name),
          ),
          TextField(
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _lastNameController,
            enabled: isEnable,
            inputFormatters: [LengthLimitingTextInputFormatter(225)],
            keyboardType: TextInputType.text,
            decoration: _textInputDecoration(
                CustomFonts.phonelink_lock, StringHelper.label_last_name),
          ),
          Container(
            margin: EdgeInsets.only(left: 50, top: 10),
            child: Align(
              child: Text(
                'Region*',
                style: TextStyle(
                    color: ColorsHelper.blue(), fontWeight: FontWeight.w500),
              ),
              alignment: Alignment.centerLeft,
            ),
          ),
          dropDownList(),
          TextFormField(
            enabled: isEnable,
            validator: CommonValidator.emptyValidation,
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _designationController,
            inputFormatters: [LengthLimitingTextInputFormatter(225)],
            keyboardType: TextInputType.number,
            decoration: _textInputDecoration(
                CustomFonts.phonelink_lock, StringHelper.label_designation),
          ),
          TextFormField(
            enabled: isEnable,
            validator: CommonValidator.emptyValidation,
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _subAreaController,
            inputFormatters: [LengthLimitingTextInputFormatter(225)],
            keyboardType: TextInputType.text,
            decoration: _textInputDecoration(
                CustomFonts.phonelink_lock, StringHelper.label_airport_station),
          ),
          TextFormField(
            enabled: isEnable,
            validator: CommonValidator.emptyValidation,
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _disciplineController,
            inputFormatters: [LengthLimitingTextInputFormatter(225)],
            keyboardType: TextInputType.text,
            decoration: _textInputDecoration(
                CustomFonts.phonelink_lock, StringHelper.label_discipline),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 10),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new Image.asset(
                      'assets/images/iaa_logo.png',
                      fit: BoxFit.fill,
                      height: 20,
                      width: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        StringHelper.label_date_of_retirement,
                        style: TextStyle(
                            color: ColorsHelper.blue(),
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () => _onDatePickerOpen(context),
                  child: Container(
                      margin: EdgeInsets.only(top: 2, left: 30),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          selectedDate,
                          style: TextStyle(color: ColorsHelper.blue()),
                        ),
                      )),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Divider(
              height: 1.0,
              color: ColorsHelper.blue_light(),
            ),
          ),
          TextFormField(
            enabled: isEnable,
            validator: CommonValidator.emptyValidation,
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _officialAddressController,
            inputFormatters: [LengthLimitingTextInputFormatter(225)],
            keyboardType: TextInputType.text,
            decoration: _textInputDecoration(CustomFonts.phonelink_lock,
                StringHelper.label_official_address),
          ),
          TextFormField(
            enabled: isEnable,
            validator: CommonValidator.mobileNumValidation,
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _officialTelephoneController,
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
            keyboardType: TextInputType.number,
            decoration: _textInputDecoration(CustomFonts.phonelink_lock,
                StringHelper.label_official_telephone),
          ),
          TextFormField(
            enabled: isEnable,
            validator: CommonValidator.emptyValidation,
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _residentialAddressController,
            inputFormatters: [LengthLimitingTextInputFormatter(225)],
            keyboardType: TextInputType.text,
            decoration: _textInputDecoration(CustomFonts.phonelink_lock,
                StringHelper.label_residential_address),
          ),
          TextFormField(
            enabled: isEnable,
            validator: CommonValidator.mobileNumValidation,
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _residentialTelephone,
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
            keyboardType: TextInputType.number,
            decoration: _textInputDecoration(CustomFonts.phonelink_lock,
                StringHelper.label_residential_telephone),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Row(
              children: <Widget>[
                new Image.asset(
                  'assets/images/iaa_logo.png',
                  fit: BoxFit.fill,
                  height: 20,
                  width: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Text(
                    StringHelper.label_gender,
                    style: TextStyle(
                        color: ColorsHelper.blue(),
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 45),
            child: IgnorePointer(
              ignoring: !isEnable,
              child: Row(
                children: <Widget>[
                  Radio(
                      value: 'Male',
                      groupValue: radioGender,
                      activeColor: ColorsHelper.orange(),
                      onChanged: (String value) {
                        onRadioBtnClick(value);
                      }),
                  Text(
                    'Male',
                    style: TextStyle(color: ColorsHelper.blue()),
                  ),
                  Radio(
                      value: 'Female',
                      activeColor: ColorsHelper.orange(),
                      groupValue: radioGender,
                      onChanged: (String value) {
                        onRadioBtnClick(value);
                      }),
                  Text(
                    'Female',
                    style: TextStyle(color: ColorsHelper.blue()),
                  ),
                ],
              ),
            ),
          ),
        ])),
      ),
    );
  }

  InputDecoration _textInputDecoration(IconData icon, String label) {
    return InputDecoration(
        prefixIcon: Icon(
          icon,
          color: ColorsHelper.orange(),
          size: 20,
        ),
        labelText: label,
        labelStyle: TextStyle(
            fontSize: 20,
            color: ColorsHelper.blue(),
            fontWeight: FontWeight.w500),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorsHelper.blue())),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorsHelper.blue())));
  }

  void getUserName() async {
    response = await DataManager.of(context).apiHelper.getUserProfile(context);
    if (response.s) {
      setState(() {
        if (response.d.attendee != null) {
          _empCode.text = response.d.attendee.emp_id;
          _mobileNum.text = response.d.attendee.mobile_number;
          _firstNameController.text = response.d.attendee.first_name;
          _lastNameController.text = response.d.attendee.last_name;
          _emailController.text = response.d.attendee.email;
          _subAreaController.text = response.d.attendee.subarea;
          _designationController.text = response.d.attendee.designation;
          _disciplineController.text = response.d.attendee.discipline;
          _residentialTelephone.text = response.d.attendee.residential_tel;
          _residentialAddressController.text =
              response.d.attendee.residential_address;
          _officialAddressController.text =
              response.d.attendee.official_address;
          _officialTelephoneController.text = response.d.attendee.official_tel;
          listRegion = response.d.regions;
          selectedRegionId = response.d.attendee.region;
          radioGender =
              response.d.attendee.gender == "Male" ? "Male" : "Female";
          for (int i = 0; i < listRegion.length; i++) {
            if (listRegion[i].id == response.d.attendee.region)
              selectedRegion = listRegion[i].text;
          }

          if (response.d.attendee.date_of_retirement != null) {
            var date = new DateTime.fromMicrosecondsSinceEpoch(
                response.d.attendee.date_of_retirement * 1000);
            selectedDate = '${date.day}-${date.month}-${date.year}';
            isDateAdded = true;
            prefillDate = response.d.attendee.date_of_retirement;
          }
        }
      });
    } else {
      Utils.showAlertDialog(context: context, message: response.e);
    }
  }

  dropDownList() {
    return IgnorePointer(
      ignoring: !isEnable,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
            prefixIcon:
                Icon(Icons.arrow_forward_ios, color: ColorsHelper.orange())),
        validator: (value) {
          if (value == null) {
            return StringHelper.error_msg_empty_region;
          } else {
            return null;
          }
        },
        hint: Text('Region*'),
        value: selectedRegion,
        onChanged: (value) {
          setState(() {
            selectedRegion = value;
          });
        },
        items: listRegion.map((RequireData f) {
          return DropdownMenuItem<String>(
            value: f.text ?? '',
            child: Text(
              f.text,
              style: TextStyle(color: ColorsHelper.blue()),
            ),
          );
        }).toList(),
      ),
    );
  }

  void onRadioBtnClick(String value) {
    radioGender = value;
    setState(() {});
  }

  _onDatePickerOpen(BuildContext _context) {
    if (isEnable) {
      showDatePicker(
              context: _context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(Duration(days: 1)),
              lastDate: DateTime.now().add(Duration(days: 999999)))
          .then((onValue) {
        if (onValue != null) {
          setState(() {
            isDateAdded = true;
            _dateTime = onValue;
            selectedDate = '${onValue.day}-${onValue.month}-${onValue.year}';
          });
        }
      });
    }
  }

  _onEdit() {
    if (isEnable) {
      if (_formKey.currentState.validate()) {
        if (isDateAdded) {
          Utils.showAlertDialogCallBack(
              context: context,
              listener: this,
              message: StringHelper.msg_update_profile,
              posBtnName: StringHelper.btn_yes,
              navBtnName: StringHelper.btn_no);
        } else {
          Utils.showAlertDialog(
              context: context, message: StringHelper.error_msg_empty_date);
        }
      }
    } else {
      setState(() {
        isEnable = !isEnable;
        btnName = 'Save';
      });
    }
  }

  Future apiCall() async {
    int retirementDate = 0;
    if (_dateTime == null) {
      retirementDate =
          new DateTime.fromMicrosecondsSinceEpoch(prefillDate * 1000)
              .millisecondsSinceEpoch;
    } else {
      retirementDate = _dateTime.millisecondsSinceEpoch;
    }
    String regionId;
    for (int i = 0; i <= listRegion.length; i++) {
      if (listRegion[i].text == selectedRegion) {
        regionId = listRegion[i].id;
        break;
      }
    }

    UpdateProfileRequest request = UpdateProfileRequest(
        response.d.attendee.id,
        _firstNameController.text,
        _lastNameController.text.trim(),
        regionId,
        _designationController.text.trim(),
        _subAreaController.text.trim(),
        _disciplineController.text.trim(),
        retirementDate,
        _officialAddressController.text.trim(),
        _officialTelephoneController.text.trim(),
        _residentialAddressController.text.trim(),
        _residentialTelephone.text.trim(),
        radioGender);

    UpdateProfileResponse updateProfileResponse =
        await DataManager.of(context).apiHelper.updateProfile(context, request);
    if (updateProfileResponse.s) {
      Utils.showAlertDialog(
          context: context, message: StringHelper.msg_profile_updated);
      setState(() {
        isEnable = !isEnable;
        btnName = 'Edit';
        updateDataListener.onUpdateProfile(updateProfileResponse);
      });
    } else {
      Utils.showAlertDialog(context: context, message: response.e);
    }
  }

  @override
  void onNagClick() {
    Navigator.pop(context);
  }

  @override
  void onPosClick() {
    Navigator.pop(context);
    apiCall();
  }

  static void _onEditClick() {}
}
