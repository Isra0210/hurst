## Estrutura da aplicação
---
 * [Assets](../../lib/assets/) `-> Onde fica todas as imagems local do app`
	* [Screenshot](../../lib/assets/screenshot/) `-> Onde contem algumas captura de tela do app`
 * [i18n](../../lib/i18n/) `-> arquivo de internacionalização` [para mais detalhes](../translation/config-i18n.md)
 * [Pages](../../lib/pages/)
   * [Componentes](../../lib/pages/components/) `-> Componentes que são utilizados em mais de um lugar`
   		* [Card base](../../lib/pages/components/base_card_component.dart) `-> Container customizável`
			```dart
			const BaseCardComponent({
				required this.child,
				required this.color,
				this.enableBoxShadow = true,
				this.padding = 12,
				this.borderRadius,
				this.margin,
				this.height,
				this.width,
				super.key,
			});
			```
		* [Rich text component](../../lib/pages/components/rich_text_component.dart) `-> Esse componente concatena uma string com um weight bold com um weight normal, utilizando RichText`
			```dart
			const RichTectComponent({
				required this.highlightedLabel,
				required this.label,
				super.key,
			});
			```
		* [Card da serie temporal](../../lib/pages/components/time_serie_body_card_component.dart) `-> Card da home que mostra as informações principis da serie temporal`
	* [Tela de favoritos](../../lib/pages/favorites/favorite_page.dart) `-> Tela que permite o usuário a visualizar seus favoritos`
	* [Home](../../lib/pages/home/)
		* [Componentes](../../lib/pages/home/components/) `-> Componentes utilizado apenas na home`
			* [Skeleton](../../lib/pages/home/components/skeleton_component.dart) `-> Componente de loading do card principal da home`
		* [Cubit](../../lib/pages/home/cubit/) `-> Gere o estado da Home`
			* [Serie temporal favorita](../../lib/pages/home/cubit/favorite_time_serie/) `-> Cuida da parte de favoritar uma série temporal`
			* [Selecionar a serie temporal](../../lib/pages/home/cubit/filter_time_serie_by_index/) `-> Seleciona o index de qual serie temporal ira destacar na home`
			* [Carrega as series temporais](../../lib/pages/home/cubit/time_serie/) `-> Responsável por carregar a lista de serie temporal do repositório`
		* [Home page](../../lib/pages/home/home_page.dart) `-> Tela principal da aplicação`
	* [Splash page](../../lib/pages/splash/splash_page.dart) `-> Além da Splash nativa que foi configurado foi criado essa tela que é chamada enquanto carrega as dependências do app`
		* main
			```dart
			void main() async {
				WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
				FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
				//Tela que é chamada enquanto é carregada as dependências e config do app
				runApp(const SplashPage());
				//Foi configurado o firebase pois ia utilizar para enviar a versão
				await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
				runApp(const MyApp());
			}
			```
	* [Detalhes da serie temporal](../../lib/pages/time_serie_details/) `-> Tela de detalhes da serie temporal`
		* [Componentes](../../lib/pages/time_serie_details/components/) `-> Componentes utilizado apenas na tela de detalhes`
			* [Componente que bottom sheet](../../lib/pages/time_serie_details/components/close_bottom_sheet_component.dart)
			* [Componente de filtro para ordenar a lista](../../lib/pages/time_serie_details/components/order_component.dart)
			* [Componente que detalha os dados de valores e tempo da serie temporal](../../lib/pages/time_serie_details/components/time_serie_details_component.dart)
		* [Cubit](../../lib/pages/time_serie_details/cubit/) `-> Gere o estado da página de detalhes`
			* [Ordenar a lista](../../lib/pages/time_serie_details/cubit/oreder_list/) `-> Gere o estado na alteração dos filtros de ordenação`
	* [Tela dos detalhes da serie temporal](../../lib/pages/time_serie_details/time_serie_details_page.dart)
 * [Repositorio](../../lib/repository/) `-> Repositório da aplicação`
	* [Api](../../lib/repository/api/)
		* [Serie temporal api](../../lib/repository/api/time_serie_repository.dart) `-> Comunica com api para puxar os dados`
	* [Models](../../lib/repository/models/) `-> Models e serialização dos dados`
		* [Meta data](../../lib/repository/models/meta_data_view_model.dart)
		* [Serie](../../lib/repository/models/serie_view_model.dart)
		* [Serie temporal](../../lib/repository/models/time_serie_view_model.dart)
 * [Tema](../../lib/theme/)
	 * [Tema do app](../../lib/theme/app_theme.dart) `-> Onde é configurado o tema claro e escuro`
	 * [Cor do tema](../../lib/theme/color_theme.dart) `-> Onde fica as constantes das cores do Tema "HCColors"`
	 * [Tema de texto](../../lib/theme/text_theme.dart) `-> Onde fica as configurações de texto da aplicação`
 * [main](../../lib/main.dart) `-> root da aplicação`
 * [README.md](../../README.md) <span style='color: red;'>(importante)</span>
