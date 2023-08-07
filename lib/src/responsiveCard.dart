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

  const ResponsiveCard({super.key,  this.screenWidth, this.titleGap, this.leading,  this.action,  this.title,  this.subTitle, this.padding, this.leadingFlex, this.titleFlex});



  @override
  State<ResponsiveCard> createState() => _ResponsiveCardState();
}

class _ResponsiveCardState extends State<ResponsiveCard> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var givenWidth = widget.screenWidth ?? 800;
    return Card(
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
      screenWidth>givenWidth?Expanded(flex: leadingFlex?? 3, child:leading):Stack(
        children: [
          leading,
          action
        ],
      ),
      SizedBox(width: titleGap,height: titleGap,),
      if(screenWidth>givenWidth)
        Expanded(
          flex:titleFlex?? 6,
          child: Column(
            children: [
              title,
              subTitle
            ],
          ),
        ),
      if(screenWidth>800)
        Expanded(child: action),
      if(screenWidth<givenWidth)
        title,
      if(screenWidth<givenWidth)
        subTitle,
    ];
  }
}
