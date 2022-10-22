# Direccion de Gobierno Digital DevOps Desafío

## Prólogo

Este desafío está destinado más a ver cómo abordarías o resolverías un problema y no 
tanto a ver qué tan correcta o incorrecta es una solución. Por eso, lo más importante
es que resuelvas el problema y luego, si te queda tiempo, sorpréndenos con tus detalles
de la implementación. 

- Las **Instrucciones** a continuación son pasos generales para comenzar.

- La sección **Desafíos** tiene los desafíos propuestos, para que los resuelvas de la mejor forma que estimes conveniente.

  Para cada desafío enumerado a continuación, puedes proponer tu desarrollo. 
  Siempre es una ventaja si puede ejecutar en el computador del revisor. 

## Instrucciones

1. Descarga este repositorio y, usándolo como base, crea un nuevo repositorio **privado**.
2. Sube tu código, instrucciones o cualquier otro artefacto que hayas generado como parte de tus respuestas, a tu repositorio privado.
3. Una vez que tu repositorio esté listo para la revisión, agrega al usuario `friveroscl` como colaborador para que lo pueda descargar.
4. Espera nuestra respuesta.

## Estructura del repositorio

El stack de la aplicaciones de ejemplo es un sitio de blogs sociales (es decir, un clon de Medium.com) llamado "Conduit". 
Utiliza una API personalizada para todas las solicitudes, incluida la autenticación.

**En este repositorio, encontrarás:**

- [./api](./api):

  - Especificación de API y algunas utilidades para probar el backend.

- [./src/frontend](./src/frontend):

  - Código fuente para la aplicación de interfaz de usuario de interfaz de usuario usando React.js. Puedes leer más al respecto en [./src/frontend/README.md](./src/frontend/README.md).
  - Localmente, la aplicación se ejecuta en http://localhost:4100

- [./src/backend.v1](./src/backend.v1):

  - Código fuente para el código del servidor backend heredado. Esto está escrito en Golang, y puedes leer más al respecto en [./src/backend.v1/readme.md](./src/backend.v1/readme.md).
  - Localmente, la aplicación se ejecuta en http://localhost:8080

- [./src/backend.v2](./src/backend.v2):

  - Código fuente para el nuevo código del servidor backend que aún estamos desarrollando. Esto está escrito en .NET Core, y puedes leer más al respecto en [./src/backend.v2/readme.md](./src/backend.v2/readme.md).
  - Localmente, la aplicación se ejecuta en http://localhost:5000

## Desafíos

Los siguientes desafíos están relacionados con el repositorio. Para dar su opinión sobre el desafío, recuerde subir sus respuestas a su repositorio.

### 1. ¿Podemos contenerizar estos servicios?

Hemos escuchado cosas buenas docker y pensamos qué pasaría si lo traemos a nuestro stack de aplicaciones.

¿Puedes ayudar a Dockerizar `frontend`, `backend.v1` y `backend.v2`?

Hemos proporcionado un `Dockerfile` básico en la carpeta de cada servicio para ayudarlo a comenzar.

**R: se completa un Dockerfile para frontend [./src/frontend/Dockerfile](./src/frontend/Dockerfile), backend.v1 [./src/backend.v1/Dockerfile](./src/backend.v1/Dockerfile), backend.v2 [./src/backend.v2/Dockerfile](./src/backend.v2/Dockerfile)**

### 2. ¿Podemos automatizar la construcción del contenedor?

Actualmente, nuestros desarrolladores tienen que ejecutar manualmente `docker build` después de realizar cambios. ¿Puedes escribir un docker-compose para automatizar el proceso de compilación y comenzar un nuevo contenedor con la imagen actualizada?

**R: se agrega un docker-compose.yml en la raiz que permite iniciar frontend, backend.v1 y backend.v2. Habría que definir un variable de entorno en el Dockerfile del frontend para apuntar a la api root que se desee usar. Por el momento sólo levanta los 3 proyectos en los puertos 4100, 8080 y 5000. Los script de testing run-api-tests.sh y run-api-tests-ddiaz.sh para lanzar los test del backend. El front inicia pero lanza un error. Eso quedaría pendiente investigar porqué el front está lanzando error.**

### 3. ¿Has oído hablar de Kubernetes?

[Kubernetes](https://kubernetes.io/) parece una gran herramienta para ayudarnos con la implementación, el escalado y la administración de estos servicios en contenedores.

¿Puedes crear un archivo `yaml` para cada servicio con los recursos necesarios de Kubernetes que nos permitirá escalarlos en el futuro?

**R: Se crea archivo [k8s-manifests](./k8s-manifests) utilizando Kompose para hacer un archivo rápido de ejemplo**

### 4. ¿Has oído hablar de Infraestructura como código?

La infraestructura como código (IaC) es muy popular.

[Terraform](https://www.terraform.io/) es una infraestructura de código abierto como herramienta de código desarrollada por HashiCorp.

¿Puedes crear un archivo `tf` para realizar el despliegue del cluster de kubernetes creado en el paso anterios?

**R: Se crea archivo [app.tf](./app.tf) utilizando tfk8s para hacer un archivo rápido de ejemplo**

**Es bueno tener:** Sería una demostración genial para nuestras partes interesadas si pudiéramos poner las aplicaciones en línea y pudieran acceder a ellas desde su computadora.

**R: queda funcionando en ddiaz.cl puertos 4100, 8080 y 5000. El frontend está apuntando a la api en 8080**

Está bien si es solo una dirección IP o un nombre de dominio aleatorio.
