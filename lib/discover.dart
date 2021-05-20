import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_design/component/fadeAnimation.dart';
import 'package:ui_design/component/productCard.dart';
import 'package:ui_design/detailShoes.dart';
import 'package:ui_design/model/shoesImages.dart';
import 'package:ui_design/model/shoesModel.dart';

List setName=["Nike Air Max"];
List setPrice=[135];
List setImage=["shoes8.png"];
List setId=[2];
List setQuantity=[1];
//---------------Bottom Navigation Bar------------------------------
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  String colorName = "black";
  String selectedColorNmae = "redAccent";
  final List<Widget> _children = [
    Discover(),
    FavouritesWidget(),
    HomeLocation(),
    AddToBag(),
    Profile()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home_outlined,
                  color: _currentIndex == 0 ? Colors.redAccent : Colors.black),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline,
                  color: _currentIndex == 1 ? Colors.redAccent : Colors.black),
              label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,
                  color: _currentIndex == 2 ? Colors.redAccent : Colors.black),
              label: "Home Location"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined,
                  color: _currentIndex == 3 ? Colors.redAccent : Colors.black),
              label: "Bag"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline,
                  color: _currentIndex == 4 ? Colors.redAccent : Colors.black),
              label: "Profile"),
        ],
      ),
    );
  }
}
//------------------------------------------------------------------

