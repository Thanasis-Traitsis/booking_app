import 'package:bookingapp/utils/app_layout.dart';
import 'package:bookingapp/widgets/layout_builder_widget.dart';
import 'package:bookingapp/widgets/thick_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_styles.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;
  const TicketView({super.key, required this.ticket, this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return SizedBox(
      width: size.width*.85,
      child: Container(
        margin: EdgeInsets.only(right: AppLayout.getHeight(16)),
        child: Column(
          children: [
            // Showing the blue part of the card
            Container(
              decoration: BoxDecoration(
                  color: isColor==null ? Color(0xFF526799) : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppLayout.getHeight(21)),
                    topRight: Radius.circular(AppLayout.getHeight(21)),
                  )),
              padding: EdgeInsets.all(AppLayout.getHeight(16)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        ticket['from']['code'],
                        style:
                            isColor==null ? Styles.headLineStyle3.copyWith(color: Colors.white) : Styles.headLineStyle3,
                      ),
                      Expanded(child: Container()),
                      ThickContainer(isColor: isColor,),
                      Expanded(
                        child: Stack(children: [
                          SizedBox(
                            height: 24,
                            child: AppLayoutBuilderWidget(sections: 6),
                          ),
                          Center(
                            child: Transform.rotate(
                                angle: 1.5,
                                child: Icon(
                                  Icons.local_airport_rounded,
                                  color: isColor==null ? Colors.white : Color(0xFF8ACCF7),
                                )),
                          ),
                        ]),
                      ),
                      ThickContainer(isColor: isColor,),
                      Expanded(child: Container()),
                      Text(
                        ticket['to']['code'],
                        style:
                          isColor==null ? Styles.headLineStyle3.copyWith(color: Colors.white): Styles.headLineStyle3,
                      ),
                    ],
                  ),
                  const Gap(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(
                          ticket['from']['name'],
                          style: isColor==null ? Styles.headLineStyle4
                              .copyWith(color: Colors.white): Styles.headLineStyle4,
                        ),
                      ),
                      Text(
                        ticket['flying_time'],
                        style:
                            isColor==null ? Styles.headLineStyle4.copyWith(color: Colors.white): Styles.headLineStyle4,
                      ),
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(
                          ticket['to']['name'],
                          style: isColor==null ? Styles.headLineStyle4
                              .copyWith(color: Colors.white): Styles.headLineStyle4,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Showing the orange part of the card
            Container(
              color: isColor==null ? Styles.orangeColor : Colors.white,
              child: Row(children: [
                SizedBox(
                  height: AppLayout.getHeight(20),
                  width: AppLayout.getWidth(10),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: isColor==null ?Colors.grey.shade200:Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                Expanded(child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Flex(
                      direction: Axis.horizontal,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        (constraints.constrainWidth() / 15).floor(),
                        (index) => SizedBox(
                          width: 5,
                          height: 1,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: isColor==null ? Colors.white : Colors.grey.shade300),
                          ),
                        ),
                      ),
                    );
                  },
                )),
                SizedBox(
                  height: 20,
                  width: 10,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: isColor==null ?Colors.grey.shade200:Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            // Bottom part of the orange part of the card
            Container(
              decoration: BoxDecoration(
                  color: isColor==null ? Styles.orangeColor : Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular( isColor==null ? 21 : 0),
                    bottomRight: Radius.circular(isColor==null ? 21 : 0),
                  )),
              padding: const EdgeInsets.only(top: 10, left: 16,right: 16,bottom: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                          ticket['date'],
                            style: isColor==null ? Styles.headLineStyle3
                                .copyWith(color: Colors.white): Styles.headLineStyle3,
                          ),
                          const Gap(5),
                          Text(
                            'Date',
                            style: isColor==null ? Styles.headLineStyle4
                                .copyWith(color: Colors.white): Styles.headLineStyle4,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            ticket['departure_time'],
                            style: isColor==null ? Styles.headLineStyle3
                                .copyWith(color: Colors.white): Styles.headLineStyle3,
                          ),
                          const Gap(5),
                          Text(
                            'Departure time',
                            style: isColor ==null ? Styles.headLineStyle4
                                .copyWith(color: Colors.white):Styles.headLineStyle4,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${ticket['number']}',
                            style: isColor==null ? Styles.headLineStyle3
                                .copyWith(color: Colors.white): Styles.headLineStyle3,
                          ),
                          const Gap(5),
                          Text(
                            'Number',
                            style: isColor==null ? Styles.headLineStyle4
                                .copyWith(color: Colors.white): Styles.headLineStyle4,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
