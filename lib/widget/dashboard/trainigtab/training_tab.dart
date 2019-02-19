import 'package:app_demo/app.dart';
import 'package:app_demo/enum/calender.dart';
import 'package:app_demo/helper/color_helper.dart';
import 'package:app_demo/helper/string.dart';
import 'package:app_demo/helper/utils.dart';
import 'package:app_demo/model/data/tranining_data.dart';
import 'package:app_demo/model/request/training_list_request.dart';
import 'package:app_demo/model/responses/traninig_list_response.dart';
import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';

class TrainingTab extends StatefulWidget {
  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<TrainingTab> {
  TrainingListResponse _response;
  List<TrainingData> _listTraining;
  List<String> _organization;
  List<String> _category;
  List<String> _trainingMonth;
  List<String> _levelOfParticipants;
  Filter _filter;
  int count;
  int pageNum;
  bool isLoadMore;

  @override
  void initState() {
    super.initState();
    _organization = new List<String>();
    _category = new List<String>();
    _trainingMonth = new List<String>();
    _levelOfParticipants = new List<String>();
    _listTraining = new List<TrainingData>();
    pageNum = 1;
    count = 0;
    isLoadMore = true;
    new Future.delayed(const Duration(milliseconds: 500), () {
      getTrainingList(true, pageNum);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsHelper.blue_light_120(),
      body: RefreshIndicator(
        onRefresh: _refreshList,
        child: LoadMore(
          onLoadMore: _loadMore,
//          isFinish: count >= 60, //do this but iaa api not provide total count of product
          isFinish: !isLoadMore,
          whenEmptyLoad: false,
          delegate: DefaultLoadMoreDelegate(),
          textBuilder: DefaultLoadMoreTextBuilder.english,
          child: ListView.builder(
              itemCount: _listTraining.length, itemBuilder: getItemView),
        ),
      ),
    );
  }

  void getTrainingList(bool isProgress, int pageNum) async {
    TrainingListRequest request;
    if (_organization.isNotEmpty &&
        _category.isNotEmpty &&
        _trainingMonth.isNotEmpty &&
        _levelOfParticipants.isNotEmpty) {
      _filter = new Filter(
          _organization, _category, _trainingMonth, _levelOfParticipants);

      request = new TrainingListRequest(_filter, '');
    } else {
      request = new TrainingListRequest(null, '');
    }

    _response = await App.apiHelper
        .getTrainingList(context, pageNum, isProgress, request);
    if (_response.s) {
      setState(() {
        isLoadMore = true;
        _listTraining.clear();
        _listTraining.addAll(_response.d);
      });
    } else {
      Utils.showAlertDialog(context: context, message: _response.e);
    }
  }

  Widget getItemView(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => onItemClick(context, index),
      child: Padding(
        padding: EdgeInsets.only(top: 5, right: 5, left: 5),
        child: Card(
          color: _getBgColor(index),
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${_listTraining[index].programmer_name} (${_listTraining[index].training_code})',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: ColorsHelper.blue(),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                Text(
                  '${StringHelper.label_organization} : ${_listTraining[index].partner_name}',
                  style: TextStyle(
                      color: ColorsHelper.blue(),
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
                Text(
                  '${StringHelper.label_coordinator} : ${_listTraining[index].course_coordinator}',
                  style: TextStyle(
                      color: ColorsHelper.blue(),
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          '${Utils.timestampToStringDate(_listTraining[index].start_date)} to ${Utils.timestampToStringDate(_listTraining[index].end_date)}',
                          style: TextStyle(
                              color: ColorsHelper.blue(), fontSize: 10),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              '${Utils.timestampToStringTime(_listTraining[index].reporting_time)}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: ColorsHelper.blue(),
                                  fontSize: 10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => onFeedBackClick(),
                  child: Visibility(
                    visible: _listTraining[index].isTrainingOpen() &&
                        !_listTraining[index].is_feedback_given &&
                        _listTraining[index].isEnrolled(),
                    child: Text(
                      StringHelper.label_feedback,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: ColorsHelper.orange()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onItemClick(BuildContext context, int index) {}

  onFeedBackClick() {}

  Future<Null> _refreshList() async {
    pageNum = 1;
    count = 0;
    getTrainingList(false, pageNum);
  }

  _getBgColor(int index) {
    if (_listTraining[index].partner_name.toString() ==
        CalenderName[Calender.IAA]) {
      ColorsHelper.iaa_calendar();
    } else if (_listTraining[index].partner_name.toString() ==
        CalenderName[Calender.BCAS]) {
      ColorsHelper.bcas_calendar();
    } else {
      ColorsHelper.dgca_calendar();
    }
  }

  Future<bool> _loadMore() async {
    pageNum++;
    TrainingListRequest request;
    if (_organization.isNotEmpty &&
        _category.isNotEmpty &&
        _trainingMonth.isNotEmpty &&
        _levelOfParticipants.isNotEmpty) {
      _filter = new Filter(
          _organization, _category, _trainingMonth, _levelOfParticipants);

      request = new TrainingListRequest(_filter, '');
    } else {
      request = new TrainingListRequest(null, '');
    }

    _response =
        await App.apiHelper.getTrainingList(context, pageNum, false, request);
    if (_response.s) {
      if (_response.d.length != 0) {
        setState(() {
          _listTraining.addAll(_response.d);
          count = _listTraining.length;
          return true;
        });
      } else {
        pageNum--;
        setState(() {
          isLoadMore = false;
        });
        return false;
      }
    } else {
      pageNum--;
      Utils.showAlertDialog(context: context, message: _response.e);
      isLoadMore = false;
    }
    return true;
  }
}
