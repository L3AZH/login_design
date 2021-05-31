
import 'package:flutter/material.dart';
import 'package:login_design/custom_widget/AddDialog.dart';
import 'package:login_design/provider/ProviderModel.dart';
import 'package:login_design/home/info_screen.dart';
import 'package:login_design/home/my_list_screen.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget{
  final textField1Controllername = TextEditingController();
  final textField2Controllerphone = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final homeScreenModel = Provider.of<ProviderModel>(context);
    List<Widget> _widgetScreenList = [
      InfoScreen(),
      MyListScreen(),
      Text("Favorite"),
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Home screen"),),
      body: Center(
        child: _widgetScreenList.elementAt(homeScreenModel.getCurrentItem()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: "Info",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "My list",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
        ],
        currentIndex: homeScreenModel.getCurrentItem(),
        selectedItemColor: Colors.blueAccent,
        onTap:(int index){
          homeScreenModel.setCurrentItem(index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:(){
          _showDialog(context);
        },
      ),
    );
  }

  Future<void> _showDialog(BuildContext context) async{
    return showDialog<void>(
        context: context,
        builder: (BuildContext context){
          return AddDialog(
              textEditingControllername: textField1Controllername,
              textEditingControllerphone: textField2Controllerphone);
        });
  }
}