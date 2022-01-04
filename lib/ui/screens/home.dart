import 'package:delisol/controllers/auth_controller.dart';
import 'package:delisol/ui/theme/app_colors.dart';
import 'package:delisol/ui/widgets/read_only_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer(
            builder: (context, ref, _) {
              return IconButton(
                onPressed: () {
                  ref.read(AuthController.provider.notifier).logoutUser();
                },
                icon: Icon(Icons.logout_outlined),
                color: Colors.black,
              );
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 26),
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[300],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Current Task',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(height: 14),
                          Consumer(builder: (context, ref, _) {
                            return ReadOnlyTextField(
                              value: '${ref.read(AuthController.provider)!.firstName} ${ref.read(AuthController.provider)!.lastName}',
                              hint: 'Name',
                              isName: true,
                            );
                          }),
                          SizedBox(height: 14),
                          Consumer(builder: (context, ref, _) {
                            return ReadOnlyTextField(
                              value: 'ABC chowkdi',
                              isMap: true,
                              isName: false,
                              callback: () {
                                launchMap(
                                  lat: ref.read(AuthController.provider)?.location?.latitude ?? 0.0,
                                  long: ref.read(AuthController.provider)?.location?.longitude ?? 0.0,
                                );
                              },
                              hint: 'Address',
                            );
                          }),
                          SizedBox(height: 14),
                          Consumer(builder: (context, ref, _) {
                            return ReadOnlyTextField(
                              isMap: false,
                              isName: false,
                              value: ref.read(AuthController.provider)!.phoneNumber,
                              hint: 'Mobile No',
                              callback: () {
                                String number = ref.read(AuthController.provider)!.phoneNumber;
                                launch('tel://+91 $number}');
                              },
                            );
                          }),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'From: Krishna Ojha Ojha Bhavan, Old Civil Line, Bikaner',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Status',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 26),
                    Text(
                      'Upcoming Task',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.all(16),
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[200],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tilak Nagar, Bikaner',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Icon(Icons.arrow_downward),
                                Text(
                                  'MP Colony, Bikaner',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    'Start',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  launchMap({required double lat, required double long}) async {
    launch('https://www.google.com/maps/@$long,$lat,14z');
  }
}
