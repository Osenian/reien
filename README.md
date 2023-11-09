# reien

## Equipo

Rodrigo Torrez Queupán: Encargado de diseño.
Eric Rojas Palma: Desarrollador Principal.
Italo Pereda Soza: Arquitecto de Software.

## Caso de Uso

El caso de uso de la aplicación consiste en la toma de quiz y estudio de inglés. La característica a implementar es la funcionalidad de compartir contenido en redes sociales.

## Diseño

Pendiente

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

Pendiente