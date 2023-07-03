import 'package:flutter/material.dart';
import 'package:hurst/repository/models/serie_view_model.dart';

import '../components/rich_text_component.dart';

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
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Theme.of(context).colorScheme.shadow,
                    child: Icon(
                      Icons.clear,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichTectComponent(
                  highlightedLabel: 'Aberto: ',
                  label: serie.open,
                ),
                RichTectComponent(
                  highlightedLabel: 'Alta: ',
                  label: serie.high,
                ),
                RichTectComponent(
                  highlightedLabel: 'Baixa: ',
                  label: serie.low,
                ),
                RichTectComponent(
                  highlightedLabel: 'Fechada: ',
                  label: serie.close,
                ),
                RichTectComponent(
                  highlightedLabel: 'Volume: ',
                  label: serie.volume,
                ),
                Visibility(
                  visible: serie.adjustedClose != null,
                  child: RichTectComponent(
                    highlightedLabel: 'Ajuste fechado: ',
                    label: serie.adjustedClose ?? '',
                  ),
                ),
                Visibility(
                  visible: serie.dividendAmount != null,
                  child: RichTectComponent(
                    highlightedLabel: 'Valor do dividendo: ',
                    label: serie.dividendAmount ?? '',
                  ),
                ),
                Visibility(
                  visible: serie.dividendAmount != null,
                  child: RichTectComponent(
                    highlightedLabel: 'Coeficiente de divisão: ',
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
