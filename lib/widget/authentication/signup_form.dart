
import 'package:app_demo/custom_fonts_icons.dart';
import 'package:app_demo/data_manager.dart';
import 'package:app_demo/helper/color_helper.dart';
import 'package:app_demo/helper/string.dart';
import 'package:app_demo/helper/utils.dart';
import 'package:app_demo/helper/widget_helper.dart';
import 'package:app_demo/model/data/employee_data.dart';
import 'package:app_demo/model/data/require_data.dart';
import 'package:app_demo/model/request/signup_request.dart';
import 'package:app_demo/model/responses/signup_require_response.dart';
import 'package:app_demo/model/responses/signup_response.dart';
import 'package:app_demo/pageRouter/slide_page_router.dart';
import 'package:app_demo/validator/common_validator.dart';
import 'package:app_demo/widget/authentication/signup_complete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpForm extends StatefulWidget {
  Employee emp;
  String mobileNum;

  SignUpForm(this.mobileNum, this.emp);

  @override
  _SignUpFormState createState() => _SignUpFormState(emp, mobileNum);
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String radioGender;
  DateTime _dateTime = null;
  String selectedDate;
  Employee employee;
  String mobileNum;
  List<RequireData> listRegion;
  String selectedRegion;
  bool isDateAdded = false;
  String empCode = '';

  _SignUpFormState(this.employee, this.mobileNum);

  TextEditingController _firstNameController = new TextEditingController();
  TextEditingController _lastNameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmPasswordController =
      new TextEditingController();
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

  @override
  void initState() {
    listRegion = new List<RequireData>();
    getRequireData();
    selectedDate = 'Date of retirement*';

    if (employee != null) {
      empCode = employee.id;
      _firstNameController.text = employee.firstName;
      _lastNameController.text = employee.lastName;
      _emailController.text = employee.email;
      _subAreaController.text = employee.subarea;
      _designationController.text = employee.subgroup;
      _disciplineController.text = employee.discipline;
      radioGender = employee.gender == "Male" ? "Male" : "Female";
      if (employee.dateOfRetirement != null) {
        var date = new DateTime.fromMicrosecondsSinceEpoch(
            employee.dateOfRetirement * 1000);
        selectedDate = '${date.day}-${date.month}-${date.year}';
        isDateAdded = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Theme(
          data: ThemeData(
              hintColor: ColorsHelper.blue(),
              primaryColor: ColorsHelper.blue()),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 65)),
                  WidgetHelper.logoFields(),
                  new Form(key: _formKey, child: _buildTextFields()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFields() {
    return new Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Column(
        children: <Widget>[
          Visibility(
            child: new FocusScope(
              node: new FocusScopeNode(),
              child: new TextFormField(
                  decoration: _textInputDecoration(
                      CustomFonts.phonelink_lock, empCode)),
            ),
            visible: employee == null ? false : true,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return StringHelper.error_empty_first_name;
              }
            },
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _firstNameController,
            keyboardType: TextInputType.text,
            inputFormatters: [LengthLimitingTextInputFormatter(225)],
            decoration: _textInputDecoration(
                CustomFonts.phonelink_lock, StringHelper.label_first_name_ast),
          ),
          TextField(
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _lastNameController,
            inputFormatters: [LengthLimitingTextInputFormatter(225)],
            keyboardType: TextInputType.text,
            decoration: _textInputDecoration(
                CustomFonts.phonelink_lock, StringHelper.label_last_name),
          ),
          TextFormField(
            validator: CommonValidator.emailValidation,
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _emailController,
            inputFormatters: [LengthLimitingTextInputFormatter(225)],
            keyboardType: TextInputType.emailAddress,
            decoration: _textInputDecoration(
                CustomFonts.phonelink_lock, StringHelper.label_email_address),
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return StringHelper.error_msg_empty_pass;
              }
            },
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _passwordController,
            inputFormatters: [LengthLimitingTextInputFormatter(225)],
            obscureText: true,
            decoration: _textInputDecoration(
                CustomFonts.phonelink_lock, StringHelper.label_password),
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return StringHelper.error_msg_empty_confirm_pass;
              } else if (value != _passwordController.text.toString()) {
                return StringHelper.error_msg_pass_match;
              }
            },
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _confirmPasswordController,
            obscureText: true,
            inputFormatters: [LengthLimitingTextInputFormatter(225)],
            decoration: _textInputDecoration(CustomFonts.phonelink_lock,
                StringHelper.label_confirm_password),
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.place, color: ColorsHelper.orange())),
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
                value: f.text,
                child: Text(
                  f.text,
                  style: TextStyle(color: ColorsHelper.blue()),
                ),
              );
            }).toList(),
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return StringHelper.error_msg_empty_designation;
              }
            },
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _designationController,
            inputFormatters: [LengthLimitingTextInputFormatter(225)],
            decoration: _textInputDecoration(
                CustomFonts.phonelink_lock, StringHelper.label_designation_ast),
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return StringHelper.error_msg_empty_airport;
              }
            },
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _subAreaController,
            inputFormatters: [LengthLimitingTextInputFormatter(225)],
            decoration: _textInputDecoration(CustomFonts.phonelink_lock,
                StringHelper.label_airport_station_ast),
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return StringHelper.error_msg_empty_discipline;
              }
            },
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _disciplineController,
            inputFormatters: [LengthLimitingTextInputFormatter(225)],
            decoration: _textInputDecoration(
                CustomFonts.phonelink_lock, StringHelper.label_discipline_ast),
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          GestureDetector(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 16)),
                    Icon(
                      Icons.calendar_today,
                      color: ColorsHelper.orange(),
                      size: 20,
                    ),
                    Padding(padding: EdgeInsets.only(left: 15)),
                    Text(
                      selectedDate,
                      style: TextStyle(color: ColorsHelper.blue()),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
              ],
            ),
            onTap: () => _onDatePickerOpen(context),
          ),
          Divider(color: ColorsHelper.blue(), height: 5),
          Padding(padding: EdgeInsets.only(top: 5)),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return StringHelper.error_msg_empty_official_address;
              }
            },
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _officialAddressController,
            inputFormatters: [LengthLimitingTextInputFormatter(225)],
            decoration: _textInputDecoration(CustomFonts.phonelink_lock,
                StringHelper.label_official_address_ast),
          ),
          TextFormField(
            validator: CommonValidator.mobileNumValidation,
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _officialTelephoneController,
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
            keyboardType: TextInputType.number,
            decoration: _textInputDecoration(CustomFonts.phonelink_lock,
                StringHelper.label_official_telephone),
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return StringHelper.error_msg_empty_residential;
              }
            },
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _residentialAddressController,
            inputFormatters: [LengthLimitingTextInputFormatter(225)],
            decoration: _textInputDecoration(CustomFonts.phonelink_lock,
                StringHelper.label_residential_address_ast),
          ),
          TextFormField(
            validator: CommonValidator.mobileNumValidation,
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _residentialTelephone,
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
            keyboardType: TextInputType.number,
            decoration: _textInputDecoration(CustomFonts.phonelink_lock,
                StringHelper.label_residential_telephone),
          ),
          Row(
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
          Padding(padding: EdgeInsets.only(top: 20)),
          ButtonTheme(
              minWidth: 200,
              child: new RaisedButton(
                textColor: ColorsHelper.white(),
                color: ColorsHelper.orange(),
                child: new Text(StringHelper.btn_sign_up),
                onPressed: () => _signUpPress(),
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ))
        ],
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
        labelStyle: TextStyle(fontSize: 15),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorsHelper.blue())),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorsHelper.blue())));
  }

  _signUpPress() {
    if (_formKey.currentState.validate()) {
      if (isDateAdded) {
        _apiCallSignUp();
      } else {
        Utils.showAlertDialog(
            context: context, message: StringHelper.error_msg_empty_date);
      }
    }
  }

  void onRadioBtnClick(String value) {
    radioGender = value;
    setState(() {});
  }

  void getRequireData() async {

    RequireDataResponse response =
        await DataManager.of(context).apiHelper.getRequireDataForSignUp(context);
    if (response.s) {
      setState(() {
        listRegion.addAll(response.d.regions);
      });
    }
  }

  _onDatePickerOpen(BuildContext _context) {
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

  _apiCallSignUp() async {
    int selectedDate = 0;
    if (_dateTime == null) {
      selectedDate = new DateTime.fromMicrosecondsSinceEpoch(
              employee.dateOfRetirement * 1000)
          .millisecondsSinceEpoch;
    } else {
      selectedDate = _dateTime.millisecondsSinceEpoch;
    }
    String regionId;
    for (int i = 0; i <= listRegion.length; i++) {
      if (listRegion[i].text == selectedRegion) {
        regionId = listRegion[i].id;
        break;
      }
    }

    SignUpRequest request = SignUpRequest(
        empCode,
        _firstNameController.text,
        _lastNameController.text.trim(),
        mobileNum.trim(),
        _emailController.text.trim(),
        _passwordController.text.trim(),
        _designationController.text.trim(),
        radioGender,
        _officialAddressController.text.trim(),
        _officialTelephoneController.text.trim(),
        _residentialAddressController.text.trim(),
        _residentialTelephone.text.trim(),
        _subAreaController.text.trim(),
        _disciplineController.text.trim(),
        regionId,
        selectedDate);

    SignUpResponse response =
        await DataManager.of(context).apiHelper.signUp(context, request);

    if (response.s) {
      Navigator.of(context)
          .push(new SlideLeftRoute(widget: new SignUpComplete()));
    } else {
      Utils.showAlertDialog(context: context, message: response.e);
    }
  }
}
