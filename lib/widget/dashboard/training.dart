import 'package:app_demo/helper/color_helper.dart';
import 'package:app_demo/helper/string.dart';
import 'package:app_demo/widget/dashboard/trainigtab/contact_us_tab.dart';
import 'package:app_demo/widget/dashboard/trainigtab/my_training_tab.dart';
import 'package:app_demo/widget/dashboard/trainigtab/training_tab.dart';
import 'package:flutter/material.dart';

class Training extends StatefulWidget {
  @override
  _TrainingTabState createState() => _TrainingTabState();
}

class _TrainingTabState extends State<Training>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: ColorsHelper.blue(),
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0.0,
            backgroundColor: ColorsHelper.blue(),
            title: TabBar(
              labelColor: ColorsHelper.white(),
              indicatorColor: ColorsHelper.orange(),
              unselectedLabelColor: ColorsHelper.white(),
              isScrollable: true,
              controller: _tabController,
              tabs: <Widget>[
                Tab(child: Text(StringHelper.label_tab_training)),
                Tab(child: Text(StringHelper.label_tab_my_training)),
                Tab(child: Text(StringHelper.label_tab_contact_us)),
              ],
            ),
          ),
          body: TabBarView(
              controller: _tabController,
              children: [new TrainingTab(), new MyTrainingTab(), new ContactUsTab()]),
        ),
      ),
    );
  }
}
