import 'package:customer/src/core/utils/enums/service_day.dart';
import 'package:customer/src/ui/utils/theme_colors.dart';
import 'package:customer/src/ui/views/pages/services/service_checkout_viewmodel.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:table_calendar/table_calendar.dart';

class ServicesCheckoutPage extends StatefulWidget {
  @override
  _ServicesCheckoutPageState createState() => _ServicesCheckoutPageState();
}

class _ServicesCheckoutPageState extends State<ServicesCheckoutPage> {
  CalendarController _calendarController = CalendarController();

  _showBottomSheet() {
    showModalBottomSheet(
      enableDrag: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return Container(
          height: MediaQuery.of(context).size.height,
          color: ThemeColors.white,
          child: SingleChildScrollView(
            child: TableCalendar(
              initialCalendarFormat: CalendarFormat.month,
              calendarStyle: CalendarStyle(
                  todayColor: Colors.blue,
                  selectedColor: ThemeColors.primary,
                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      color: ThemeColors.white)),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: ThemeColors.primary,
                  borderRadius: BorderRadius.circular(22.0),
                ),
                formatButtonTextStyle: TextStyle(color: ThemeColors.white),
                formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(5.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ThemeColors.primary,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: ThemeColors.white),
                    )),
                todayDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(5.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ThemeColors.primary,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: ThemeColors.white),
                    )),
              ),
              calendarController: _calendarController,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ServiceCheckoutViewModel>.reactive(
        viewModelBuilder: () => ServiceCheckoutViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: ThemeColors.white,
              leading: Icon(
                Icons.keyboard_arrow_left,
                size: 35,
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hair Cut",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Champion Salon",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: model.serviceDay == ServiceDay.earliestAvailable
                            ? ThemeColors.primary
                            : ThemeColors.white,
                      ),
                      child: Row(
                        children: [
                          Radio(
                            toggleable: true,
                            value: ServiceDay.earliestAvailable,
                            groupValue: model.serviceDay,
                            activeColor: ThemeColors.white,
                            onChanged: (ServiceDay value) {
                              model.serviceDay = value;
                            },
                          ),
                          Text(
                            "Earliest Available",
                            style: TextStyle(
                                color: model.serviceDay ==
                                        ServiceDay.earliestAvailable
                                    ? ThemeColors.white
                                    : ThemeColors.primary,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: model.serviceDay == ServiceDay.scheduleForLater
                            ? ThemeColors.primary
                            : ThemeColors.white,
                      ),
                      child: Row(
                        children: [
                          Radio(
                            toggleable: true,
                            value: ServiceDay.scheduleForLater,
                            groupValue: model.serviceDay,
                            activeColor: ThemeColors.white,
                            onChanged: (ServiceDay value) {
                              model.serviceDay = value;
                            },
                          ),
                          Text(
                            "Schedule For Later",
                            style: TextStyle(
                                color: model.serviceDay ==
                                        ServiceDay.scheduleForLater
                                    ? ThemeColors.white
                                    : ThemeColors.primary,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                        visible: model.serviceDay != ServiceDay.scheduleForLater
                            ? false
                            : true,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              height: 70,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Select a date for\nthe booking"),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: GRoundedButton(
                                      onPressed: _showBottomSheet,
                                      color: ThemeColors.blueGrey,
                                      height: 40,
                                      width: 70,
                                      borderRadius: 10,
                                      child: Text(
                                        "Date",
                                        style: TextStyle(
                                            color: ThemeColors.primary),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              height: 70,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Select a time for\nthe booking"),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: GRoundedButton(
                                      color: ThemeColors.blueGrey,
                                      borderRadius: 10,
                                      height: 40,
                                      width: 70,
                                      child: Text(
                                        "Time",
                                        style: TextStyle(
                                            color: ThemeColors.primary),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Text(
                        "Request booking for",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Tuesday, January 01, 2022",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: ThemeColors.body),
                      ),
                    ),
                    Center(
                      child: Text(
                        "AT 00:00",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: ThemeColors.body),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              margin: EdgeInsets.all(10),
              child: GRoundedButton(
                height: 50,
                borderRadius: 10,
                color: ThemeColors.primary,
                child: Center(
                    child: Text(
                  "BOOK NOW",
                  style: TextStyle(fontSize: 16, color: ThemeColors.white),
                )),
              ),
            ),
          );
        });
  }
}
