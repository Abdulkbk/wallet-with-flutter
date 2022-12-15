import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_with_flutter/services/populate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;
  final CarouselController _controller = CarouselController();

  List cards = [];
  List coins = [];
  List<Widget> text = [const Text('1'), const Text('2'), const Text('3')];

  Future setUp() async {
    List cardData = await Populate.loadCards();

    dynamic coinsData = await Populate.loadCoins();

    // print(cardData);
    // print(coinsData);
    // List<Widget> t = cardData.isNotEmpty ? cardData.map((card) => );

    setState(() {
      cards = cardData;
      coins = coinsData;
    });
  }

  @override
  void initState() {
    super.initState();
    setUp();
  }

  @override
  Widget build(BuildContext context) {
    // print(cards);
    // print(coins);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notification',
        ),
      ]),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: h * 0.01,
            ),
            Container(
              // color: Colors.green,
              height: h * 0.1,
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Abdullahi',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: const Image(
                          image: AssetImage('assets/img/profile.jpg'),
                          width: 70.0,
                          height: 70.0,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            CarouselSlider(
                items: cards
                    .map((card) => GestureDetector(
                          onTap: () => Get.toNamed('/wallet'),
                          child: Container(
                            // margin: const EdgeInsets.symmetric(horizontal: 10.0),
                            width: w,
                            height: h * 0.25,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 1.0),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0),
                              ],
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/img/card-bg.jpg'),
                                      fit: BoxFit.cover),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'EST. Asset Value',
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.5),
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      card['cardNo'],
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: '\$${card['balance']} ',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                            text: 'USD',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.bold))
                                      ]),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                    autoPlay: false,
                    reverse: false,
                    enlargeCenterPage: true,
                    // aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(
                        () {
                          current = index;
                        },
                      );
                    })),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: text.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[700]
                          ?.withOpacity(current == entry.key ? 0.9 : 0.4),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              // color: Colors.green,
              height: h * 0.1,
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Coins',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'See All  >',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              // color: Colors.green,
              margin: const EdgeInsets.symmetric(horizontal: 25.0),
              width: w,
              child: Column(
                children: [
                  SizedBox(
                    // color: Colors.grey,
                    height: h * 0.1,
                    width: w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                              'assets/icons/${coins.isNotEmpty ? coins[0]['icon'] : 'ethereum.png'}'),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${coins.isNotEmpty ? coins[0]['name'] : 'Bit'}',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '${coins.isNotEmpty ? coins[0]['balance'] : ''} BTC',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
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
                              '\$${coins.isNotEmpty ? coins[0]['market'] : ''}',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 26.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '^ ${coins.isNotEmpty ? coins[0]['value'] : '0.0'}%',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    // color: Colors.grey,
                    height: h * 0.1,
                    width: w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.white,
                          child: Image.asset('assets/icons/ethereum.png'),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Bitcoin',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '0.5 BTC',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
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
                              '\$820.00',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 26.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '^ 1.68%',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    // color: Colors.grey,
                    height: h * 0.1,
                    width: w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.white,
                          child: Image.asset('assets/icons/bitcoin.png'),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Bitcoin',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '0.5 BTC',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
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
                              '\$70.00',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 26.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '^ 1.68%',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
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
    );
  }
}
