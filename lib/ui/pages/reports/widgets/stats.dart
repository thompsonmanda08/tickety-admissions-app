import 'package:flutter/widgets.dart';
import 'package:tickety_admission/ui/pages/reports/widgets/tile.dart';
import 'package:tickety_admission/values/colors.dart';

class Stats extends StatelessWidget {
  const Stats({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Tile(
          color: neutralColor100,
          iconBGColor: kPrimaryColor,
          statNameColor: neutralColor600,
          statValueColor: neutralColor900,
          statName1: 'Tickets Sold',
          statName2: 'Tickets Admitted',
          statValue1: '13,467',
          statValue2: '13,467',
        ),
        const SizedBox(height: 20),
        Tile(
          color: kGreenColor,
          iconBGColor: neutralColor900.withOpacity(0.10),
          statNameColor: neutralColor200,
          statValueColor: neutralColor200,
          statName1: 'Cash Sales',
          statName2: 'Tickets Sold',
          statValue1: 'K13,467',
          statValue2: '200',
        ),
        const SizedBox(height: 20),
        Tile(
          color: kPurpleColor,
          iconBGColor: neutralColor900.withOpacity(0.10),
          statNameColor: neutralColor100,
          statValueColor: neutralColor200,
          statName1: 'Mobile Money',
          statName2: 'Tickets Sold',
          statValue1: 'K7,467',
          statValue2: '560',
        )
      ],
    );
  }
}
