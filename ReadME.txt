Instrucciones de uso:
1. Modificar la cadena de conexión en appsetings.json para usar la cadena de la bbdd local
2. Ejecutar el script "Creación.sql" para crear la BBDD y sus tablas
3. Abrir la solución 
4. Ejecutar el proyecto


La aplicación sigue un enfoque basado en el patrón MVC (Modelo-Vista-Controlador) con elementos adicionales para el procesamiento y la seguridad de los datos.

Los controladores, como ShowsController, manejan solicitudes HTTP y sirven como puntos de entrada para las operaciones de la aplicación. 
Estos controladores y atributos de enrutamiento le permiten asignar solicitudes a métodos específicos dentro de la lógica de su aplicación. 

Un modelo representa una unidad de datos como un programa, red o imagen. 

Estos modelos reflejan la estructura de la base de datos y se utilizan para interactuar con DbContext. DbContext en este caso es DataContext, 
que hereda de DbContext de Entity Framework, defina la configuración de la relación entre DbSet y cada entidad del modelo en el método OnModelCreating. 

Se Utiliza Entity Framework Core para la persistencia de datos. 
La configuración en memoria para pruebas unitarias demuestra la flexibilidad del contexto de datos al permitir operaciones CRUD sin utilizar una base de datos real. 

La aplicación implementa seguridad mediante JWT (JSON Web Token), que genera un token en el método CreateKey del controlador ShowsController. 
La autorización se aplica a nivel de controlador utilizando el atributo [Autorizar] para garantizar que una ruta particular requiera autenticación.

La autorización se aplica a nivel de controlador con el atributo [Authorize], lo que asegura que ciertas rutas requieran autenticación.