import 'package:flutter/material.dart';
class ResponsiveCard extends StatefulWidget {
  final double? screenWidth;//null able
  final double? titleGap;//null able
  final Widget?  leading;//null able
  final Widget? action;//null able
  final Widget? title;//null able
  final Widget? subTitle;//null able
  final EdgeInsets? padding;//null able
  final Flex? leadingFlex;//null able
  final Flex? titleFlex;//null able
  final EdgeInsets? margin;//null able
  final double? elevation;//null able
  final Color? bgColor;//null able
  const ResponsiveCard({super.key,  this.screenWidth, this.titleGap, this.leading,  this.action,  this.title,  this.subTitle, this.padding, this.leadingFlex, this.titleFlex, this.margin, this.elevation, this.bgColor});



  @override
  State<ResponsiveCard> createState() => _ResponsiveCardState();
}

class _ResponsiveCardState extends State<ResponsiveCard> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var givenWidth = widget.screenWidth ?? 800;
    return Card(
      margin: widget.margin?? const EdgeInsets.all(15.0),
      elevation: widget.elevation,
      color: widget.bgColor,
      child: Padding(
        padding: widget.padding?? const EdgeInsets.all(15.0),
        // responsive checking
        child:screenWidth>givenWidth? Row(
          crossAxisAlignment: CrossAxisAlignment.start,// need to change after
          mainAxisAlignment: MainAxisAlignment.start,// need to change after
          //user defined function
          children: children(screenWidth,givenWidth,widget.titleGap,widget.leading,widget.title,widget.subTitle,widget.action,widget.leadingFlex,widget.titleFlex),
        ):Column(
          crossAxisAlignment: CrossAxisAlignment.start,//null able
          mainAxisAlignment: MainAxisAlignment.start,//null able
          children: children(screenWidth,givenWidth,widget.titleGap,widget.leading,widget.title,widget.subTitle,widget.action,widget.leadingFlex,widget.titleFlex),),
      ),
    );
  }

  List<Widget> children(screenWidth,givenWidth,titleGap,leading,title,subTitle,action,leadingFlex,titleFlex) {
    return [
      screenWidth>givenWidth?
      Expanded(flex: leadingFlex?? 3, child:leading??const Text(""))// for the small device
          :
          // for the large device
      Stack(
        children: [
          leading??const Text(""),
          action??const Text("")
        ],
      ),
      /// title gap
      SizedBox(width: titleGap??10,height: titleGap??10,),
      // for the large device
      if(screenWidth>givenWidth)
        Expanded(
          flex:titleFlex?? 6,
          child: Column(
            children: [
              title??const Text(""),
              subTitle??const Text("")
            ],
          ),
        ),
      // for the large device
      if(screenWidth>givenWidth)
        Expanded(child: action??const Text("")),
      // for the small device
      if(screenWidth<givenWidth)
        title??const Text(""),
      if(screenWidth<givenWidth)
        subTitle??const Text(""),
    ];
  }
}
