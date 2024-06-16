-- Crear tablas básicas sin dependencias
CREATE TABLE IF NOT EXISTS "actor" (
    "id" integer NOT NULL,
    "nombre" TEXT NOT NULL,
    CONSTRAINT "actor_pk" PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "genero" (
    "id" integer NOT NULL,
    "nombre" TEXT NOT NULL,
    CONSTRAINT "genero_pk" PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "peliculas" (
    "id" integer NOT NULL,
    "titulo" TEXT NOT NULL,
    "sinopsis" TEXT NOT NULL,
    "imagen_url" TEXT NOT NULL,
    "trailer_url" TEXT NOT NULL,
    CONSTRAINT "peliculas_pk" PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "salas" (
    "id" integer NOT NULL,
    "nombre" TEXT NOT NULL,
    "direccion" TEXT NOT NULL,
    "imagen_url" TEXT NOT NULL,
    "capacidad" integer NOT NULL,
    CONSTRAINT "salas_pk" PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "usuario" (
    "id" integer NOT NULL,
    "dni" TEXT NOT NULL UNIQUE,
    "nombre" TEXT NOT NULL,
    "apellido" TEXT NOT NULL,
    "correo" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "foto_perfil" TEXT NOT NULL,
    CONSTRAINT "usuario_pk" PRIMARY KEY("id" AUTOINCREMENT)
);

-- Crear tablas con dependencias
CREATE TABLE IF NOT EXISTS "pelicula_actor" (
    "id" integer NOT NULL,
    "pelicula_id" integer,
    "actor_id" integer,
    CONSTRAINT "pelicula_actor_peliculas_id_fk" FOREIGN KEY("pelicula_id") REFERENCES "peliculas",
    CONSTRAINT "pelicula_actor_actor_id_fk" FOREIGN KEY("actor_id") REFERENCES "actor",
    CONSTRAINT "pelicula_actor_pk" PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "pelicula_genero" (
    "id" integer NOT NULL,
    "pelicula_id" integer,
    "genero_id" integer,
    CONSTRAINT "pelicula_genero_peliculas_id_fk" FOREIGN KEY("pelicula_id") REFERENCES "peliculas",
    CONSTRAINT "pelicula_genero_genero_id_fk" FOREIGN KEY("genero_id") REFERENCES "genero",
    CONSTRAINT "pelicula_genero_pk" PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "funciones" (
    "id" integer NOT NULL,
    "pelicula_id" integer NOT NULL,
    "sala_id" integer NOT NULL,
    "fecha_hora" DATETIME,
    CONSTRAINT "funciones_peliculas_id_fk" FOREIGN KEY("pelicula_id") REFERENCES "peliculas",
    CONSTRAINT "funciones_salas_id_fk" FOREIGN KEY("sala_id") REFERENCES "salas",
    CONSTRAINT "funciones_pk" PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "reserva" (
    "idreserva" integer NOT NULL,
    "userid" integer NOT NULL,
    CONSTRAINT "reserva_pk" PRIMARY KEY("idreserva" AUTOINCREMENT),
    CONSTRAINT "reserva_usuario_fk" FOREIGN KEY("userid") REFERENCES "usuario"
);

CREATE TABLE IF NOT EXISTS "entrada" (
    "id" integer NOT NULL,
    "idreserva" integer NOT NULL,
    "asientofuncionid" integer NOT NULL,
    CONSTRAINT "entrada_pk" PRIMARY KEY("id" AUTOINCREMENT),
    CONSTRAINT "entrada_reserva_fk" FOREIGN KEY("idreserva") REFERENCES "reserva"
);

CREATE TABLE IF NOT EXISTS "funcion_asiento" (
    "id" integer NOT NULL,
    "asientoid" integer NOT NULL,
    "funcionid" integer NOT NULL,
    CONSTRAINT "funcion_asiento_pk" PRIMARY KEY("id" AUTOINCREMENT),
    CONSTRAINT "funcion_asiento_asiento_fk" FOREIGN KEY("asientoid") REFERENCES "asiento",
    CONSTRAINT "funcion_asiento_funcion_fk" FOREIGN KEY("funcionid") REFERENCES "funciones"
);

CREATE TABLE IF NOT EXISTS "asiento" (
    "id" integer NOT NULL,
    "fila" CHAR NOT NULL,
    "columna" integer NOT NULL,
    CONSTRAINT "asiento_pk" PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "productos" (
    "id" integer NOT NULL,
    "nombre" TEXT NOT NULL,
    "precio" REAL NOT NULL,
    "cantidad" INTEGER NOT NULL,
    CONSTRAINT "productos_pk" PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "compra_productos" (
    "id" integer NOT NULL,
    "reserva_id" integer NOT NULL,
    "producto_id" integer NOT NULL,
    "cantidad" INTEGER NOT NULL,
    CONSTRAINT "compra_productos_pk" PRIMARY KEY("id" AUTOINCREMENT),
    CONSTRAINT "compra_productos_reserva_fk" FOREIGN KEY("reserva_id") REFERENCES "reserva",
    CONSTRAINT "compra_productos_producto_fk" FOREIGN KEY("producto_id") REFERENCES "productos"
);
