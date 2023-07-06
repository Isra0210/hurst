## Configuração inicial das traduções

### Criando uma nova palavra ou sentença
Para criar uma nova palavra, basta incluir novo getter no arquivo `translations`

path: `lib\i18n\strings`

Arquivo: `translations.dart`
```dart
String get anotherString;
```

Seu arquivo translations.dart ficará assim:
```dart
abstract class ITranslations {
  String get signIn;
  String get anotherString;
}
```

> Isenção de responsabilidade:
Sempre crie um getter no arquivo `translations.dart` para evitar que uma nova palavra seja esquecida para traduzir.

Depois de incluir uma nova string na interface ITranslations, todos os seus arquivos de strings que implementam ITranslations serão quebrados, portanto, o próximo passo é criar uma palavra em cada idioma específico.

Seu arquivo `en_US.dart` ficará assim:
```dart
class EnUs implements ITranslations {
  @override
  String get signIn => 'SIGNIN';

  @override
  String get anotherString => 'Lorem Ipsum';
}
```

Crie a mesma String para cada arquivo de tradução no projeto.
- `pt_us.dart`
- `pt_br.dart`



## Como usar

#### Primeiras coisas primeiro:

Importe a classe de recursos usando:
```dart
import 'package:hurst/i18n/resources.dart';
```

Esta classe tem uma classe estática chamada `strings` que pode ser acessada por:
`R.string.helloWorld`

Exemplo:
Mau
```dart
AnyWidget(
  child: Text('Hello World')
)
```
Bom
```dart
AnyWidget(
  child: Text(R.string.loginPhone)
)
```