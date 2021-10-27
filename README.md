# Sistema de Reservas para Hotel
###  Escenario:
Un prestigioso hotel desea llevar a cabo un sistema para la informatización de las reservas de sus diferentes habitaciones que tiene disponibles.
Cada habitación cuenta con un número identificatorio, el piso donde se encuentra, un nombre según su temática, el tipo (single, doble, triple o múltiple) y el precio por noche.
Para poder realizar una reserva de una habitación es necesario contar con la fecha de check-in (ingreso al hotel) y fecha de check-out (egreso del hotel). Antes de confirmar una reserva, el sistema deberá verificar que la habitación solicitada no esté reservada en el período de tiempo que se haya elegido. Por ejemplo, si la habitación está reservada del 14/07 al 21/07 y la nueva reserva es del 12/07 al 15/07 no deberá permitir realizar la misma, dado que la fecha de check-out interfiere con fechas en la que se encuentra ocupada la habitación.
A partir de la cantidad de días que se hospede la persona y del tipo de habitación que haya elegido, el sistema deberá devolver el monto total de la estadía; al mismo tiempo, se deberá verificar que la cantidad de personas que se hospedarán no supere la cantidad establecida por el tipo de habitación; estas cantidades se detallan a continuación:

![](https://raw.githubusercontent.com/sgcm14/hotel/master/doc/tabla.jpg)

Además de verificar las fechas de reservación, la cantidad de personas a hospedarse, etc, es necesario registrar los datos del huésped que se hará cargo de la reserva. Entre estos datos es necesario solicitar: dni, nombre, apellido, fecha de nacimiento, dirección y profesión. Por cuestiones de privacidad del hotel, no se registrarán los datos de los acompañantes.
El sistema está pensado para ser utilizado únicamente por los EMPLEADOS del hotel, por lo que la interfaz gráfica y la utilización debe ser pensada de esta manera (no como un sistema de reservas online).
Para la administración de los empleados, cada uno de ellos contará con un usuario y contraseña que le permitirá ingresar al sistema; para ello, cada uno de ellos deberá de estar registrado en el sistema con sus correspondientes datos personales (dni, nombre, apellido, fecha de nacimiento, dirección y cargo). Cabe destacar que los empleados reciben bonificaciones monetarias por cantidad de reservas realizadas por día, por lo que cada reserva debe tener asignada el usuario que la dio de alta.
Por otra parte, el sistema deberá poder permitir visualizar las siguientes consultas/informes:
a. Todas las reservas realizadas en un determinado día.
b. Todos los huéspedes registrados en el sistema.
c. Lista de las reservas realizadas por un determinado empleado.
d. Listas de todas las reservas realizadas por un determinado huésped en un período desde/hasta.

Aqui se muestra el modelado de la Base de datos que luego se mapeo con jpa
![](https://raw.githubusercontent.com/sgcm14/hotel/master/doc/uml.png)
> UML de la base de datos

Aqui se muestra la pantalla que permite al usuario admin ingresar por defecto la clave es admin
![](https://raw.githubusercontent.com/sgcm14/hotel/master/doc/pantalla1.jpg)
> Pantalla de Login

Aqui se muestra la pantalla inicial donde se muestran las reservas, ya que es una operación importante solo se permite registrar **Nueva Reserva** también lista todas las reservas y por último permite **Eliminar** la operación
![](https://raw.githubusercontent.com/sgcm14/hotel/master/doc/pantalla2.jpg)
> Pantalla de Reservas

Aqui se muestra la pantalla donde se puede registrar una nueva reserva, una vez llenado todos los campos correctamente, si todo es válido te permitirá registrarlo, también permite que puedes registrar a un **Nuevo Huesped** ya que si no está registrado no permitirá hacer la reserva
![](https://raw.githubusercontent.com/sgcm14/hotel/master/doc/pantalla3.jpg)
> Pantalla de Reservas - Registrar

Aqui se muestra la pantalla donde se muestran las habitaciones,  permite registrar **Nueva Habitación** también lista todas las habitaciones, puedes **Editar** la habitación y por último permite **Eliminar** la habitación
![](https://raw.githubusercontent.com/sgcm14/hotel/master/doc/pantalla4.jpg)
> Pantalla de Habitaciones

Aqui se muestra la pantalla donde se muestran los Huéspedes,  permite registrar **Nuevo Huésped** también lista todos los Huéspedes, puedes **Editar** al Huésped y por último permite **Eliminar** al Huésped
![](https://raw.githubusercontent.com/sgcm14/hotel/master/doc/pantalla5.jpg)
> Pantalla de Huéspedes

Aqui se muestra la pantalla donde se muestran los Usuarios,  permite registrar **Nuevo Usuario** también lista todos los Usuarios, puedes **Editar** al Usuario y por último permite **Eliminar** al Usuario
![](https://raw.githubusercontent.com/sgcm14/hotel/master/doc/pantalla6.jpg)
> Pantalla de Usuarios

Para terminar durante toda la ejecución de la aplicación, persiste los datos del usuario logueado y permite **Cerrar Sesión** en cualquier momento. 

**Realizado por :** Sammy Gigi Cantoral Montejo (sgcm14)

<img src ="https://raw.githubusercontent.com/sgcm14/sgcm14/main/sammy.jpg" width="200">
