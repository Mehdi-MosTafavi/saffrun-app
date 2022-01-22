import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/data_managment/base_networkservice.dart';

class EnhancedDropDown extends StatefulWidget {
  final ValueChanged<int> valueReturned;

  ///Constructor that accepts a list of elements to be the data source for the dropdown
  EnhancedDropDown.withData(
      {required this.dropdownLabelTitle,
      required this.dataSource,
      required this.defaultOptionText,
      required this.valueReturned})
      : urlToFetchData = null;

  ///Constructor that accepts an endpoint in URI form to fetch the data from
  EnhancedDropDown.withEndpoint(
      {required this.dropdownLabelTitle,
      required this.defaultOptionText,
      required this.urlToFetchData,
      required this.valueReturned})
      : dataSource = null;

  /// Holds the default text to show when nothing is selected in the dropdown
  final String defaultOptionText;

  /// Holds the text in the label attached to the dropdown
  final String dropdownLabelTitle;

  /// The endpoint to fetch the data that gets used by the dropdown
  final Uri? urlToFetchData;

  /// A list which holds the data if we don't want to make a network request
  final List<String>? dataSource;

  @override
  _EnhancedDropDownState createState() => _EnhancedDropDownState();
}

class _EnhancedDropDownState extends State<EnhancedDropDown> {
  List<DropdownMenuItem<String>> _data = [];
  String _selected = "";
  List<String> data = [];
  late bool openList;

  @override
  void initState() {
    super.initState();
    _loadDataForDropdown();
    openList = false;
  }

  /// Responsible for loading the data that the dropdown uses
  void _loadDataForDropdown() async {
    _data = const [];

    List<DropdownMenuItem<String>> menuItems = [];
    menuItems.add(new DropdownMenuItem(
      child: new Text(_selected),
      value: _selected,
    ));

    if (widget.urlToFetchData != null) {
      List? jsonResponse =
          await BaseNetworkService().getTemplate('/category/get-all/');
      if (jsonResponse != null) {
        jsonResponse.forEach((value) {
          data.add(value['name']);
          menuItems.add(new DropdownMenuItem(
            child: new Text(value['name'].toString()),
            value: value['id'].toString(),
          ));
        });
        setState(() {
          _data = menuItems;
        });
      } else {
        print("EnhancedDropDownWidget Request failed with status: ${400}.");
      }
    } else if (widget.dataSource != null) {
      for (int i = 0; i < widget.dataSource!.length; i++) {
        menuItems.add(new DropdownMenuItem(
          child: new Text(widget.dataSource![i]),
          value: widget.dataSource![i],
        ));
      }
      setState(() {
        _data = menuItems;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_data.length == 0) {
      return const FittedBox(
              fit: BoxFit.scaleDown, child: CircularProgressIndicator())
          .paddingAll(8);
    } else {
      return Column(
        // crossAxisAlignment:CrossAxisAlignment.start ,
        //   mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          openList = !openList;
                        });
                      },
                      child: Icon(
                        !openList
                            ? Icons.add_box_rounded
                            : Icons.remove_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      _selected == "" ? 'انتخاب دسته بندی' : _selected,
                      textDirection: TextDirection.rtl,
                      style: boldTextStyle(color: colorPallet4),
                    ),
                  ),
                ],
              ),
              _selected != ""
                  ? Center(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selected = "";
                          });
                        },
                        child: Icon(
                          Icons.cancel_outlined,
                          color: colorPallet1,
                          size: 20,
                        ),
                      ),
                    )
                  : Container()
              // _selected != ""
              //     ? Row(
              //         children: [
              //
              //           5.width,
              //           Align(
              //             alignment: Alignment.center,
              //             child: Text(
              //               _selected,
              //               textDirection: TextDirection.rtl,
              //               style: boldTextStyle(color: colorPallet4),
              //             ),
              //           ),
              //         ],
              //       )
              //     : Container(),
            ],
          ).paddingSymmetric(vertical: 12),
          openList
              ? Container(
                  height: 100,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selected = data[index];
                            print(_data[index + 1].value);
                            widget
                                .valueReturned(_data[index + 1].value.toInt());
                          });
                        },
                        child: Text(
                          data[index],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                    itemCount: data.length,
                  ))
              : Container()
          // new Text(widget.dropdownLabelTitle,
          //     textDirection: TextDirection.ltr),
          // DropdownSearch<String>(
          // mode: Mode.BOTTOM_SHEET,
          //     showSelectedItems: true,
          //     items: data,
          //     showAsSuffixIcons: true,
          //     // popupItemDisabled: (String s) => s.startsWith('I'),
          //   dropdownSearchDecoration: InputDecoration(
          //     contentPadding: EdgeInsets.all(3),
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(10)
          //     ),
          //
          //   ),
          //
          //     onChanged: (value) {
          //       _selected = value as String;
          //       widget.valueReturned(_selected);
          //       setState(() {});
          //     },).paddingAll(10),// DropdownButton(
          //     value: _selected,
          //     items: _data,
          //     hint: new Text(widget.defaultOptionText),
          //     onChanged: (value) {
          //       _selected = value as String;
          //       widget.valueReturned(_selected);
          //       setState(() {});
          //     })
        ],
      );
    }
  }
}
