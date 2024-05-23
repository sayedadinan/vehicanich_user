import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:vehicanich/blocs/booking_blocs/booking_bloc/booking_bloc.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/my_bookings/cancel_button.dart';
import 'package:vehicanich/widgets/my_bookings/my_booking_details.dart';
import 'package:vehicanich/widgets/my_bookings/time_line_text.dart';

class TimeLineOrder extends StatelessWidget {
  const TimeLineOrder({super.key, required this.widget});
  final BookingDetails widget;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        if (!state.isPending) {
          return Cancel_button(widget: widget);
        } else {
          return Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                _buildTimelineTile(
                  disabled: state.isPending,
                  afterColor: state.isPending
                      ? const Color(0xFF27AA69)
                      : const Color(0xFFDADADA),
                  beforColor: state.isPending
                      ? const Color(0xFF27AA69)
                      : const Color(0xFFDADADA),
                  isLast: false,
                  context: context,
                  isFirst: true,
                  title: 'car is in waiting',
                  message: 'your vehicle is in under checking',
                  color: state.isPending
                      ? const Color(0xFF27AA69)
                      : const Color(0xFFDADADA),
                ),
                _buildTimelineTile(
                  disabled: state.isStarted,
                  afterColor: state.isStarted
                      ? const Color(0xFF27AA69)
                      : const Color(0xFFDADADA),
                  beforColor: state.isStarted
                      ? const Color(0xFF27AA69)
                      : const Color(0xFFDADADA),
                  isLast: false,
                  context: context,
                  isFirst: false,
                  title: 'In progress',
                  message: 'we take your vehicle for work',
                  color: state.isStarted
                      ? const Color(0xFF27AA69)
                      : const Color(0xFFDADADA),
                ),
                _buildTimelineTile(
                  disabled: state.isCompleted,
                  afterColor: state.isCompleted
                      ? const Color(0xFF27AA69)
                      : const Color(0xFFDADADA),
                  beforColor: state.isCompleted
                      ? const Color(0xFF27AA69)
                      : const Color(0xFFDADADA),
                  isLast: false,
                  context: context,
                  isFirst: false,
                  title: 'work completed',
                  message: 'your vehicle work completed ',
                  color: state.isCompleted
                      ? const Color(0xFF27AA69)
                      : const Color(0xFFDADADA),
                ),
                _buildTimelineTile(
                  disabled: state.isCompleted,
                  afterColor: state.isCompleted
                      ? const Color(0xFF27AA69)
                      : const Color(0xFFDADADA),
                  beforColor: state.isCompleted
                      ? const Color(0xFF27AA69)
                      : const Color(0xFFDADADA),
                  context: context,
                  isFirst: false,
                  title: 'ready to pickup',
                  message: 'pay and pick your car',
                  color: const Color(0xFFDADADA),
                  isLast: true,
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildTimelineTile(
      {required bool isFirst,
      required String title,
      required String message,
      required Color color,
      required Color beforColor,
      required Color afterColor,
      required bool isLast,
      required bool disabled,
      required BuildContext context}) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      alignment: TimelineAlign.manual,
      lineXY: 0.2,
      indicatorStyle: IndicatorStyle(
        width: Mymediaquery().mediaquerywidth(0.04, context),
        color: color,
        padding: const EdgeInsets.all(6),
      ),
      endChild: RightChild(
        disabled: disabled,
        title: title,
        message: message,
      ),
      beforeLineStyle: LineStyle(color: beforColor),
      afterLineStyle: isLast ? null : LineStyle(color: afterColor),
    );
  }
}
