import 'package:flutter/material.dart';
import 'package:flutter_toggle_button/flutter_toggle_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ostello_assignment/commons.dart';

PreferredSizeWidget dashboardAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.10),
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: AppBar(
          backgroundColor: HexColor.fromHex("#FAFAFA"),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
              child: Center(
                child: Stack(
                  children: [
                    getAssetImage("notification.png", height: 28, width: 28),
                    const Positioned(
                      right: 0,
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.red,
                        child: Text(
                          '1',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          leading: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: getNetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPnE_fy9lLMRP5DLYLnGN0LRLzZOiEpMrU4g&s"),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Hi, ',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(
                        text: 'Krishna',
                        style: TextStyle(
                          color: HexColor.fromHex("#7D23E0"),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Better yourself each day everyday',
                  style: TextStyle(
                      color: HexColor.fromHex("#484848"),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.2),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class OnlineOrOfflineToggleButtons extends StatefulWidget {
  const OnlineOrOfflineToggleButtons({super.key});

  @override
  State<OnlineOrOfflineToggleButtons> createState() =>
      _OnlineOrOfflineToggleButtonsState();
}

class _OnlineOrOfflineToggleButtonsState
    extends State<OnlineOrOfflineToggleButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlutterToggleButton(
          buttonHeight: 40,
          outerContainerColor: HexColor.fromHex("#F8F8F8"),
          borderRadius: 28,
          buttonWidth: MediaQuery.of(context).size.width / 2 - 20,
          buttonColor: HexColor.fromHex("#2E3139"),
          buttonTextFontSize: 14,
          items: const ['Online', 'Offline'],
          onTap: (index) {
            print('Selected index: $index');
          },
        ),
      ],
    );
  }
}

class ReferAndEarnCard extends StatelessWidget {
  const ReferAndEarnCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.centerRight, children: [
      Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: HexColor.fromHex('#FFEDED'),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Refer & Earn\n',
                style: TextStyle(
                    color: HexColor.fromHex('#4C4C4C'),
                    fontSize: 14,
                    height: 1.4,
                    fontWeight: FontWeight.w500),
                children: [
                  TextSpan(
                    text: 'Cashback & Rewards',
                    style: TextStyle(
                      color: HexColor.fromHex("#0C0C0C"),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Invite Your Friends & Get Up to\n₹500 After Registration',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 1.8,
                    color: HexColor.fromHex("#44464C"))),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width / 3,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: HexColor.fromHex("#272A34"),
                  borderRadius: BorderRadius.circular(6)),
              child: Center(
                child: Text(
                  'Invite',
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
        padding: const EdgeInsets.only(bottom: 10, right: 20),
        child: getAssetImage("refer.png", height: 160),
      ),
    ]);
  }
}

class CardWithBottomTitle extends StatelessWidget {
  final String assetName;
  final String title;
  const CardWithBottomTitle(
      {super.key, required this.assetName, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Card(
        elevation: 0,
        color: Colors.white,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(
                  height: 75,
                  width: 70,
                  child: getAssetImage(assetName, fit: BoxFit.cover)),
              Text(
                title,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    height: 1.6,
                    color: HexColor.fromHex("#555555")),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;
  int _notificationCount = 1;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home, color: Colors.grey),
          activeIcon: Container(
            decoration: BoxDecoration(
              color: HexColor.fromHex("#F6EDFF"),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(Icons.home, color: HexColor.fromHex("#7D23E0")),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.school, color: Colors.grey),
          activeIcon: Container(
            decoration: BoxDecoration(
              color: HexColor.fromHex("#F6EDFF"),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(Icons.school, color: HexColor.fromHex("#7D23E0")),
          ),
          label: 'Batches',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              const Icon(FontAwesomeIcons.message, color: Colors.grey),
              Positioned(
                right: -5,
                top: -7,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: HexColor.fromHex("#7D23E0"),
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: Text(
                    _notificationCount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          activeIcon: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: HexColor.fromHex("#F6EDFF"),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: Icon(FontAwesomeIcons.message,
                    color: HexColor.fromHex("#7D23E0")),
              ),
              Positioned(
                right: -1,
                top: -7,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: HexColor.fromHex("#7D23E0"),
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person_outline, color: Colors.grey),
          activeIcon: Container(
            decoration: BoxDecoration(
              color: HexColor.fromHex("#F6EDFF"),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(Icons.person, color: Colors.purple),
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: HexColor.fromHex("#7D23E0"),
      unselectedItemColor: Colors.grey,
      onTap: (index) {},
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(fontSize: 13),
    );
  }
}

class CoursesJoinNowButton extends StatelessWidget {
  final String buttonText;
  const CoursesJoinNowButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: HexColor.fromHex("#7774D5"),
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
    );
  }
}

class AllCoursesCardWithContent extends StatelessWidget {
  final bool? isPopularCard;
  const AllCoursesCardWithContent({super.key, this.isPopularCard});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9 - 20,
      padding: const EdgeInsets.only(top: 20, left: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          // Adds a blue border
        ),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text("Mr. Sampath",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: HexColor.fromHex("#4C4452"))),
                  const SizedBox(width: 5),
                  const Icon(Icons.verified, color: Colors.green, size: 16),
                ],
              ),
              const SizedBox(height: 10),
              getAssetImage("course.png"),
              const SizedBox(height: 10),
              Text(
                isPopularCard == true
                    ? "Class 10th - Mathematics"
                    : "ARAMBH - NEET DROPPER BATCH",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: HexColor.fromHex("#2A2E3B")),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              isPopularCard == true
                  ? Container()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "🖥 Full Syllabus",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: HexColor.fromHex("#6F6675")),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "⏺ Live + Recorded",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: HexColor.fromHex("#6F6675")),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "👩‍🎓 For NEET 2025 & 2026 Aspirant",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: HexColor.fromHex("#6F6675")),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "📅 Batch starts on 16th Aug",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: HexColor.fromHex("#6F6675")),
                            )
                          ],
                        )
                      ],
                    ),
              SizedBox(
                height: isPopularCard == true ? 0 : 10,
              ),
              isPopularCard == true
                  ? Container()
                  : Row(
                      children: [
                        AlternateRichText(
                            textOne: '₹ 5000 ',
                            textTwo: '₹ 10000 ',
                            styleOne: TextStyle(
                                color: HexColor.fromHex("#000000"),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            styleTwo: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: HexColor.fromHex("#525251"),
                                fontWeight: FontWeight.w400,
                                fontSize: 12)),
                        Text(
                          "50%OFF",
                          style: TextStyle(
                            color: HexColor.fromHex("#EB5757"),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
              const SizedBox(
                height: 20,
              ),
              const CoursesJoinNowButton(
                buttonText: 'Join',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardOfToppers extends StatelessWidget {
  const CardOfToppers({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9 - 20,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 0, bottom: 20),
        child: Card(
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),

            side: BorderSide(
                color: HexColor.fromHex("#FFF2E2"),
                width: 2), // Adds a blue border
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NEET Toppers of Rajbir Institute',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: HexColor.fromHex("#0C0C0C"),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTopperCard(
                      'topper3.png',
                    ),
                    _buildTopperCard(
                      'topper2.png',
                    ),
                    _buildTopperCard(
                      'topper4.png',
                    ),
                    _buildTopperCard(
                      'topper1.png',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopperCard(
    String imagePath,
  ) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          width: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: getAssetImage(
              imagePath,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Shree',
          style: TextStyle(fontSize: 10, color: HexColor.fromHex("#363636")),
        ),
        const SizedBox(height: 4),
        Text(
          '720/720',
          style: TextStyle(
              color: HexColor.fromHex("#029C42"),
              fontWeight: FontWeight.bold,
              fontSize: 10),
        ),
      ],
    );
  }
}
