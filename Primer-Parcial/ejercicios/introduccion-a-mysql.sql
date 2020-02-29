create database universidadTDBA
  use universidadTDBA

CREATE TABLE campeonato
(
  idCamp INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nombre VARCHAR(50)
);

INSERT INTO campeonato (nombre) VALUES ('Unifranzitos 2020');

DROP TABLE IF EXISTS equipo;
CREATE TABLE equipo
(
  idEq INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  categoria VARCHAR(15) NOT NULL,
  idCamp INTEGER NOT NULL,
  FOREIGN KEY (idCamp) REFERENCES campeonato(idCamp)
);

INSERT INTO equipo(nombre, categoria, idCamp) VALUES ('Unifranz', 'varones', 1);
INSERT INTO equipo(nombre, categoria, idCamp) VALUES ('Univalle', 'mujeres', 1);

DROP TABLE IF EXISTS jugador;
CREATE TABLE jugador
(
  idJug INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellidos VARCHAR(50) NOT NULL,
  edad INTEGER,
  idEq INTEGER NOT NULL,
  FOREIGN KEY (idEq) REFERENCES equipo (idEq)
);

INSERT INTO jugador(nombre, apellidos, edad, idEq)
    VALUES ('Juan', 'Perez', 25, 1);
INSERT INTO jugador(nombre, apellidos, edad, idEq)
    VALUES ('Pepito', 'Perezales', 30, 1);
INSERT INTO jugador(nombre, apellidos, edad, idEq)
    VALUES ('Miguel', 'Mormy', 28, 1);

INSERT INTO jugador(nombre, apellidos, edad, idEq)
    VALUES ('Ana', 'Perezales', 33, 2);
INSERT INTO jugador(nombre, apellidos, edad, idEq)
    VALUES ('Ximena', 'Mormy', 27, 2);

SELECT jug.nombre, jug.apellidos, jug.edad
FROM jugador AS jug;

# mostrar los jugadores(nombre y edad) que forman parte del equipo univalle

SELECT jug.nombre, eq.nombre, camp.nombre
FROM equipo AS eq
    INNER JOIN jugador AS jug on eq.idEq = jug.idEq
    INNER JOIN campeonato AS camp on eq.idCamp = camp.idCamp
WHERE eq.nombre = 'Univalle';


create  function maxEdadJUgadores() returns integer
  begin
    declare maxEdad integer;
    set maxEdad = 0;
  SELECT max(jug.edad) into maxEdad
    from jugador as jug;
    return  maxEdad;
  end;

select maxEdadJUgadores();

create function  AgregarRegistrosToTable(nombretabla TEXT) RETURNS  text
  begin
    if nombretabla = 'equipo'
      then
      insert into equipo(nombre, categoria, idCamp ) values ('holasiii', 'mujeres', '1');
    end if;
    return 'se inserto conrrectamente';
  end;

select AgregarRegistrosToTable('equipo')