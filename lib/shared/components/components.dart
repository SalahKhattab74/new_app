import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/modules/web_view/web_view_screen.dart';

Widget buildArticleItem(article,context) => InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']));
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover,
              )
          ),
        ),
  
        SizedBox(width: 20.0,),
  
        Expanded(
  
          child: Container(
  
            height: 120.0,
  
            child: Column(
  
              crossAxisAlignment: CrossAxisAlignment.start,
  
              mainAxisAlignment: MainAxisAlignment.start,
  
              children: [
  
                Expanded(
  
                  child: Text('${article['title']}',
  
                    style:Theme.of(context).textTheme.bodyText1,
  
                    maxLines: 3,
  
                    overflow: TextOverflow.ellipsis,
  
                  ),
  
                ),
  
                Text('${article['publishedAt']}',style:TextStyle(
  
                  color: Colors.grey,
  
                  fontSize: 18.0,
  
                  fontWeight: FontWeight.w600,
  
                ),)
  
              ],
  
            ),
  
          ),
  
        ),
  
      ],
  
    ),
  
  ),
);
Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(start: 20.0),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);
Widget articleBuilder(list,context) => ConditionalBuilder(
condition: list.length>0,
builder: (context) => ListView.separated(
physics: BouncingScrollPhysics(),
itemBuilder: (context,index)=> buildArticleItem(list[index],context),
separatorBuilder: (context,index) => myDivider(),
itemCount: list.length),
fallback:(context) =>  Center(child: CircularProgressIndicator()),);
Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChange,
  Function onTap,
  bool isPass = false,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  IconData suffix,
  Function suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: validate,
      obscureText: isPass,
      onTap: onTap,
      enabled: isClickable,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
          icon: Icon(suffix),
          onPressed: suffixPressed,
        )
            : null,
        border: OutlineInputBorder(),
      ),);
void navigateTo(context,widget) => Navigator.push(context,
MaterialPageRoute(builder: (context) => widget));