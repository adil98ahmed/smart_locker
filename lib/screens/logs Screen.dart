import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart2/providers/logs%20provider.dart';

class LogsScreen extends StatefulWidget {
  const LogsScreen({Key? key}) : super(key: key);

  @override
  _LogsScreenState createState() => _LogsScreenState();
}

class _LogsScreenState extends State<LogsScreen> {
  List<String> names = [];
  List<bool> checkBoxesValues = [];
  List<int> selected = [];
  bool selectOption = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i = 0 ; i < 9 ; i++){
      names.add("Karim");
      checkBoxesValues.add(false);
    }
    context.read<LogsProvider>().getLogs();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back) ,
                      ),
                      Text("Logs"),
                      InkWell(onTap: (){
                        selectOption = true;
                        setState(() {
                        });
                      },child: Text("Select"))
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .9,
                  child: Consumer<LogsProvider>(
                    builder:(context, value, child) =>(value.logs.isNotEmpty)? ListView.builder(
                      itemCount: value.logs.length,
                      itemBuilder: (o, index) => Container(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    (selectOption)?Checkbox(
                                        checkColor: Colors.white,
                                        activeColor: Colors.purple,
                                        value: checkBoxesValues[index],
                                        onChanged: (val) {
                                      checkBoxesValues[index] = val!;
                                      if(val == true){
                                        selected.add(index);
                                      }else{
                                        selected.removeAt(index);
                                      }
                                      setState(() {

                                      });
                                    }):Container(),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      child: Image.network(value.logs[index].pic!),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("  ${names[index]} $index"),
                                        Text(
                                          value.logs[index].time.toString(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.purple[300]),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      names.removeAt(index);
                                      checkBoxesValues.removeAt(index);
                                      setState(() {

                                      });
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      size: 20,
                                      color: Colors.red[200],
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ):Center(child: Text("No Logs!"),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: (selected.isNotEmpty)?FloatingActionButton(
        onPressed: (){
          for(int index in selected){
            names.removeAt(index);
          }
          for(int i = 0 ; i < checkBoxesValues.length ;i++){
            checkBoxesValues[i] = false;
          }
          selected.clear();
          setState(() {

          });
        },
        mini: true,
        backgroundColor: Colors.red,
        child: Icon(Icons.delete),
      ):Container(),
    );
  }
}
