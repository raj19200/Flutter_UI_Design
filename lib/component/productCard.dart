import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_design/model/shoesImages.dart';
import 'package:ui_design/model/shoesModel.dart';
class ProductCard extends StatelessWidget {
  final ShoeModel shoes;
  final int cardNum;
  final ShoesImages img;
  ProductCard({this.shoes,this.cardNum,this.img});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(500),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: ScreenUtil().setHeight(40)
              ),
              child: Container(
                width: ScreenUtil().setWidth(450),
                height: ScreenUtil().setHeight(990),
                decoration: BoxDecoration(
                  color:shoes.colors,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0,8),
                      blurRadius: 8
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: ScreenUtil().setWidth(40),
                      top: ScreenUtil().setHeight(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                shoes.brand,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenUtil().setSp(30),
                                ),
                              ),
                              SizedBox(width: ScreenUtil().setWidth(250)),
                              Icon(Icons.favorite_border,color: Colors.white,size: 20.0,)
                            ],
                          ),
                          SizedBox(height: ScreenUtil().setHeight(5),),
                          Text(
                            shoes.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(30),
                            ),
                          ),
                          SizedBox(height: ScreenUtil().setHeight(5),),
                          Text(
                              "\$${shoes.price}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(30),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(45),
                          bottom: ScreenUtil().setHeight(45),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(width: ScreenUtil().setWidth(380)),
                            Icon(Icons.arrow_forward,color: Colors.white,size: 30.0,)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: ScreenUtil().setHeight(100),
            left: ScreenUtil().setWidth(-2),
            bottom: ScreenUtil().setHeight(20),
            right: ScreenUtil().setWidth(-12),
            child: Image.asset(
              "assets/${shoes.imgPath}",
              // width: ScreenUtil().setWidth(640),
              // height: ScreenUtil().setHeight(450),
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
