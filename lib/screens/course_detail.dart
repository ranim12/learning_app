import 'package:flutter/material.dart';
import 'package:learning_app/theme/color.dart';
import 'package:learning_app/utils/data.dart';
import 'package:learning_app/widgets/custom_image.dart';
import 'package:readmore/readmore.dart';

import '../widgets/lesson_item.dart';

class CourseDetailPage extends StatefulWidget {
  CourseDetailPage({Key? key, required this.data}) : super(key: key);
  final data;
  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late var courseData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    courseData = widget.data["course"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: buildBody(),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      title: Text(
        courseData["name"],
        style: TextStyle(color: textColor),
      ),
      iconTheme: IconThemeData(color: textColor),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
      child: Column(children: [
        CustomImage(
          courseData["image"],
          radius: 10,
          width: double.infinity,
          height: 200,
        ),
        Divider(),
        SizedBox(height: 20),
        getInfo(),
        SizedBox(height: 20),
        getTabBar(),
        Divider(),
        gettabbarPages()
      ]),
    );
  }

  Widget getTabBar() {
    return Container(
      child: TabBar(indicatorColor: primary, controller: tabController, tabs: [
        Tab(
          child: Text(
            "Francais",
            style: TextStyle(fontSize: 16, color: textColor),
          ),
        ),
        Tab(
          child: Text(
            "Arabe",
            style: TextStyle(fontSize: 16, color: textColor),
          ),
        ),
      ]),
    );
  }

  Widget gettabbarPages() {
    return Container(
      height: 700,
      width: double.infinity,
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          getLessons(),
          Container(
            child: Center(child: Text("arabe")),
          )
        ],
      ),
    );
  }

  Widget getLessons() {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: ((context, index) => LessonItem(data: courses[index])));
  }

  Widget getInfo() {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Text(
              courseData["name"],
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w500, color: textColor),
            ),
            SizedBox(height: 10),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getAttribute(
                Icons.play_circle_outline, courseData["session"], labelColor),
            SizedBox(width: 20),
            getAttribute(
                Icons.schedule_outlined, courseData["duration"], labelColor),
            SizedBox(width: 20),
            getAttribute(Icons.star, courseData["review"], yellow),
          ],
        ),
        SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About Course",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "detail..",
              style: TextStyle(
                fontSize: 14,
                color: textColor,
              ),
            ),
            ReadMoreText(
              courseData["description"],
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimCollapsedText: "Show more",
              moreStyle: TextStyle(fontSize: 14, color: primary),
              style: TextStyle(
                fontSize: 14,
                color: labelColor,
              ),
            )
          ],
        )
      ]),
    );
  }

  Widget getAttribute(IconData icon, String info, Color color) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: labelColor,
        ),
        SizedBox(width: 5),
        Text(
          info,
          style: TextStyle(color: color),
        )
      ],
    );
  }
}
