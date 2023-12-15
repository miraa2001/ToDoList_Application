import 'package:flutter/material.dart';
import '/constants/colors.dart';
import 'package:newtodolist/model/ToDo.dart';
import 'package:newtodolist/widgets/ToDoItem.dart';
class Home extends StatefulWidget {
  const Home({Key? key}):super(key:key);

  @override
  State<Home> createState()=>_HomeState();

}
class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
      children: [Container
      (
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
                      searchBox(),
                      Expanded(
                      child: ListView(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                      top: 50,
                                      bottom: 20,
                                    ),
                            child: Text("All ToDos",
                                   style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,)
                                   )
                           ),
                          for(ToDo todoo in todosList)
                            ToDoItem(todo: todoo,onToDoChanged: _handleToDoChange,onDeleteItem: (){},),
                        ],
                      ),
                      )
          ]
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Expanded(child: Container(
              margin: EdgeInsets.only(
                bottom: 20,right: 20, left:20,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              decoration: BoxDecoration(color: Colors.white,
                                        boxShadow: [BoxShadow(color: Colors.grey,
                                                            offset: Offset(0.0,0.0),
                                                            blurRadius: 10.0,
                                                            spreadRadius: 0.0,
                                        ),],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Add a new todo item',
                  border: InputBorder.none,
                ),
              )
            )
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: 20,
                right: 20,
              ),
              child: ElevatedButton(
                child: Text('+',style: TextStyle(fontSize:40)),
                onPressed: (){},
                style: ElevatedButton.styleFrom(primary: tdBlue,minimumSize: Size(60,60),elevation: 10)
              )
            )
          ]
        )
      )
      ]
      )
    );
  }
  void _handleToDoChange(ToDo todo){
    setState((){
      todo.isDone=!todo.isDone;
    });
  }
  Widget searchBox()
  {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,color: tdBlack,size:20,
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              maxWidth: 25,
            ),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: tdGrey),

          ),

        )
    );
  }
  AppBar _buildAppBar() {
    return AppBar
    (
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row
      ( mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        Icon(
            Icons.menu,
            color: tdBlack,
            size: 30
            ),
        Container
        (
            height: 40,
            width: 40,
            child: ClipRRect(borderRadius: BorderRadius.circular(20.0) ,child: Image.asset('images/avatar.jpeg'),),
        )
        ]
      )
    );
  }
}
