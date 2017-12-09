# Práctica Super Swift:MVVM-RxSwift-CoreData. KC Bootcamp V 

## Enunciado

Completar la funcionalidad de la aplicación cedida por el profesor [Guillermo González](https://github.com/gonzalezreal). El core de la aplicación es mostrar el contenido del API de la página [The Movie Database](https://www.themoviedb.org/).

Puntos a completar:

1 - Ocultar el scrollview y mostrar un activity indicator mientras se cargan los contenidos de la pantalla de Featured.

2- Hacer presenter para person detail.

3- Navegación de cast a detalle de persona.


## Detalles para la instalación y ejecución

```
$ mkdir TMDB_iOS
$ cd TMDB_iOS
$ git clone https://github.com/gemambu/TMDb_iOS.git
$ carthage build --platform iOS
$ cp Keys.sample.xcconfig Keys.xcconfig
```

Generar el fichero que contendrá la api_key, está en el path: _TMDbCore/Config/Keys.xcconfig_. Este fichero deberá seguir el siguiente formato:

` TMDB_API_KEY = personal-api-key ` 

Donde _personal-api-key_ es la clave personal para poder acceder al contenido del api de The Movie Database.

 Más información acerca de la clave [aquí](https://developers.themoviedb.org/3/getting-started/authentication).


## Extras

Además de los 3 ejercicios obligatorios planteados en la práctica, he añadido las siguientes funcionalidades / detalles.

- Pila de portadas con las películas y/o series más famosas en el detalle de **Person**. Para esto, se añade a la petición los campos de _tagged_images_ y _combined_credits_.

- Detalle de **Show**: Al igual que para película y Persona, se añade el detalle para show de TV.

- En detalle de **Movie**: si el dato de duración es 0 minutos (o no est informado), no se muestra este campo en la cabecera.

- Recursos en Inglés y Español. La aplicación mostrará los textos en Inglés o Español, en función de la localización. Por defecto, el idioma mostrado es Inglés.

- Logo para la aplicación. Diseñado con [Logojoy](https://logojoy.com). Iconos creados con [Makeappicon](https://makeappicon.com/)

### Demos


[Demo en Inglés](https://media.giphy.com/media/3oxHQA09c0uoWRtYoo/giphy.gif)

![](https://media.giphy.com/media/3oxHQA09c0uoWRtYoo/giphy.gif)


[Demo en Español](https://media.giphy.com/media/3oxHQCnhFXzyS9L62k/giphy.gif)

![](https://media.giphy.com/media/3oxHQCnhFXzyS9L62k/giphy.gif)


