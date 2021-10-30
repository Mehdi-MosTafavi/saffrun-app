import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:saffrun_app/UI/utils/painter/dash.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/state_managment/search/search_cubit.dart';

late Jalali startDate = Jalali(1, 1, 1);
late Jalali endDate = Jalali(1, 1, 1);
late String sortField = "";

class FilterButtonWidget extends StatefulWidget {
  Function confirmFilter;

  FilterButtonWidget({Key? key, required this.confirmFilter}) : super(key: key);

  @override
  State<FilterButtonWidget> createState() => _FilterButtonWidgetState();
}

class _FilterButtonWidgetState extends State<FilterButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            showDialog(
                context: context,
                // useSafeArea: false,
                // useRootNavigator: false,
                barrierDismissible: false,
                builder: (context) {
                  return StatefulBuilder(builder: (context, setState) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      // contentPadding: const EdgeInsets.all(0.0),
                      content: Container(
                        height: context.height() * 0.35,
                        width: context.width() * 0.8,
                        child: Column(
                          children: [
                            Text(
                              'فیلتر کردن رویداد',
                              style: boldTextStyle(),
                              textDirection: TextDirection.rtl,
                            ),
                            const Divider(
                              height: 10,
                              thickness: 2,
                              color: Colors.black,
                            ),
                            Expanded(
                              child: ListView(
                                children: [
                                  filterTime(context, setState),
                                  CustomPaint(painter: DashedLinePainter()),
                                  filterOwner(context, setState),
                                  CustomPaint(painter: DashedLinePainter()),
                                  filterSortField(context, setState),
                                  MaterialButton(
                                    onPressed: () {
                                      widget.confirmFilter();
                                      finish(context);
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 100,
                                      decoration:
                                          boxDecorationWithRoundedCorners(
                                              backgroundColor: colorPallet3),
                                      child: Center(
                                        child: Text(
                                          'تایید',
                                          style: boldTextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                });
          },
          child: Align(
            alignment: Alignment.centerRight,
            child: Row(
              children: [
                const Icon(
                  Icons.filter_alt_rounded,
                  color: Colors.black,
                ),
                5.width,
                const Text('فیلتر')
              ],
            ),
          ).paddingSymmetric(vertical: 10, horizontal: 15),
        );
      },
    );
  }

  Widget filterTime(BuildContext context, StateSetter setState) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: TextButton(
        onPressed: () async {
          JalaliRange? picked;
          try {
            picked = await showPersianDateRangePicker(
              context: context,
              initialEntryMode: PDatePickerEntryMode.input,
              helpText: 'دیتا',
              initialDateRange: JalaliRange(start: startDate, end: endDate),
              firstDate: Jalali(1385, 8),
              lastDate: Jalali(1450, 9),
            );
          } catch (e) {
            picked = await showPersianDateRangePicker(
              context: context,
              initialEntryMode: PDatePickerEntryMode.input,
              firstDate: Jalali(1385, 8),
              lastDate: Jalali(1450, 9),
            );
          }
          try {
            setState(() {
              startDate = picked!.start;
              endDate = picked.end;
            });
          } catch (e) {
            print(e);
          }
        },
        style: const ButtonStyle(
          alignment: Alignment.centerRight,
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            children: [
              Text(
                'فیلتر زمانی',
                style: boldTextStyle(color: colorPallet3),
              ),
              5.width,
              startDate != Jalali(1, 1, 1) && endDate != Jalali(1, 1, 1)
                  ? FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            startDate.formatter.yyyy +
                                '/' +
                                startDate.formatter.mm +
                                '/' +
                                startDate.formatter.dd +
                                ' - ' +
                                endDate.formatter.yyyy +
                                '/' +
                                endDate.formatter.mm +
                                '/' +
                                endDate.formatter.dd,
                            textDirection: TextDirection.rtl,
                          ),
                          10.width,
                          InkWell(
                              onTap: () {
                                setState(() {
                                  startDate = Jalali(1, 1, 1);
                                  endDate = Jalali(1, 1, 1);
                                });
                              },
                              child: const Icon(Icons.cancel_sharp))
                        ],
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget filterOwner(BuildContext context, StateSetter setState) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextButton(
              onPressed: () {},
              child: Text(
                'انتخاب کارفرما',
                textDirection: TextDirection.rtl,
                style: boldTextStyle(color: colorPallet4),
              ))
        ],
      ),
    );
  }

  Widget filterSortField(BuildContext context, StateSetter setState) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.end,
      textDirection: TextDirection.rtl,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 5, top: 10),
          alignment: Alignment.topRight,
          child: Text('مرتب سازی بر اساس:', style: boldTextStyle(size: 18)),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.start,
            direction: Axis.horizontal,
            children: [
              Theme(
                data: Theme.of(context)
                    .copyWith(unselectedWidgetColor: colorPallet5),
                child: Radio(
                  value: 'title',
                  groupValue: sortField,
                  fillColor: MaterialStateProperty.all(colorPallet2),
                  onChanged: (dynamic value) {
                    setState(() {
                      sortField = value;
                      toast("$sortField Selected");
                    });
                  },
                ),
              ),
              Text('عنوان', style: primaryTextStyle()),
              Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: colorPallet5,
                ),
                child: Radio(
                  value: 'start_datetime',
                  fillColor: MaterialStateProperty.all(colorPallet2),
                  groupValue: sortField,
                  onChanged: (dynamic value) {
                    setState(() {
                      sortField = value;
                    });
                  },
                ),
              ),
              Text('تخفیف', style: primaryTextStyle()),
              Theme(
                data: Theme.of(context)
                    .copyWith(unselectedWidgetColor: colorPallet5),
                child: Radio(
                  value: 'start_datetime',
                  groupValue: sortField,
                  fillColor: MaterialStateProperty.all(colorPallet2),
                  onChanged: (dynamic value) {
                    setState(() {
                      sortField = value;
                      toast("$sortField Selected");
                    });
                  },
                ),
              ),
              Text('زمان شروع', style: primaryTextStyle()),
            ],
          ),
        ),
      ],
    );
  }
}
