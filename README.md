# Coin App - Flutter + MVVM + CoinMarketCap API

Este projeto é um aplicativo Flutter desenvolvido com arquitetura MVVM (Model-View-ViewModel), que consome a [CoinMarketCap API](https://coinmarketcap.com/api/) para exibir informações em tempo real sobre criptomoedas. O app permite a busca de múltiplas moedas por símbolo (ex: BTC, ETH) e exibe os preços convertidos para **USD** e **BRL**, além da variação percentual nas últimas 24 horas.

## Arquitetura

O projeto segue o padrão **MVVM**, organizado em camadas:

- `models/` — Define as entidades e modelos de dados.
- `datasources/` — Responsável por acessar APIs externas (neste caso, CoinMarketCap).
- `repositories/` — Camada de abstração sobre os dados.
- `viewmodels/` — Contém a lógica de apresentação e controle de estado.
- `views/` — Telas, widgets e interações visuais.

## Funcionalidades

-  Buscar criptomoedas por símbolo (ex: BTC, ETH, SOL).
-  Visualização do preço atual em **USD** e **BRL**.
-  Exibição da variação percentual em 24h.
-  Interface intuitiva e com suporte a **Refresh** e **BottomSheet com detalhes**.

---

##  Como rodar o projeto localmente

### Pré-requisitos

- Flutter SDK (versão >= 3.10.0)
- Dart SDK
- Android Studio / VS Code com emulador configurado
- Conta e chave de API da [CoinMarketCap](https://coinmarketcap.com/api/)

### 1. Clone o repositório

```bash
git clone https://github.com/joaovitorcruzz/coin_app.git
cd coin_app
```

### 2. Instale as dependências

```bash
flutter pub get
```

### 3. Configure a chave da API

Abra o arquivo:

```
lib/core/http_service.dart
```

E substitua a constante `_apiKey` pela sua chave da API CoinMarketCap:

```dart
static const String _apiKey = 'SUA_API_KEY_AQUI';
```

### 4. Rode o app

```bash
flutter run
```

---
