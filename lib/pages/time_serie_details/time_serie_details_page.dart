import 'package:flutter/material.dart';
import 'package:hurst/pages/components/base_card_component.dart';
import 'package:hurst/pages/components/rich_text_component.dart';
import 'package:hurst/pages/time_serie_details/time_serie_details_component.dart';
import 'package:hurst/repository/models/serie_view_model.dart';

import '../../repository/models/time_serie_view_model.dart';

class TimeSerieDetailsPage extends StatelessWidget {
  const TimeSerieDetailsPage({super.key});

  static const route = "/details";

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

    TimeSerieViewModel timeSerie =
        ModalRoute.of(context)!.settings.arguments as TimeSerieViewModel;

    List<String> keys =
        List.from(timeSerie.timeSerie.keys.toList() as List<String>);

    List<SerieViewModel> series = keys.map((key) {
      if (timeSerie.timeSerie[key]['5. adjusted close'] == null) {
        return SerieViewModel(
          id: key,
          open: timeSerie.timeSerie[key]['1. open'],
          high: timeSerie.timeSerie[key]['2. high'],
          low: timeSerie.timeSerie[key]['3. low'],
          close: timeSerie.timeSerie[key]['4. close'],
          volume: timeSerie.timeSerie[key]['5. volume'],
        );
      }

      return SerieViewModel(
        id: key,
        open: timeSerie.timeSerie[key]['1. open'],
        high: timeSerie.timeSerie[key]['2. high'],
        low: timeSerie.timeSerie[key]['3. low'],
        close: timeSerie.timeSerie[key]['4. close'],
        adjustedClose: timeSerie.timeSerie[key]['5. adjusted close'],
        volume: timeSerie.timeSerie[key]['6. volume'],
        dividendAmount: timeSerie.timeSerie[key]['7. dividend amount'],
        splitCoefficient: timeSerie.timeSerie[key]['8. split coefficient'],
      );
    }).toList();

    return Scaffold(
      key: scaffoldkey,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          "Detalhes",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              ...series.map(
                (serie) => GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      builder: (context) {
                        return TimeSerieDetailsComponent(serie: serie);
                      },
                    );
                  },
                  child: BaseCardComponent(
                    borderRadius: BorderRadius.circular(8),
                    height: MediaQuery.of(context).size.height * 0.13,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    color: Theme.of(context).colorScheme.background,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichTectComponent(
                                    highlightedLabel: 'Aberto: ',
                                    label: serie.open,
                                  ),
                                  RichTectComponent(
                                    highlightedLabel: 'Alta: ',
                                    label: serie.high,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichTectComponent(
                                    highlightedLabel: 'Baixa: ',
                                    label: serie.low,
                                  ),
                                  RichTectComponent(
                                    highlightedLabel: 'Fechada: ',
                                    label: serie.close,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
