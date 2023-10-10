import 'package:flutter/material.dart';
import 'package:truck_tracking/config/colors/colors.dart';
import 'package:truck_tracking/config/fonts/fonts.dart';
class ReportListTile extends StatelessWidget {
  const ReportListTile({super.key, 
    required this.title,
    required this.icon,
    required this.press,
    this.iconColor,
    this.textStyle,
  });
  final String title;
  final Icon icon;
  final VoidCallback press;
  final Color? iconColor;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: iconColor ?? AppColors.drawerTextColor,
      textColor: textStyle?.color ?? AppColors.drawerTextColor,
      visualDensity: const VisualDensity(vertical: -4),
      dense: true,
      onTap: press,
      trailing: Icon(
        icon.icon,
        color: iconColor ?? AppColors.reportIconColor,
      ),
      title: Text(
        title,
        style: textStyle ?? AppFonts.medium.copyWith(color: AppColors.reportTextColor),
      ),
    );
  }
}
class listHeading extends StatelessWidget {
  const listHeading({ required this.heading,
    super.key,
  });
final String heading;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left:14,top:10),
      width: MediaQuery.of(context).size.width *.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      color: AppColors.reportSceenHeading,
                 
      ),
      height: MediaQuery.of(context).size.height *.06,      
      child: Text(heading,style: AppFonts.bold,)
      );
  }
}
class listTiles extends StatelessWidget {
  const listTiles({super.key,  required this.title,required this.icon,required this.content  
  });
final String title;
final Icon icon;
final Widget content;
  @override
  Widget build(BuildContext context) {
    return ReportListTile(
      title: title,
      icon: icon,
      press: () {
        showDialog(context: context, builder: (context)=>AlertDialog(
        title: Text(title,style:AppFonts.bold.copyWith(color:AppColors.loginTextColor)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        // content: driverList(context),  
        content: content,      
       )  
       ); 
      },
    );
  }
}

// ignore: must_be_immutable
class HeadingRow extends StatelessWidget {
  String v1,v2,v3,v4,v5 ;
  HeadingRow({Key? key , required this.v1,required this.v2,required this.v3,required this.v4,
  required this.v5}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(v1,style: AppFonts.bold,),
          Text(v2,style: AppFonts.bold),
          Text(v3,style: AppFonts.bold),
          Text(v4,style: AppFonts.bold),
          Text(v5,style: AppFonts.bold),      
        ],        
      ),
    );
  }
}