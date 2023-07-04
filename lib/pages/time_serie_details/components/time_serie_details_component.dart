import 'package:flutter/material.dart';
import 'package:hurst/i18n/i18n.dart';
import 'package:hurst/pages/time_serie_details/components/close_bottom_sheet_component.dart';
import 'package:hurst/repository/models/serie_view_model.dart';

import '../../components/rich_text_component.dart';

class TimeSerieDetailsComponent extends StatelessWidget {
  const TimeSerieDetailsComponent({required this.serie, super.key});

  final SerieViewModel serie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 26.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      serie.id.substring(0, 10),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    serie.adjustedClose == null
                        ? Text(
                            serie.id.substring(11, 16),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          )
                        : const SizedBox(),
                  ],
                ),
                const CloseBottomSheetComponent(),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichTectComponent(
                  highlightedLabel: '${R.string.open}: ',
                  label: serie.open,
                ),
                RichTectComponent(
                  highlightedLabel: '${R.string.high}: ',
                  label: serie.high,
                ),
                RichTectComponent(
                  highlightedLabel: '${R.string.low}: ',
                  label: serie.low,
                ),
                RichTectComponent(
                  highlightedLabel: '${R.string.closed}: ',
                  label: serie.close,
                ),
                RichTectComponent(
                  highlightedLabel: '${R.string.volume}: ',
                  label: serie.volume,
                ),
                Visibility(
                  visible: serie.adjustedClose != null,
                  child: RichTectComponent(
                    highlightedLabel: '${R.string.adjustedClose}: ',
                    label: serie.adjustedClose ?? '',
                  ),
                ),
                Visibility(
                  visible: serie.dividendAmount != null,
                  child: RichTectComponent(
                    highlightedLabel: '${R.string.dividendAmount}: ',
                    label: serie.dividendAmount ?? '',
                  ),
                ),
                Visibility(
                  visible: serie.dividendAmount != null,
                  child: RichTectComponent(
                    highlightedLabel: '${R.string.splitCoefficient}: ',
                    label: serie.splitCoefficient ?? '',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
