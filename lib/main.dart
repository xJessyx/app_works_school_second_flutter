import 'package:app_works_school_second_flutter/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:dio/dio.dart';

final logger = Logger('myapp');
final dio = Dio();

void main() {
  Logger.root.level = Level.FINEST;
  logger.onRecord.listen((record) {
    // ignore: avoid_print
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

  fetchAllPages() {}
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//list
_menChildBuilderDelegate(List<Product> menProducts) {
  return SliverChildBuilderDelegate(
    (context, index) {
      final menProduct = menProducts[index];
      return GestureDetector(
        onTap: () {
          // 在這裡添加點擊事件的處理邏輯
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailPage(itemId: menProduct.id.toString())),
          );
        },
        child: Container(
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(
                  width: 1, color: const Color.fromARGB(255, 49, 49, 49)),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                  ),
                  child: Image.network(
                    menProduct.mainImage,
                    fit: BoxFit.contain,
                  ),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                          child: Text(
                            menProduct.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                        child: Text(
                          'NT: ${menProduct.price}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ])
              ],
            )),
      );
    },
    childCount: menProducts.length,
  );
}

_accessoryChildBuilderDelegate(List<Product> accessoryProducts) {
  return SliverChildBuilderDelegate(
    (context, index) {
      final accessoryProduct = accessoryProducts[index];
      return GestureDetector(
        onTap: () {
          // 在這裡添加點擊事件的處理邏輯
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailPage(itemId: accessoryProduct.id.toString())),
          );
        },
        child: Container(
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(
                  width: 1, color: const Color.fromARGB(255, 49, 49, 49)),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                  ),
                  child: Image.network(
                    accessoryProduct.mainImage,
                    fit: BoxFit.contain,
                  ),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                          child: Text(
                            accessoryProduct.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                        child: Text(
                          'NT: ${accessoryProduct.price}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ])
              ],
            )),
      );
    },
    childCount: accessoryProducts.length,
  );
}

_womenChildBuilderDelegate(List<Product> womenProducts) {
  return SliverChildBuilderDelegate(
    (context, index) {
      final womenProduct = womenProducts[index];
      return GestureDetector(
        onTap: () {
          // 在這裡添加點擊事件的處理邏輯
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailPage(itemId: womenProduct.id.toString())),
          );
        },
        child: Container(
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(
                  width: 1, color: const Color.fromARGB(255, 49, 49, 49)),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                  ),
                  child: Image.network(
                    womenProduct.mainImage,
                    fit: BoxFit.contain,
                  ),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                          child: Text(
                            womenProduct.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                        child: Text(
                          'NT: ${womenProduct.price}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ])
              ],
            )),
      );
    },
    childCount: womenProducts.length,
  );
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product> _menProducts = [];
  List<Product> _womenProducts = [];
  List<Product> _accessoryProducts = [];

  @override
  void initState() {
    super.initState();
    _fetchAllPages();
  }

  Future<void> _fetchAllPages() async {
    List<dynamic> results = [];

    Dio dio = Dio();
    int page = 0;
    bool isLastPage = false;
    while (!isLastPage) {
      final response = await dio.get(
          'https://api.appworks-school.tw/api/1.0/products/all?paging=$page');
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data['data'];
        results.addAll(jsonList);
        isLastPage = response.data['next_paging'] == null;
        page++;
      } else {
        throw Exception('Failed to load products');
      }
    }
    setState(() {
      _parseData(results);
    });
  }

  void _parseData(List results) {
    try {
      final List<Product> products =
          results.map((json) => Product.fromJson(json)).toList();
      _menProducts =
          products.where((product) => product.category == 'men').toList();
      _womenProducts =
          products.where((product) => product.category == 'women').toList();
      _accessoryProducts = products
          .where((product) => product.category == 'accessories')
          .toList();

      for (final product in _menProducts) {
        logger.fine('menProductItem ${product.title}');
      }

      for (final product in _womenProducts) {
        logger.fine('womenProducts ${product.title}');
      }
    } catch (e) {
      logger.warning('Failed to get API data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Image.asset(
          'assets/Logo.png',
          fit: BoxFit.cover,
          height: 40,
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
            child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 300,
                width: 400,
                child: ListView.builder(
                    itemExtent: 400,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.all(10.0),
                        decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://media.istockphoto.com/id/508030340/photo/sunny-cat.jpg?b=1&s=170667a&w=0&k=20&c=x_mXmdfK8XaNheHKbD5kzCu_gqXJzNBiX8UjE2Q6OHw=')))),
                    itemCount: 20),
              ),
            ),
          ],
        )),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              flex: 1,
              child: SizedBox(
                  height: 400,
                  width: 100,
                  child: CustomScrollView(slivers: [
                    const SliverAppBar(
                      backgroundColor: Colors.transparent,
                      centerTitle: true,
                      title: Text("男裝",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          )),
                    ),
                    SliverFixedExtentList(
                      delegate: _menChildBuilderDelegate(_menProducts),
                      itemExtent: 100,
                    ),
                  ]))),
          Expanded(
              flex: 1,
              child: SizedBox(
                  height: 400,
                  width: 100,
                  child: CustomScrollView(slivers: [
                    const SliverAppBar(
                      backgroundColor: Colors.transparent,
                      centerTitle: true,
                      title: Text("女裝",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          )),
                    ),
                    SliverFixedExtentList(
                      delegate: _womenChildBuilderDelegate(_womenProducts),
                      itemExtent: 100,
                    ),
                  ]))),
          Expanded(
              flex: 1,
              child: SizedBox(
                  height: 400,
                  width: 100,
                  child: CustomScrollView(
                    slivers: [
                      const SliverAppBar(
                        backgroundColor: Colors.transparent,
                        centerTitle: true,
                        title: Text("配件",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            )),
                      ),
                      SliverFixedExtentList(
                        delegate:
                            _accessoryChildBuilderDelegate(_accessoryProducts),
                        itemExtent: 100,
                      ),
                    ],
                  ))),
        ]),
      ]),
    );
  }
}

