import 'package:flutter/material.dart';
import 'package:my_project/models/field.api.dart';
import 'package:my_project/models/field.dart';
import 'package:my_project/utils/global.colors.dart';
import 'package:my_project/view/widgets/field_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Field> _fields;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getFields();
  }

  Future<void> getFields() async {
    _fields = await FieldApi.getField();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: GlobalColors.mainColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(Icons.crop_square),
                // SizedBox(width: 10),
                Text('Field List')
              ],
            )),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _fields.length,
                itemBuilder: (context, index) {
                  return FieldCard(
                      id : _fields[index].id,
                      title: _fields[index].name,
                      cookTime: _fields[index].totalTime,
                      rating: _fields[index].rating.toString(),
                      thumbnailUrl: _fields[index].images);
                },
              ));
  }
}
