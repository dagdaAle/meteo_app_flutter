# Weather App

Una semplice applicazione Flutter per visualizzare le previsioni meteo di una specifica città utilizzando l'API di OpenWeatherMap.

## 🌟 Funzionalità

- 🔍 Ricerca delle condizioni meteo per una specifica città.
- 🌡️ Visualizzazione delle condizioni meteo attuali, tra cui temperatura e descrizione del meteo.
- ⏳ Interfaccia utente reattiva che mostra il caricamento e gli errori.

## 🛠️ Architettura BLoC

In questa applicazione, abbiamo adottato il pattern BLoC (Business Logic Component) per separare la logica di business dall'interfaccia utente. Questo permette di avere un codice più pulito, testabile e facilmente gestibile.

### Vantaggi di BLoC:

- 🧩 **Separazione delle responsabilità**: BLoC mantiene la logica di business separata dall'interfaccia utente.
- 🌊 **Reattività**: Utilizzando stream e sink, BLoC può reagire ai cambiamenti e aggiornare l'UI di conseguenza.
- 🧪 **Testabilità**: Essendo separato dall'UI, il BLoC può essere testato indipendentemente.

### Struttura del BLoC nella Weather App:

1. **Eventi (`weather_event.dart`)**: Sono i vari stimoli inviati all'BLoC. Nella nostra app, abbiamo principalmente l'evento `GetWeather` che viene invocato quando l'utente vuole ottenere le previsioni meteo per una città.
2. **Stati (`weather_state.dart`)**: Rappresentano le diverse condizioni della nostra app. Abbiamo stati come `WeatherInitial` (stato iniziale), `WeatherLoading` (quando i dati sono in fase di caricamento), `WeatherLoaded` (quando i dati sono disponibili) e `WeatherError` (in caso di errori).
3. **BLoC (`weather_bloc.dart`)**: Questo è il cuore del pattern BLoC. Riceve gli eventi, elabora la logica di business e emette nuovi stati. Nella nostra app, quando il BLoC riceve un evento `GetWeather`, effettua una chiamata all'API meteo e, a seconda della risposta, emette uno dei possibili stati.

## 🚀 Esecuzione del progetto

1. Assicurati di avere installato Flutter e Dart.
2. Clona questo repository.
3. Esegui `flutter pub get` per installare le dipendenze.
4. Esegui `flutter run` per avviare l'app sul tuo emulatore o dispositivo.
