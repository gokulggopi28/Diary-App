import 'package:flutter/material.dart';

class ItemNote extends StatelessWidget {
  const ItemNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5

            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red
            ),
            child: Column(
              children: [
                Text('DEC',style: TextStyle(color: Colors.white),),
                SizedBox(height: 3,),
                Text('09',style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ))
                ,
                SizedBox(height: 3,),
                Text('2023',
                style: TextStyle(
                  color: Colors.white70
                ),),
              ],
            ),
          ),
          SizedBox(width: 15,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text('This is the title',
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,)),
                  Text('12:30 PM ',style: Theme.of(context).textTheme.bodySmall,)
                ],
              ),
              Text('This is the description of this note',
              style: TextStyle(fontWeight: FontWeight.w300,
              height: 1.5),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,)
            ],
          ))
        ],),
    );
  }
}