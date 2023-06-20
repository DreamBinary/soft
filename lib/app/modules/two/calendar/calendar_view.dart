import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soft/app/modules/other/add_calendar.dart';
import 'package:soft/app/theme/app_colors.dart';
import 'package:soft/app/theme/app_sizes.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../comp/mysearchbar.dart';
import '../../../theme/app_text_theme.dart';
import 'calendar_logic.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CalendarLogic>();
    final state = Get.find<CalendarLogic>().state;

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 250.h,
              width: double.infinity,
              margin: EdgeInsets.only(top: 200.h),
              decoration: const BoxDecoration(
                // color: Colors.red,
                gradient: LinearGradient(
                  colors: [
                    Color(0xffFFEAE9),
                    Color(0xffFFEAE9),
                    Color(0x00FFEAE9),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Column(
              children: const [
                MySearchBar(
                  strokeColor: Colors.grey,
                ),
                _DatePicker(),
                _DayEvent(date: "1月1日"),
                _DayData()
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 85),
                child: MaterialButton(
                  height: 70,
                  minWidth: 70,
                  color: AppColors.fillColor,
                  shape: CircleBorder(
                    side: BorderSide(
                      color: AppColors.stroke,
                      width: AppSizes.strokeWidth,
                    ),
                  ),
                  onPressed: () {
                    Get.to(const AddCalendarPage());
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    weight: 900,
                    size: 60,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _DayEvent extends StatelessWidget {
  final Color color;
  final String date;

  const _DayEvent({this.color = AppColors.stroke, required this.date, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
      child: Row(
        children: [
          VerticalDivider(
            color: color,
            width: 0,
            thickness: 4,
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: AppTS.big,
              ),
              Text(
                "暂无注意事项",
                style: AppTS.normal.copyWith(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _DayDataDetail extends StatelessWidget {
  final Color dotColor;
  final String start;
  final String end;
  final String value;

  const _DayDataDetail(
      {required this.dotColor,
      required this.start,
      required this.end,
      required this.value,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 5,
          width: 5,
          decoration: BoxDecoration(
            color: dotColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "$start ~ $end",
          style: AppTS.normal.copyWith(color: Colors.grey),
        ),
        const SizedBox(width: 30),
        Text(
          value,
          style: AppTS.normal.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}

class _DayData extends StatelessWidget {
  final Color color;

  const _DayData({this.color = AppColors.stroke, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
      child: Row(
        children: [
          VerticalDivider(
            color: color,
            width: 0,
            thickness: 4,
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "当天测试数据",
                style: AppTS.big,
              ),
              const _DayDataDetail(
                dotColor: Color(0xffFFB345),
                start: "16:20",
                end: "16:40",
                value: "138 bpm",
              ),
              const _DayDataDetail(
                dotColor: Color(0xffB5B5FE),
                start: "20:01",
                end: "20:22",
                value: "126 bpm",
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _DatePicker extends StatelessWidget {
  const _DatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.stroke),
      ),
      child: SfDateRangePicker(
        headerStyle: DateRangePickerHeaderStyle(
          textAlign: TextAlign.start,
          textStyle: AppTS.normal,
        ),
        headerHeight: 40.h,
        selectionMode: DateRangePickerSelectionMode.single,
        todayHighlightColor: AppColors.stroke,
        selectionColor: AppColors.primary,
        // rangeSelectionColor: rangeColor,
        // startRangeSelectionColor: selectedColor,
        // endRangeSelectionColor: selectedColor,
        showNavigationArrow: true,
        monthViewSettings: const DateRangePickerMonthViewSettings(
          dayFormat: "EEE",
          showTrailingAndLeadingDates: true,
        ),
        onSelectionChanged: (value) {},
      ),
    );
  }
}
