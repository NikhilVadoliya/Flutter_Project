import 'package:app_demo/helper/color_helper.dart';
import 'package:app_demo/helper/image_assets.dart';
import 'package:app_demo/helper/string.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class ContactUsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 18)),
            _textWidgetLabel(StringHelper.label_contact_director),
            _textWidgetAddress(StringHelper.label_director_address_value),
            _textWidgetPhoneNum(StringHelper.label_land_line,
                StringHelper.label_director_land_line),
            Padding(padding: EdgeInsets.only(top: 18)),
            _textWidgetLabel(StringHelper.label_contact_academy),
            _textWidgetAddress(StringHelper.label_academy_address_value),
            _textWidgetPhoneNum(StringHelper.label_epbax_no,
                StringHelper.label_academy_epbax_nos),
            Padding(padding: EdgeInsets.only(top: 18)),
            _textWidgetLabel(StringHelper.label_contact_hostel),
            _textWidgetAddress(StringHelper.label_hostel_address_value),
            _textWidgetPhoneNum(StringHelper.label_land_line,
                StringHelper.label_hostel_landline_no),
            _textWidgetPhoneNum(StringHelper.label_mobile_no_colon,
                StringHelper.label_hostel_mobile_no),
            Padding(padding: EdgeInsets.only(top: 18)),
            GestureDetector(
              onTap: () => _onMapClick(),
              child: Container(
                color: ColorsHelper.orange(),
                padding: EdgeInsets.all(2),
                child: Image.asset(
                  ImageAssets.iaa_map,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 18)),
          ],
        ),
      ),
    );
  }

  _textWidgetLabel(String title) {
    return Text(
      title,
      textAlign: TextAlign.start,
      style: TextStyle(
          color: ColorsHelper.blue(),
          fontSize: 16,
          fontWeight: FontWeight.w500),
    );
  }

  _textWidgetAddress(String address) {
    return Text(
      address,
      textAlign: TextAlign.start,
      style: TextStyle(color: ColorsHelper.blue(), fontSize: 13),
    );
  }

  _textWidgetPhoneNum(String label, String number) {
    return GestureDetector(
      onTap: () => _onPhoneClick(number),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          children: <Widget>[
            Text(
              label,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: ColorsHelper.blue(),
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            Text(
              number,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: ColorsHelper.blue(),
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  _onPhoneClick(String number) async {
    if (number.contains('/')) {
      number = StringHelper.label_academy_epbax_nos_1;
    }
    if (await launcher.canLaunch("tel:$number")) {
      await launcher.launch("tel://$number");
    } else {
      throw 'Could not launch $number"';
    }
  }

  _onMapClick() async {
    await launcher.launch(
        "http://maps.google.com/maps?saddr=My+Location&daddr=28.529609,77.139772");
  }
}
