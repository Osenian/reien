# reien

## Equipo

* Rodrigo Torrez Queupán: Encargado de diseño.
* Eric Rojas Palma: Desarrollador Principal.
* Italo Pereda Soza: Arquitecto de Software.

## Caso de Uso

El caso de uso de la aplicación consiste en la toma de quiz y estudio de inglés. La característica a implementar es la funcionalidad de compartir contenido en redes sociales.

## Diseño

Para el diseño de la aplicación se tuvieron en consideración diversos factores, como lo puede ser un orden estructurado de los bloques en pantalla, que los colores presentes logren una armonia entre si y evitar asi una sobresaturación de los elementos en pantalla, asi como una disposición adecuada en la selección de preguntas y resultados, esto con el fin de mantener un mejor entendimiento.
![WhatsApp Image 2023-11-14 at 2 34 29 AM](https://github.com/AgustinSoza13/reien/assets/57378896/7258087e-4216-48ec-9bac-eb5dab3505fd)

## Implementación

Para la implementación de la característica al proyecto, es necesario en primer lugar añadir el paquete _share_plus_ al archivo `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  share_plus: ^7.2.1
```

Luego de añadir el paquete, se instala a través del comando `flutter pub get`.

Al finalizar la instalación, ya es posible utilizar el paquete donde se requiere, para esto se debe importar el paquete a través de la siguiente línea de código:

```dart
import 'package:share_plus/share_plus.dart';
```

Para compartir texto, se utiliza el método `Share.share()` del paquete. Un ejemplo de esta implementación se muestra a continación:

```dart
OutlinedButton(
    onPressed: () {
        Share.share('I am studying grammar');
    },
    child: const Text("Study"),
),
```

Este bloque de código representa un botón que, al ser presionado, activa el proceso de compartir texto a alguna red social.

Para compartir una imagen, se utiliza el método `Share.ShareXFiles()` del paquete:

```dart
OutlinedButton(
    onPressed: () async {
        final img = await rootBundle.load('images/congratulations.png');
        final bufferImg = img.buffer;
        Share.shareXFiles(
            [
                XFile.fromData(
                    bufferImg.asUint8List(
                        img.offsetInBytes,
                        img.lengthInBytes,
                    ),
                    name: 'Congratulations!',
                    mimeType: 'image/png',
                ),
            ],
            subject: 'Reien Quiz Results',
        );
    },
    child: const Text('Share results'),
),
```

Este bloque de código representa un botón que, al ser presionado, activa el proceso de compartir una imagen a alguna red social. Esta implementación utiliza `rootBundle.load()` y `buffer` para entregarle al constructor `XFile.fromData()` la imagen almacenada como una _Uint8List_ y así el método `Share.shareXFiles()` obtenga el formato adecuado. Además se especifica una propiedad `subject:` en caso de que sea compartida por correo electrónico.

## Arquitectura

La arquitectura MVC consiste en separar la lógica de modelo, vista y controlador, esta lógica se describe de la siguiente manera:

### Modelo

El modelo se enfoca en representar los datos y manejar la lógica de la aplicación. Aquí es donde se almacenan y procesan los datos, y el modelo es responsable de gestionar la funcionalidad y el comportamiento de la aplicación. En nuestro caso, son las clases que están en la carpeta `screens`, estas clases son _Home_, _Grammar_, _Fila_, _QuizTenses_ y _QuizNouns_, siendo estas dos últimas donde se encuentra la operación principal de compartir contenido a redes sociales al momento de presionar el botón “Share Result”. De forma similar, los botones “Study” de la clase _Grammar_ también pueden compartir contenido. 

### Vista

La vista es la representación visual e interfaz de usuario. Su objetivo es mostrar los datos que provienen del modelo de una forma comprensible y atractiva para el usuario. En la aplicación se puede ver al momento de utilizar diferentes Widgets como ListView, AppBar, entre otros.

### Controlador  

El controlador actúa como intermediario entre el modelo y la vista, siendo su función manejar las interacciones del usuario, como las entradas mediante botones y campos de textos. Como se mencionó anteriormente, en la aplicación se presiona un botón que ejecuta la acción de compartir contenido a alguna red social. Esta funcionalidad la realiza el controlador, en donde recepciona la información, activa la operación de clase y finalmente lleva a cabo la acción de compartir la imagen.
