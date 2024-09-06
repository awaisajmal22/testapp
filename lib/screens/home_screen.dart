import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:text/model/exchange_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool _isShowDrawer = false;

  late AnimationController _controller;
  late AnimationController _controller2;
  late AnimationController _controller3;
  late AnimationController _controller1;

  late Animation<Offset> _animation;
  late Animation<Offset> _animation2;
  late Animation<Offset> _animation3;
  late Animation<Offset> _animation1;
  int onHoverCurrency = -1;
  String selectedCuurency = 'Euro';
  bool _sellingOnHover = false;
  bool _buyingOnHove = false;
  List<ExchangeModel> exchangeList = [
    ExchangeModel(
        countryCode: 'IN',
        buyingRate: 'Rs 3.5284',
        name: 'INR',
        sellingRate: 'Rs 3.6462'),
    ExchangeModel(
        countryCode: 'DE',
        buyingRate: '€ 326.09',
        name: 'Euro',
        sellingRate: '€ 	336.64'),
    ExchangeModel(
        countryCode: 'US',
        buyingRate: '\$ 300.0',
        name: 'USD',
        sellingRate: '\$ 298.7'),
    ExchangeModel(
        countryCode: 'JP',
        buyingRate: '¥ 2.073',
        name: 'YEN',
        sellingRate: '¥ 3.0'),
    ExchangeModel(
        countryCode: 'GB',
        buyingRate: '£ 384.5',
        name: 'POUND',
        sellingRate: 'Rs 399.6')
  ];
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: Offset(-5.0, 0.0), // Slide from the left (-1.0, 0.0)
      end: Offset(0.0, 0.0), // To its final position (0.0, 0.0)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller2 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation2 = Tween<Offset>(
      begin: Offset(-5.0, 0.0), // Slide from the left (-1.0, 0.0)
      end: Offset(0.0, 0.0), // To its final position (0.0, 0.0)
    ).animate(CurvedAnimation(
      parent: _controller2,
      curve: Curves.easeInOut,
    ));
    _controller3 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation3 = Tween<Offset>(
      begin: Offset(-1.0, 0.0), // Slide from the left (-1.0, 0.0)
      end: Offset(0.0, 0.0), // To its final position (0.0, 0.0)
    ).animate(CurvedAnimation(
      parent: _controller3,
      curve: Curves.easeInOut,
    ));
    _controller1 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation1 = Tween<Offset>(
      begin: Offset(-1.0, 0.0), // Slide from the left (-1.0, 0.0)
      end: Offset(0.0, 0.0), // To its final position (0.0, 0.0)
    ).animate(CurvedAnimation(
      parent: _controller1,
      curve: Curves.easeInOut,
    ));
    _controller1.forward();
    _controller.forward();
    _controller2.forward();
    _controller3.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/61769.jpg'),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              setState(() {
                _isShowDrawer = !_isShowDrawer;
              });
              if (_isShowDrawer == true) {
                _controller.forward();
                _controller3.forward();
                _controller2.forward();
              } else {
                _controller.reverse();
                _controller3.reverse();
                _controller2.reset();
              }
            },
            child: Icon(Icons.list),
          ),
        ),
        body: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  height: MediaQuery.of(context).size.height * 0.395,
                  width: _isShowDrawer == false
                      ? 0
                      : MediaQuery.of(context).size.width * 0.1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(exchangeList.length, (index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10, bottom: 10),
                        child: SlideTransition(
                            position: _animation,
                            child: FittedBox(
                              child: TextButton(
                                  onHover: (val) {
                                    if (val == true) {
                                      setState(() {
                                        onHoverCurrency = index;
                                      });
                                    } else {
                                      setState(() {
                                        onHoverCurrency = -1;
                                      });
                                    }
                                  },
                                  onPressed: () {
                                    setState(() {
                                      selectedCuurency = exchangeList[index].name;
                                    });
                                  },
                                  child: Text(
                                    exchangeList[index].name,
                                    style: TextStyle(
                                        color: onHoverCurrency == index
                                            ? Colors.blue
                                            : Colors.black),
                                  )),
                            )),
                      );
                    }),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SlideTransition(
                        position: _animation1,
                        child: Table(
                          border: TableBorder.all(),
                          children: [
                            TableRow(children: [
                              TableCell(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text('Exchange')),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text('Buying Rate')),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text('Selling Rate')),
                              )),
                            ]),
                          ],
                        ),
                      ),
                      SlideTransition(
                        position: _animation1,
                        child: Table(
                          border: TableBorder.all(),
                          children: List.generate(exchangeList.length, (index) {
                            return TableRow(children: [
                              TableCell(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(child: Text(exchangeList[index].name)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    _buildCountryFlag(
                                        exchangeList[index].countryCode),
                                  ],
                                ),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(exchangeList[index].buyingRate)),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(exchangeList[index].sellingRate)),
                              )),
                            ]);
                          }),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            if (_isShowDrawer)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SlideTransition(
                      position: _animation2,
                      child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Text(selectedCuurency)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SlideTransition(
                      position: _animation3,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 60,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onHover: (val) {
                                      if (val == true) {
                                        setState(() {
                                          _sellingOnHover = true;
                                        });
                                      } else {
                                        setState(() {
                                          _sellingOnHover = false;
                                        });
                                      }
                                    },
                                    onTap: () {},
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: _sellingOnHover == true
                                              ? Colors.red.withOpacity(0.3)
                                              : Colors.white,
                                          border: Border.all(
                                              color: _sellingOnHover == true
                                                  ? Colors.red
                                                  : Colors.black),
                                        ),
                                        padding: EdgeInsets.all(8),
                                        alignment: Alignment.center,
                                        child: Text('Selling Rate')),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder()),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onHover: (val) {
                                  if (val == true) {
                                    setState(() {
                                      _buyingOnHove = true;
                                    });
                                  } else {
                                    setState(() {
                                      _buyingOnHove = false;
                                    });
                                  }
                                },
                                onTap: () {},
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: _buyingOnHove == true
                                          ? Colors.red.withOpacity(0.3)
                                          : Colors.white,
                                      border: Border.all(
                                          color: _buyingOnHove == true
                                              ? Colors.red
                                              : Colors.black),
                                    ),
                                    padding: EdgeInsets.all(8),
                                    alignment: Alignment.center,
                                    child: Text('Buying Rate')),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _buildCountryFlag(String countryCode) => _FlagItem(
        flag: CountryFlag.fromCountryCode(
          countryCode,
          width: 30,
          height: 40,
        ),
        countryCode: countryCode,
      );
}

class _FlagItem extends StatelessWidget {
  const _FlagItem({
    required this.flag,
    required this.countryCode,
  });

  final CountryFlag flag;
  final String countryCode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 30, width: 40, child: flag);
  }
}
