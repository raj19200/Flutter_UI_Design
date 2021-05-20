import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_design/model/shoesImages.dart';
import 'package:ui_design/model/shoesModel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:ui_design/component/appClipper.dart';

class DetailPage extends StatefulWidget {

  final ShoeModel shoeModel;
  final ShoesImages shoesImages;
  DetailPage({this.shoeModel,this.shoesImages});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int activeSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.shoeModel.colors,
      appBar: AppBar(
        backgroundColor: widget.shoeModel.colors,
        elevation: 0,
        title: Center(child: Text("Nike")),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: Container(
                height: ScreenUtil().screenHeight * .80,
                width: ScreenUtil().screenWidth, 
                // MediaQuery.of(context).size.width,
                child: ClipPath(
                  clipper: AppClipper(
                    cornerSize: 60,
                    diagonalHeight: 70,
                    roundedBottom: false,
                  ),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(top: ScreenUtil().setHeight(360), left:ScreenUtil().setWidth(36), right: ScreenUtil().setWidth(36)),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(widget.shoesImages.imgPath.length, (index){
                                return Padding(
                                  padding: const EdgeInsets.only(right: 15,bottom: 5,left: 5,top: 5),
                                  child: Container(
                                    width: ScreenUtil().setWidth(140),
                                    height: ScreenUtil().setHeight(140),
                                    decoration: BoxDecoration(
                                        // color: activeSize == index ?Colors.black :Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [BoxShadow(
                                            spreadRadius: 0.5,
                                            blurRadius: 1,
                                            color: Colors.black.withOpacity(0.1)
                                        )]
                                    ),
                                    child: Image.asset(
                                                      "assets/${widget.shoesImages.imgPath[index]}",
                                                      fit: BoxFit.cover),
                                  ),
                                );
                              }),
                            ),
                          ),
                          Divider(
                            height: ScreenUtil().setHeight(20.0),
                            thickness: 2.0,
                            color: Colors.black26,
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(20.0),
                          ),
                          Row(
                            children: [
                              Text(
                                widget.shoeModel.name,
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(40),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: ScreenUtil().setWidth(200),
                              ),
                              Text(
                                '\$${widget.shoeModel.price}',
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(40),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(20.0),
                          ),
                          Text(widget.shoeModel.desc,style: TextStyle(
                              fontSize: ScreenUtil().setSp(30),
                              ),),
                          SizedBox(
                            height: ScreenUtil().setHeight(20.0),
                          ),
                          Text(
                            "MORE DETAILS",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                                wordSpacing: 2.0),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(40.0),
                          ),
                          Row(
                            children: [
                              Text(
                                "Size",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: ScreenUtil().setSp(36),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: ScreenUtil().setWidth(420),
                              ),
                              Text(
                                "UK",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: ScreenUtil().setSp(36),
                                ),
                              ),
                              SizedBox(
                                width: ScreenUtil().setWidth(20),
                              ),
                              Text(
                                "USA",
                                style: TextStyle(
                                    fontSize:ScreenUtil().setSp(36), color: Colors.black26),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(40.0),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(widget.shoeModel.size.length, (index){
                                return GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      activeSize = index;

                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 15,bottom: 5,left: 5,top: 5),
                                    child: Container(
                                      width: ScreenUtil().setWidth(140),
                                      height:ScreenUtil().setHeight(140),
                                      decoration: BoxDecoration(
                                          color: activeSize == index ?Colors.black :Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: [BoxShadow(
                                              spreadRadius: 0.5,
                                              blurRadius: 1,
                                              color: Colors.black.withOpacity(0.1)
                                          )]
                                      ),
                                      child: Center(
                                        child: Text(widget.shoeModel.size[index],style: TextStyle(
                                            fontSize: ScreenUtil().setSp(44),
                                            color: activeSize == index ? Colors.white : Colors.black
                                        ),),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(40.0),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints.tightFor(
                              width: ScreenUtil().setWidth(700)
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.redAccent,
                                onPrimary: Colors.white,
                              ),
                                onPressed:()async{
                                  final prefs = await SharedPreferences.getInstance();
                                  prefs.setString("Name", widget.shoeModel.name);
                                  prefs.setInt("Id", widget.shoeModel.id);
                                  prefs.setInt("price", widget.shoeModel.price);
                                  prefs.setString("img", widget.shoeModel.imgPath);
                                  prefs.setInt("Qun", widget.shoeModel.quantity);
                                  Navigator.pushReplacementNamed(context, "/");
                                },
                                child: Text("ADD TO BAG")
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(40.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(140), top: ScreenUtil().setHeight(10)),
              child: Hero(
                tag: "hero${widget.shoeModel.imgPath}",
                child: Image(
                  width: ScreenUtil().screenWidth * .65,
                  height: ScreenUtil().setHeight(450),
                  image: AssetImage("assets/${widget.shoeModel.imgPath}"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