class DetailPage extends StatefulWidget {
  final String itemId;

  const DetailPage({Key? key, required this.itemId}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _counter = 0;
  // ignore: unused_field
  int _selectSizeIndex = -1;
  // ignore: unused_field
  int _selectColorIndex = -1;

  late Future<Product> _productFuture;
  @override
  void initState() {
    super.initState();
    _productFuture = _getDetailPages();
    selectedColorList = List.filled(5, false);
  }

  Future<Product> _getDetailPages() async {
    final itemId = widget.itemId.toString();
    Dio dio = Dio();
    logger.fine('itemId $itemId');

    try {
      final response = await dio.get(
          'https://api.appworks-school.tw/api/1.0/products/details?id=$itemId');
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonList = response.data['data'];
        final Product product = Product.fromJson(jsonList);
        return product;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to get API data: $e');
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  int selectedButtonIndex = -1;
  List<bool> selectedColorList = [];
  int selectedColorIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Image.asset(
          'assets/Logo.png',
          fit: BoxFit.cover,
          height: 40,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<Product>(
          future: _productFuture,
          builder: (BuildContext context, AsyncSnapshot<Product> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text('No data'),
              );
            } else {
              final result = snapshot.data;

              logger.fine("result!.title = ${result!.title}");
              logger.fine('snapshot.data= ${snapshot.data}');

              return ListView(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.fromLTRB(300, 20, 300, 20), // 設定最外層的間距
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Row(children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            child: Image.network(
                              result.mainImage,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                color: Colors.transparent,
                                child: Text(result.title,
                                    style: const TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2.0, // 設置字元間距
                                    )),
                              ),
                              Container(
                                color: Colors.transparent,
                                child: Text(snapshot.data!.id.toString(),
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                    )),
                              ),
                              Container(
                                color: Colors.transparent,
                                child: Text('NT: ${result.price}',
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              const Divider(
                                color: Colors.grey,
                                thickness: 2,
                                indent: 20,
                                endIndent: 20,
                              ),
                              Material(
                                color: Colors.transparent,
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10.0, height: 40.0),
                                    Container(
                                      color: Colors.transparent,
                                      child: const Text('顏色',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 20.0,
                                      height: 25.0,
                                      child: VerticalDivider(
                                        color: Colors.grey,
                                        thickness: 1.5,
                                      ),
                                    ),
                                    const SizedBox(width: 10.0, height: 40.0),
                                    Wrap(
                                      spacing: 8.0,
                                      runSpacing: 8.0,
                                      children: result.colors
                                          .asMap()
                                          .map((index, value) => MapEntry(
                                              index,
                                              ChoiceChip(
                                                label: const Text(''),
                                                selected:
                                                    selectedColorIndex == index,
                                                onSelected: (selected) {
                                                  setState(() {
                                                    selectedColorIndex =
                                                        selected ? index : -1;

                                                    _selectColorIndex =
                                                        selectedColorIndex;
                                                  });
                                                },
                                                backgroundColor: Color(
                                                    int.parse(value.code,
                                                            radix: 16) +
                                                        0xFF000000),
                                                shape: RoundedRectangleBorder(
                                                  side: selectedColorIndex ==
                                                          index
                                                      ? const BorderSide(
                                                          color: Color.fromARGB(
                                                              255, 88, 21, 43),
                                                          width: 1)
                                                      : const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 0),
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                ),
                                                labelPadding: EdgeInsets.zero,
                                                padding: EdgeInsets.zero,
                                                avatar: Container(
                                                  width: 24,
                                                  height: 24,
                                                  color: Color(int.parse(
                                                          value.code,
                                                          radix: 16) +
                                                      0xFF000000),
                                                ),
                                              )))
                                          .values
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 10.0, height: 40.0),
                                  Container(
                                    color: Colors.transparent,
                                    child: const Text('尺寸',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                    height: 25.0,
                                    child: VerticalDivider(
                                      color: Colors.grey,
                                      thickness: 1.5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    child: Wrap(
                                      spacing: 10.0,
                                      runSpacing: 10.0,
                                      children: List.generate(
                                        result.sizes.length,
                                        (index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                _selectSizeIndex = index;
                                                selectedButtonIndex = index;
                                              });
                                            },
                                            child: Container(
                                              width: 35,
                                              height: 28,
                                              decoration: BoxDecoration(
                                                color:
                                                    selectedButtonIndex == index
                                                        ? const Color.fromARGB(
                                                            255, 180, 180, 177)
                                                        : const Color.fromARGB(
                                                            255, 97, 95, 95),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  result.sizes[index],
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text('數量',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                    height: 25.0,
                                    child: VerticalDivider(
                                      color: Colors.grey,
                                      thickness: 1.5,
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 40),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                _decreaseCounter();
                                              },
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          360),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    '-',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              color: Colors.transparent,
                                              child: Text('$_counter',
                                                  style: const TextStyle(
                                                    fontSize: 18.0,
                                                  )),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                _incrementCounter();
                                              },
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          360),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    '+',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                              Row(children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16.0),
                                          backgroundColor: const Color.fromARGB(
                                              255, 28, 28, 28),
                                        ),
                                        onPressed: () {
                                          String dialogText = "";
                                          // ignore: unnecessary_null_comparison
                                          if (_counter > 0 &&
                                              // ignore: unnecessary_null_comparison
                                              _selectColorIndex != -1 &&
                                              // ignore: unnecessary_null_comparison
                                              _selectSizeIndex != -1) {
                                            dialogText = '已加入購物車';
                                          } else if (_selectColorIndex == -1 &&
                                              _selectSizeIndex == -1 &&
                                              _counter == 0) {
                                            dialogText = '請點選規格';
                                          } else if (_selectColorIndex == -1) {
                                            dialogText = '請選擇顏色';
                                          } else if (_selectSizeIndex == -1) {
                                            dialogText = '請選擇尺寸';
                                          } else if (_counter == 0) {
                                            dialogText = '數量不得為０';
                                          }
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(dialogText),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: const Text('確定'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: const Text('加入購物車',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            )),
                                      )),
                                ),
                              ]),
                              Flexible(
                                  fit: FlexFit.loose,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Wrap(
                                      alignment: WrapAlignment.start,
                                      children: [
                                        Text(result.description),
                                        Text(result.texture),
                                        Text(result.wash),
                                        Text(result.place),
                                        Text(result.note),
                                        Text(result.story),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ]),
                      Row(children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              color: Colors.transparent,
                              child: const Text('細部説明',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                        ),
                        const Divider(
                          height: 10,
                          color: Color.fromARGB(255, 57, 56, 56),
                          thickness: 2,
                        ),
                      ]),
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: result.images.map((imageUrl) {
                          return Image.network(
                            imageUrl,
                            fit: BoxFit.contain,
                          );
                        }).toList(),
                      )
                    ]),
                  )
                ],
              );
            }
          }),
    );
  }
}
