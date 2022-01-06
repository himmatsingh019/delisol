import 'dart:async';

import 'package:delisol/controllers/auth_controller.dart';
import 'package:delisol/ui/theme/app_colors.dart';
import 'package:delisol/ui/widgets/read_only_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const String route = '/home';

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      Duration(minutes: 15),
      (timer) {
        ref.read(AuthController.provider.notifier).addCoordinates();
      },
    );
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

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
                child: Consumer(builder: (context, ref, _) {
                  if (ref.read(DeliveryController.provider.notifier).isError == true)
                    return Center(
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              ref.read(DeliveryController.provider.notifier).getDeliveryDetails();
                            },
                            icon: Icon(Icons.replay_outlined),
                          ),
                          SizedBox(height: 10),
                          Text('Please click here to refresh')
                        ],
                      ),
                    );
                  return Column(
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
                            Consumer(
                              builder: (context, ref, _) {
                                return ReadOnlyTextField(
                                  value: ref.read(DeliveryController.provider)[0].name,
                                  hint: 'Name',
                                  isName: true,
                                );
                              },
                            ),
                            SizedBox(height: 14),
                            Consumer(
                              builder: (context, ref, _) {
                                return ReadOnlyTextField(
                                  value: ref.read(DeliveryController.provider)[0].address,
                                  isMap: true,
                                  isName: false,
                                  callback: () {
                                    launchMap(
                                      lat: ref.read(DeliveryController.provider)[0].startLatitude.toString(),
                                      long: ref.read(DeliveryController.provider)[0].startLongitude.toString(),
                                    );
                                  },
                                  hint: 'Address',
                                );
                              },
                            ),
                            SizedBox(height: 14),
                            Consumer(
                              builder: (context, ref, _) {
                                return ReadOnlyTextField(
                                  isMap: false,
                                  isName: false,
                                  value: ref.read(DeliveryController.provider)[0].mobileNumber,
                                  hint: 'Mobile No',
                                  callback: () {
                                    String number = ref.read(DeliveryController.provider)[0].mobileNumber;
                                    launch('tel://+91 $number}');
                                  },
                                );
                              },
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Consumer(
                                  builder: (context, ref, _) {
                                    return Expanded(
                                      flex: 2,
                                      child: Text(
                                        'From: ${ref.read(DeliveryController.provider)[0].fromName}, ${ref.read(DeliveryController.provider)[0].fromAddress}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  flex: 1,
                                  child: Consumer(builder: (context, ref, _) {
                                    return GestureDetector(
                                      onTap: () {
                                        ref.read(AuthController.provider.notifier).sendNotification();
                                      },
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
                                    );
                                  }),
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
                        child: Consumer(builder: (context, ref, _) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ref.read(DeliveryController.provider)[1].fromAddress,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Icon(Icons.arrow_downward),
                                    Text(
                                      ref.read(DeliveryController.provider)[1].address,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Consumer(builder: (context, ref, _) {
                                  return GestureDetector(
                                    onTap: () {
                                      ref.read(AuthController.provider.notifier).sendNotification();
                                    },
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
                                  );
                                }),
                              ),
                            ],
                          );
                        }),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  launchMap({required String lat, required String long}) async {
    launch('https://www.google.com/maps/@$long,$lat,14z');
  }
}
