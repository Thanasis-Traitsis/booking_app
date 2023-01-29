import 'package:barcode_widget/barcode_widget.dart';
import 'package:bookingapp/screens/ticket_view.dart';
import 'package:bookingapp/utils/app_info_list.dart';
import 'package:bookingapp/utils/app_layout.dart';
import 'package:bookingapp/utils/app_styles.dart';
import 'package:bookingapp/widgets/column_layout.dart';
import 'package:bookingapp/widgets/layout_builder_widget.dart';
import 'package:bookingapp/widgets/ticket_tabs.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.all(AppLayout.getHeight(20)),
            children: [
              Gap(AppLayout.getHeight(40)),
              Text(
                "Tickets",
                style: Styles.headLineStyle1,
              ),
              Gap(AppLayout.getHeight(20)),
              AppTicketTabs(firstTab: "Upcoming", secondTab: "Previous"),
              Gap(AppLayout.getHeight(20)),
              Container(
                padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                child: TicketView(ticket: ticketList[0], isColor: true),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                margin: EdgeInsets.symmetric(horizontal: 15),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnLayout(
                          alignment: CrossAxisAlignment.start,
                          firstText: 'Flutter DB',
                          secondText: 'Passenger',
                        ),
                        AppColumnLayout(
                          alignment: CrossAxisAlignment.end,
                          firstText: '5221 478566',
                          secondText: 'Passport',
                        ),
                      ],
                    ),
                    Gap(AppLayout.getHeight(20)),
                    AppLayoutBuilderWidget(
                      sections: 15,
                      width: 5,
                    ),
                    Gap(AppLayout.getHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnLayout(
                          alignment: CrossAxisAlignment.start,
                          firstText: '0055 4564 99074',
                          secondText: 'Number of E-ticket',
                        ),
                        AppColumnLayout(
                          alignment: CrossAxisAlignment.end,
                          firstText: 'B2SG28',
                          secondText: 'Booking code',
                        ),
                      ],
                    ),
                    Gap(AppLayout.getHeight(20)),
                    AppLayoutBuilderWidget(
                      sections: 15,
                      width: 5,
                    ),
                    Gap(AppLayout.getHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/visa.png',
                                  scale: 11,
                                ),
                                Text(
                                  ' *** 2462',
                                  style: Styles.headLineStyle3,
                                ),
                              ],
                            ),
                            Gap(5),
                            Text(
                              "Payment method",
                              style: Styles.headLineStyle4,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            AppColumnLayout(
                              alignment: CrossAxisAlignment.end,
                              firstText: '\$249.99',
                              secondText: 'Price',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(21),
                    bottomLeft: Radius.circular(21),
                  ),
                  color: Colors.white,
                ),
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15)),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppLayout.getHeight(15)),
                    child: BarcodeWidget(
                      barcode: Barcode.code128(),
                      data: 'https://github.com/martinovovo',
                      drawText: false,
                      color: Styles.textColor,
                      height: 70,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: TicketView(ticket: ticketList[0]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
