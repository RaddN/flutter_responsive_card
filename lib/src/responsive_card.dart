import 'package:flutter/material.dart';
class ResponsiveCard extends StatefulWidget {
  final double? screenWidth;
  final double? titleGap;
  final Widget?  leading;
  final Widget? action;
  final Widget? title;
  final Widget? subTitle;
  final EdgeInsets? padding;
  final Flex? leadingFlex;
  final Flex? titleFlex;
  final EdgeInsets? margin;
  final double? elevation;
  final Color? bgColor;
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
        child:screenWidth>givenWidth? Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: children(screenWidth,givenWidth,widget.titleGap,widget.leading,widget.title,widget.subTitle,widget.action,widget.leadingFlex,widget.titleFlex),
        ):Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: children(screenWidth,givenWidth,widget.titleGap,widget.leading,widget.title,widget.subTitle,widget.action,widget.leadingFlex,widget.titleFlex),),
      ),
    );
  }

  List<Widget> children(screenWidth,givenWidth,titleGap,leading,title,subTitle,action,leadingFlex,titleFlex) {
    return [
      screenWidth>givenWidth?Expanded(flex: leadingFlex?? 3, child:leading??Text("")):Stack(
        children: [
          leading??Text(""),
          action??Text("")
        ],
      ),
      SizedBox(width: titleGap??10,height: titleGap??10,),
      if(screenWidth>givenWidth)
        Expanded(
          flex:titleFlex?? 6,
          child: Column(
            children: [
              title??Text(""),
              subTitle??Text("")
            ],
          ),
        ),
      if(screenWidth>800)
        Expanded(child: action??Text("")),
      if(screenWidth<givenWidth)
        title??Text(""),
      if(screenWidth<givenWidth)
        subTitle??Text(""),
    ];
  }
}