//----------------------------Discover------------------------------

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  List<ShoeModel> products = ShoeModel.list;
  List<ShoesImages> productImg = ShoesImages.imgPaths;
  String name="";
  String imageName="";
  int price=0;
  int id=0;
  int quantity=0;
  @override
  void initState() {

    _loadData();
    super.initState();
  }
  _loadData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id=(prefs.getInt("Id")?? 0);
      quantity=(prefs.getInt("Qun")?? 0);
      name=(prefs.getString('Name') ?? "");
      price=(prefs.getInt('price') ?? 0);
      // priceFinal=double.parse(price.toString());
      imageName=(prefs.getString('img') ?? "");
      if(!setId.contains(id) && id !=0){
        setId.add(id);
        setName.add(name);
        setPrice.add(price);
        setImage.add(imageName);
        setQuantity.add(quantity);
      }
      prefs.remove("Name");
      prefs.remove("price");
      prefs.remove("img");
      prefs.remove("Id");
      prefs.remove("Qun");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: null,
        title: Text(
          "Discover",
          style: TextStyle(
              color: Colors.black, fontSize: ScreenUtil().setSp(50), fontWeight: FontWeight.bold),
        ),
        brightness: Brightness.light,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left:ScreenUtil().setWidth(40),top:ScreenUtil().setHeight(40),right:ScreenUtil().setWidth(40),bottom:ScreenUtil().setHeight(40)),
          child: Column(
            children: [
              Container(
                height: ScreenUtil().setHeight(80),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeAnimation(
                          1,
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                "Nike",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeAnimation(
                          1.1,
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Center(
                              child: Text(
                                "Addidas",
                                style:
                                    TextStyle(fontSize: 17, color: Colors.grey),
                              ),
                            ),
                          )),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeAnimation(
                          1.2,
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Center(
                              child: Text(
                                "Jordon",
                                style:
                                    TextStyle(fontSize: 17, color: Colors.grey),
                              ),
                            ),
                          )),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeAnimation(
                          1.3,
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Center(
                              child: Text(
                                "Puma",
                                style:
                                    TextStyle(fontSize: 17, color: Colors.grey),
                              ),
                            ),
                          )),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeAnimation(
                          1.4,
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Center(
                              child: Text(
                                "Reebok",
                                style:
                                    TextStyle(fontSize: 17, color: Colors.grey),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(35)),
              SizedBox(
                height: ScreenUtil().setHeight(650),
                //700
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      ShoeModel shoes = products[index];
                      ShoesImages images = productImg[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DetailPage(
                                  shoeModel: products[index],
                                  shoesImages: productImg[index]),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(40),
                          ),
                          child: ProductCard(
                              shoes: shoes, cardNum: index, img: images),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Row(
                children: [
                  Text(
                    'More',
                    style: TextStyle(fontSize: ScreenUtil().setSp(40), fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(480),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 30.0,
                  )
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(520),
                child: Container(
                  height: ScreenUtil().setHeight(480),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      nowTrending('shoes2', '110', 'Nike air max '),
                      nowTrending('shoes4', '120', 'Nike  max 97'),
                      nowTrending('shoes3', '120', 'Nike  force 97'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Container nowTrending(String img, String price, String name) {
  return Container(
    width: ScreenUtil().setWidth(400),
    margin: EdgeInsets.only(right: 15),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white),
    child: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            Container(
              height: ScreenUtil().setHeight(270),
              width: ScreenUtil().setWidth(500),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/$img.png'),
              )),
            ),
            Center(
              child: Text(
                '$name',
                style: TextStyle(fontSize: ScreenUtil().setSp(40)),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(5),
            ),
            Center(
              child: Text(
                '\$$price',
                style: TextStyle(fontSize: ScreenUtil().setSp(40), color: Colors.black),
              ),
            ),
          ],
        ),
        Positioned(
          top: 10,
          left: 10,
          bottom: 150,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(8),
              //   bottomRight: Radius.circular(8),
              // )
            ),
            child: RotatedBox(
                quarterTurns: 3,
                child: Center(
                    child: Text(
                  "NEW",
                  style: TextStyle(color: Colors.white, letterSpacing: 2.0),
                ))),
          ),
        )
      ],
    ),
  );
}
//-----------------------------------------------------

//-------------------Add To Bag------------------------
class AddToBag extends StatefulWidget {
  @override
  _AddToBagState createState() => _AddToBagState();
}

class _AddToBagState extends State<AddToBag> {
  List<ShoeModel> products = ShoeModel.list;
  var total=setPrice.reduce((value, element) => value+element);
  var itemTotal=setQuantity.reduce((value, element) => value+element);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
      bottomNavigationBar: CheckoutCard(),
    );
  }
  Widget CheckoutCard(){
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(60), right:  ScreenUtil().setWidth(60)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(44),
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "\$"+"$total"+".00",
                    style: TextStyle(fontSize: ScreenUtil().setSp(44), fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(40),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(40),right: ScreenUtil().setWidth(40)),
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                    width: ScreenUtil().screenWidth,
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                      onPrimary: Colors.white,
                    ),
                    onPressed:()async{
                      setState(() {
                        setName.clear();
                        setPrice.clear();
                        setImage.clear();
                      });
                      Navigator.pushReplacementNamed(context, "/");
                    },
                    child: Text("NEXT")
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget getBody() {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: ScreenUtil().setHeight(80), left: ScreenUtil().setWidth(60), right: ScreenUtil().setHeight(60), bottom: ScreenUtil().setHeight(60)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "My Bag",
                style: TextStyle(fontSize: ScreenUtil().setSp(60), fontWeight: FontWeight.w600),
              ),
              SizedBox(width: ScreenUtil().setWidth(200),),
              Text(
                "Total $itemTotal items",
                style: TextStyle(fontSize:  ScreenUtil().setSp(30), fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Divider(
          height: ScreenUtil().setHeight(0),
          thickness: 2.0,
          color: Colors.black26,
          indent: ScreenUtil().setWidth(40),
          endIndent: ScreenUtil().setWidth(40),
        ),
        SizedBox(height: ScreenUtil().setHeight(30.0),),
        Column(
          children: List.generate(setName.length, (index) {
            return Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(60), right: ScreenUtil().setWidth(60), bottom: ScreenUtil().setHeight(60)),
              child: Row(
                children: <Widget>[
                  Stack(
                    children: [
                      Container(
                        height: ScreenUtil().setHeight(200),
                        width: ScreenUtil().setWidth(180),
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 0.5,
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 1)
                            ],
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Positioned(
                        left: 0,
                        top:-20,
                        child: Container(
                          height: ScreenUtil().setHeight(300),
                          width: ScreenUtil().setWidth(200),
                          child: Image(
                            height: ScreenUtil().setHeight(340),
                            width: ScreenUtil().setWidth(200),
                            image: AssetImage("assets/${setImage[index]}"),
                            // fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(60),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        setName[index],
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(32), fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(20)),
                      Text(
                        "\$ " + "${setPrice[index]}",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(30), fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(20)),
                      Container(
                        child: Center(
                          child: Row(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10) ,
                                    color: Colors.white70,
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 1,
                                          color: Colors.black.withOpacity(0.5),
                                          blurRadius: 1)
                                    ],
                                  ),

                                  child: IconButton(
                                    icon: Icon(Icons.remove,color: Colors.black,),
                                    onPressed: (){
                                      setState(() {
                                        if(setQuantity[index] !=0){
                                          setQuantity[index]--;
                                          total=total-setPrice[index];
                                          itemTotal=itemTotal-1;
                                          if(setQuantity[index] == 0) {
                                            setImage.removeAt(index);
                                            setPrice.removeAt(index);
                                            setName.removeAt(index);
                                            setId.removeAt(index);
                                            setQuantity.removeAt(index);
                                            if (setName.isEmpty) {
                                              itemTotal = 0;
                                              total = 0;
                                            }
                                          }
                                        }
                                      });
                                    },
                                    color: Colors.black,)
                              ),
                              SizedBox(width: ScreenUtil().setWidth(40)),
                              Text(
                                '${setQuantity[index]}',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(60)
                                ),
                              ),
                              SizedBox(width: ScreenUtil().setWidth(40)),
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10) ,
                                    color: Colors.white70,
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 1,
                                          color: Colors.black.withOpacity(0.5),
                                          blurRadius: 1)
                                    ],
                                  ),

                                  child: IconButton(
                                    icon: Icon(Icons.add,color: Colors.black,),
                                    onPressed: (){
                                      setState(() {
                                        setQuantity[index]++;
                                        total=total+setPrice[index];
                                        itemTotal=itemTotal+1;
                                        print(setQuantity);
                                      });
                                    },
                                    color: Colors.black,)
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          }),
        ),


      ],
    );
  }
}
//-----------------------------------------------------

//----------------------Favourites---------------------
class FavouritesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Favourite"),
      ),
    );
  }
}
//-----------------------------------------------------

// ----------------------Favourites---------------------
class HomeLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Home Location"),
      ),
    );
  }
}
//-----------------------------------------------------

// ----------------------Favourites---------------------
class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Profile"),
      ),
    );
  }
}
//-----------------------------------------------------
