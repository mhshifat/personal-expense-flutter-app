import 'package:flutter/material.dart';

class TransactionChartBar extends StatelessWidget {
  final double amount;
  final double percent;
  final String weekday;

  const TransactionChartBar(this.amount, this.percent, this.weekday, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 35,
          height: 20,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "\$${amount.toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        SizedBox(
          width: 10,
          height: 60,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 8, color: Colors.grey),
                  color: Colors.grey,
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percent,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 8, color: Theme.of(context).primaryColor),
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  ),
                ),
              )
            ],
          ),
        ),
        Text(weekday),
      ],
    );
  }
}
