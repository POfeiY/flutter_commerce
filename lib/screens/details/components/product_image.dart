import 'package:flutter/material.dart';
import 'package:flutter_commerce/models/Product.dart';

import 'package:flutter_commerce/constants.dart';
import 'package:flutter_commerce/size_config.dart';

class ProduceImage extends StatefulWidget {
  const ProduceImage({
    Key key,
    @required this.product
}):super(key: key);
  final Product product;
  @override
  _ProduceImageState createState() => _ProduceImageState();
}

class _ProduceImageState extends State<ProduceImage> {
  int seletedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.product.id.toString(),
              child: Image.asset(widget.product.images[seletedImage]),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.product.images.length, (index) => buildSmallProductPreview(index))
          ],
        )
      ],
    );
  }
  
  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: (){
        setState(() {
          seletedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: kPrimaryColor.withOpacity(seletedImage == index ? 1 : 0)
          )
        ),
        child: Image.asset(widget.product.images[index]),
      ),
    );
  }
}
