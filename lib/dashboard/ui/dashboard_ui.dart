import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello_assignment/commons.dart';
import 'package:ostello_assignment/dashboard/provider/cards_data_provider.dart';
import 'package:ostello_assignment/dashboard/provider/carousal_data_provider.dart';
import 'package:ostello_assignment/dashboard/widgets/dashboard_widget.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final carousalData = ref.read(carousalDataProvider);
    final cardData = ref.read(cardDataProvider);
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(),
      appBar: dashboardAppBar(context),
      body: ListView(
        children: [
          const OnlineOrOfflineToggleButtons(),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: carousalData
                    .map(
                      (data) => _buildCourseCard(
                          title: data.title,
                          image: data.image,
                          colorHex: data.backgroundColor,
                          buttonText: data.buttonText,
                          subtitle: data.subtitle),
                    )
                    .toList()),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: cardData
                    .map(
                      (data) => CardWithBottomTitle(
                        title: data.title,
                        assetName: data.image,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildSectionHeader(title: 'Toppers of ABC', showViewAll: false),
          const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                CardOfToppers(),
                CardOfToppers(),
              ])),
          _buildSectionHeader(title: 'Popular Courses', showViewAll: true),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                _buildAllCourseCard(true),
                _buildAllCourseCard(true)
              ])),
          const SizedBox(
            height: 20,
          ),
          _buildSectionHeader(title: 'All Courses', showViewAll: true),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                _buildAllCourseCard(
                    false), //this boolean is for ui rendering of popular card and all course card
                _buildAllCourseCard(false)
              ])),
          const SizedBox(
            height: 20,
          ),
          const ReferAndEarnCard(),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard(
      {required String colorHex,
      required String image,
      required String title,
      required String buttonText,
      required String subtitle}) {
    return Stack(alignment: Alignment.bottomRight, children: [
      Container(
        height: 140,
        margin: const EdgeInsets.only(left: 20),
        width: MediaQuery.of(context).size.width * 0.55,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: HexColor.fromHex(colorHex),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w800, height: 1.5)),
            Text(subtitle,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 2.4,
                    color: HexColor.fromHex("#44464C"))),
            const SizedBox(height: 10),
            Container(
              width: 72,
              height: 26,
              decoration: BoxDecoration(
                  color: HexColor.fromHex("#272A34"),
                  borderRadius: BorderRadius.circular(6)),
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                      color: HexColor.fromHex("#FFFFFF"),
                      fontWeight: FontWeight.w800,
                      fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 10),
        child: getAssetImage(image, height: 77, width: 103, fit: BoxFit.cover),
      ),
    ]);
  }

  Widget _buildSectionHeader({required String title, bool? showViewAll}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          (showViewAll == true)
              ? Text(
                  "View All",
                  style: TextStyle(
                      color: HexColor.fromHex("#EB5757"),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      decorationColor: HexColor.fromHex("#EB5757")),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildAllCourseCard(bool? isPopularCard) {
    return AllCoursesCardWithContent(
      isPopularCard: isPopularCard ?? false,
    );
  }
}
