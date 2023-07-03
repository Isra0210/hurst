import 'package:flutter/material.dart';
import 'package:hurst/pages/components/base_card_component.dart';
import 'package:hurst/pages/components/rich_text_component.dart';
import 'package:hurst/pages/time_serie_details/time_serie_details_page.dart';
import 'package:hurst/repository/models/time_serie_view_model.dart';

class TimeSerieBodyCardComponent extends StatelessWidget {
  const TimeSerieBodyCardComponent({
    required this.timeSerie,
    super.key,
  });

  final TimeSerieViewModel timeSerie;

  @override
  Widget build(BuildContext context) {
    return BaseCardComponent(
      color: Theme.of(context).colorScheme.background,
      width: MediaQuery.of(context).size.width * 0.86,
      padding: 0,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.22,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              'https://d34u8crftukxnk.cloudfront.net/slackpress/prod/sites/6/4.2.png',
              fit: BoxFit.cover,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                return child;
              },
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.32,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichTectComponent(
                            highlightedLabel: 'Informação: ',
                            label: timeSerie.metaData.information,
                          ),
                          RichTectComponent(
                            highlightedLabel: 'Simbolo: ',
                            label: timeSerie.metaData.symbol,
                          ),
                          RichTectComponent(
                            highlightedLabel: 'Ultima atualização: ',
                            label: timeSerie.metaData.lastRefreshed,
                          ),
                          RichTectComponent(
                            highlightedLabel: 'Tamanho da saída: ',
                            label: timeSerie.metaData.outputSize,
                          ),
                          RichTectComponent(
                            highlightedLabel: 'Fuso horário: ',
                            label: timeSerie.metaData.timezone,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, TimeSerieDetailsPage.route,
                          arguments: timeSerie);
                    },
                    child: BaseCardComponent(
                      width: MediaQuery.of(context).size.width * 0.9,
                      color: Theme.of(context).colorScheme.onSurface,
                      borderRadius: BorderRadius.circular(8),
                      child: Text(
                        'Detalhar',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.background),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
