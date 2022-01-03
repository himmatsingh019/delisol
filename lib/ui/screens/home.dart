import 'package:delisol/ui/theme/app_colors.dart';
import 'package:delisol/ui/widgets/read_only_textfield.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const String route = '/home';

  final TextEditingController nameController = TextEditingController(text: 'Suraj Boniwal');
  final TextEditingController contactController = TextEditingController(text: '9974849404');
  final TextEditingController addressController = TextEditingController(text: 'Jaldhara Chowkdi, Ankleshwar');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                          ReadOnlyTextField(
                            controller: nameController,
                            hint: 'Name',
                          ),
                          SizedBox(height: 14),
                          ReadOnlyTextField(
                            controller: contactController,
                            hint: 'Address',
                          ),
                          SizedBox(height: 14),
                          ReadOnlyTextField(
                            controller: addressController,
                            hint: 'Mobile No',
                          ),
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
}
