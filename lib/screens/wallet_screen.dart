import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_with_flutter/screens/disposable.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  Map walletData = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    walletData = walletData.isNotEmpty ? walletData : Get.arguments;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white70,
                width: w,
                height: h * 0.1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                    ),
                    const Text(
                      'Mobile Wallet',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Nunito',
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 8.0),
                    )
                  ],
                ),
              ),
              SizedBox(
                // color: Colors.grey,
                width: w,
                height: h * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'TOTAL AMOUNT',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Nunito',
                          ),
                        ),
                        Text(
                          '\$${walletData['balance']}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 36.0,
                            fontFamily: 'Nunito',
                          ),
                        ),
                        Text(
                          '^ +\$${walletData['random']}(2.42%)',
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 18.0,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15.0),
                          // color: Colors.,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          child: const Text(
                            '1h',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(15.0),
                          // color: Colors.,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          child: const Text(
                            '24h',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(15.0),
                          // color: Colors.,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            color: Colors.blue.withOpacity(0.5),
                          ),
                          child: const Text(
                            '7d',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(15.0),
                          // color: Colors.,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          child: const Text(
                            '30d',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(15.0),
                          // color: Colors.,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          child: const Text(
                            '1y',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(15.0),
                          // color: Colors.,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          child: const Text(
                            'All',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                // color: Colors.green,
                width: w,
                height: h * 0.35,
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    SizedBox(
                      // color: Colors.blueAccent.withOpacity(0.5),
                      height: h * 0.25,
                      width: w,
                      child: const Center(
                        child: LineChartSample2(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: w * 0.40,
                          height: 60.0,
                          margin: const EdgeInsets.only(top: 10.0),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue.withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                            ),
                            child: Text(
                              'BUY',
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Nunito',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: w * 0.40,
                          height: 60.0,
                          margin: const EdgeInsets.only(top: 10.0),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue.withOpacity(1.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                            ),
                            child: const Text(
                              'SELL',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Nunito',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                // color: Colors.green,
                width: w,
                height: h * 0.24,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Activity',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Nunito',
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white70,
                            width: w,
                            height: h * 0.09,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black.withOpacity(0.3)),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: CircleAvatar(
                                    radius: 10.0,
                                    backgroundColor: Colors.white,
                                    child: Image.asset('assets/icons/down.png'),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Received',
                                      style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Nunito',
                                      ),
                                    ),
                                    Text(
                                      'December 20, 2021',
                                      style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Nunito',
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(child: Container()),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '+0.01 ETH',
                                      style: TextStyle(
                                        color: Colors.green[500],
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Nunito',
                                      ),
                                    ),
                                    Text(
                                      '^ 1.68%',
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Nunito',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white70,
                            width: w,
                            height: h * 0.09,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black.withOpacity(0.3)),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: CircleAvatar(
                                    radius: 10.0,
                                    backgroundColor: Colors.white,
                                    child: Image.asset('assets/icons/up.png'),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Send',
                                      style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Nunito',
                                      ),
                                    ),
                                    Text(
                                      'December 21, 2021',
                                      style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Nunito',
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(child: Container()),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '-0.008 ETH',
                                      style: TextStyle(
                                        color: Colors.red[500],
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Nunito',
                                      ),
                                    ),
                                    Text(
                                      '^ 1.68%',
                                      style: TextStyle(
                                        color: Colors.red[500],
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Nunito',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
