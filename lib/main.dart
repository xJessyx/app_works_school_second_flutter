import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
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
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//list
_catChildBuilderDelegate() {
  return SliverChildBuilderDelegate(
    (context, index) => GestureDetector(
      onTap: () {
        // 在這裡添加點擊事件的處理邏輯
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailPage()),
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
                child: Image.asset(
                  'assets/cat2.jpg',
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                        child: Text(
                          "cat",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                      child: Text(
                        'NT:100',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ])
            ],
          )),
    ),
    childCount: 20,
  );
}

_dogChildBuilderDelegate() {
  return SliverChildBuilderDelegate(
    (context, index) => Container(
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
              child: Image.asset(
                'assets/dog.jpg',
                scale: 10,
                fit: BoxFit.contain,
              ),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                      child: Text(
                        "dog",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                    child: Text(
                      'NT:200',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ])
          ],
        )),
    childCount: 20,
  );
}

_birdChildBuilderDelegate() {
  return SliverChildBuilderDelegate(
    (context, index) => Container(
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
              child: Image.asset(
                'assets/bird.jpg',
                scale: 10,
                fit: BoxFit.contain,
              ),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                      child: Text(
                        "bird",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                    child: Text(
                      'NT:1000',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ])
          ],
        )),
    childCount: 20,
  );
}

class _MyHomePageState extends State<MyHomePage> {
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
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(children: [
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
                        title: Text("貓",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            )),
                      ),
                      SliverFixedExtentList(
                        delegate: _catChildBuilderDelegate(),
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
                        title: Text("鳥",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            )),
                      ),
                      SliverFixedExtentList(
                        delegate: _birdChildBuilderDelegate(),
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
                          title: Text("狗",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                              )),
                        ),
                        SliverFixedExtentList(
                          delegate: _dogChildBuilderDelegate(),
                          itemExtent: 100,
                        ),
                      ],
                    ))),
          ]),
        ]),
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _counter = 0;
  bool _button1State = false;
  bool _button2State = false;
  bool _button3State = false;

  void _onButton1Pressed() {
    setState(() {
      _button1State = true;
      _button2State = false;
      _button3State = false;
    });
  }

  void _onButton2Pressed() {
    setState(() {
      _button1State = false;
      _button2State = true;
      _button3State = false;
    });
  }

  void _onButton3Pressed() {
    setState(() {
      _button1State = false;
      _button2State = false;
      _button3State = true;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      _counter--;
    });
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(300, 20, 300, 20), // 設定最外層的間距
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    child: Image.asset(
                      'assets/cat2.jpg',
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
                        child: const Text('短毛貓',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0, // 設置字元間距
                            )),
                      ),
                      Container(
                        color: Colors.transparent,
                        child: const Text('2000/01/01',
                            style: TextStyle(
                              fontSize: 12.0,
                            )),
                      ),
                      Container(
                        color: Colors.transparent,
                        child: const Text('NT＄ 100',
                            style: TextStyle(
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
                            InkWell(
                              highlightColor: Colors.green,
                              splashColor: Colors.greenAccent,
                              onTap: () {
                                // 點擊事件處理
                              },
                              child: Container(
                                width: 20,
                                height: 20,
                                color: Colors.green,
                              ),
                              // ),
                            ),
                            const SizedBox(width: 10.0, height: 40.0),
                            InkWell(
                              highlightColor: Colors.blue,
                              splashColor: Colors.blueAccent,
                              onTap: () {
                                // 點擊事件處理
                              },
                              child: Container(
                                width: 20,
                                height: 20,
                                color: Colors.blue,
                              ),
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
                          const SizedBox(width: 10.0, height: 40.0),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _onButton1Pressed();
                              });
                            },
                            child: Container(
                              width: 35,
                              height: 28,
                              decoration: BoxDecoration(
                                color: _button1State
                                    ? const Color.fromARGB(255, 180, 180, 177)
                                    : const Color.fromARGB(255, 97, 95, 95),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Text(
                                  'S',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10.0, height: 40.0),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _onButton2Pressed();
                              });
                            },
                            child: Container(
                              width: 35,
                              height: 28,
                              decoration: BoxDecoration(
                                color: _button2State
                                    ? const Color.fromARGB(255, 180, 180, 177)
                                    : const Color.fromARGB(255, 97, 95, 95),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Text(
                                  'M',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10.0, height: 40.0),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _onButton3Pressed();
                              });
                            },
                            child: Container(
                              width: 35,
                              height: 28,
                              decoration: BoxDecoration(
                                color: _button3State
                                    ? const Color.fromARGB(255, 180, 180, 177)
                                    : const Color.fromARGB(255, 97, 95, 95),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Text(
                                  'L',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              padding:
                                  const EdgeInsets.only(left: 20, right: 40),
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
                                              BorderRadius.circular(360),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
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
                                              BorderRadius.circular(360),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            '+',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
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
                                  backgroundColor:
                                      const Color.fromARGB(255, 28, 28, 28),
                                ),
                                onPressed: () {
                                  // 按鈕被點擊時要執行的程式碼
                                },
                                child: const Text('選擇尺寸',
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
                              children: const [
                                Text(
                                    '育種須知： 美國短毛貓最著名的特色是個性溫和、輕鬆，也是非常愛玩耍的品種。因此，牠們通常很受家庭的歡迎，特別是因為牠們與兒童的相處非常融洽。一般而言，牠們與其他貓咪和狗狗也處得不錯。'),
                                Text(
                                    '量身訂製的健康營養配方是讓美國短毛貓常保健康美麗的要角。食物提供的能量有助於維持重要的機能'),
                                Text(
                                    '而適合貓咪的完整營養配方應含有適當平衡的營養素。把握這個餵食做法就能提供不過與不及的飲食，兩者都可能對貓咪健康造成不良影響。'),
                                Text(
                                    '請隨時提供乾淨的飲水，讓牠們保持良好的排尿習慣。貓咪天生就能適應少量多餐 - 每天進食 7 到 10 次。為牠們準備一天一次建議的飼料顆粒份量，可讓貓咪自己調節進食；諷刺的是，若牠們一天只吃一、兩份飼料，牠們的體重比想吃才進食的貓咪增加更多。'),
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
              const SizedBox(height: 20),
              Image.asset(
                'assets/big_cat1.jpg',
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/big_cat2.jpg',
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/big_cat3.jpg',
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/big_cat4.jpg',
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/big_cat5.jpg',
                fit: BoxFit.contain,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
