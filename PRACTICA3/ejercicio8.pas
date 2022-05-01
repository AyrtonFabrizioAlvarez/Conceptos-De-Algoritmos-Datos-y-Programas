{La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el programa
Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un código único, un título, el docente
coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan del proyecto, el nombre de la
escuela y la localidad a la que pertenecen. Cada escuela puede presentar más de un proyecto. La información se
ingresa ordenada consecutivamente por localidad y, para cada localidad, por escuela. Realizar un programa que
lea la información de los proyectos hasta que se ingrese el proyecto con código -1 (que no debe procesarse), e
informe:
● Cantidad total de escuelas que participan en la convocatoria 2018 y cantidad de escuelas por cada localidad.
● Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
● Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares.}

program ejercicio8;

type
	docente = record
		dni:integer;
		nombre:string;
		apellido:string;
		email:String;
	end;
type
	proyectos = record
		codigo:integer;
		titulo:string;
		profesor: docente;
		cantAlumnos:integer;
		escuela:string;
		localidad:string;
	end;
		
procedure leerDocente(var profesor:docente);
begin
	writeln('Ingrese el dni del profesor');
	readln(profesor.dni);
	writeln('Ingrese el nombre del profesor');
	readln(profesor.nombre);
	writeln('Ingrese el apellido del profesor');
	readln(profesor.apellido);
	writeln('Ingrese el email del profesor');
	readln(profesor.email);
end;
		
procedure leerProyecto(var proyecto:proyectos);
begin
	writeln('Ingrese el codigo del proyecto');
	readln(proyecto.codigo);
	writeln('Ingrese el tirulo del proyecto');
	readln(proyecto.titulo);
	leerDocente(proyecto.profesor);
	writeln('Ingrese la cantidad de alumnos');
	readln(proyecto.cantAlumnos);
	writeln('Ingrese la escuela');
	readln(proyecto.escuela);
	writeln('Ingrese la localidad');
	readln(proyecto.localidad);
end;

procedure actualizarMax(nombreEscuela:string ; cantAlumnos:integer ; var max1, max2:integer ; var nomMax1, nomMax2:string);
begin
	if(cantAlumnos > max1)then begin
		max2:=max1;
		nomMax2:=nomMax1;
		max1:=cantAlumnos;
		nomMax1:=nombreEscuela;
	end
	else if(cantAlumnos > max2)then begin
		max2:=cantAlumnos;
		nomMax2:=nombreEscuela;
	end;
end;

function IgualParesImpares(num:integer):boolean;
var 
	digito, cantPares, cantImpares:integer;
begin
	cantPares:=0;
	cantImpares:=0;
	digito:=num mod 10;
	while (digito <> 0) do begin
		if (digito mod 2 = 0) then begin
		cantPares:=cantPares + 1;
		end
		else begin
		cantImpares:= cantImpares + 1;
		end;
		num:=num div 10;
	end;
	IgualParesImpares:=(cantPares = cantImpares);
end;

var
	proyecto:proyectos;
	localidadActual, escuelaActual, nomMax1, nomMax2:string;
	cantEscuelas, cantEscuelasPorLocalidad, max1, max2, cantAlumnosActual, codigoActual, igualCantPeI:integer;

BEGIN
	max1:=-1
	max2:=-1;
	nomMax1:='';
	nomMax2:='';
	cantEscuelas:=0;
	igualCantPeI:=0;
	leerProyecto(proyecto);
	codigoActual:=proyecto.codigo;
	while(proyecto.codigo <> -1)do begin
		localidadActual:= proyecto.localidad;
		cantEscuelasPorLocalidad:=0;
		while(localidadActual = proyecto.localidad)do begin
			cantEscuelasPorLocalidad:= cantEscuelasPorLocalidad + 1;;
			escuelaActual:= proyecto.escuela;
			cantAlumnosActual:= proyecto.cantAlumnos;
			while(escuelaActual = proyecto.escuela)do begin
				cantEscuelas:= cantEscuelas + 1;
				leerProyecto(proyecto)
			end;
			{AL TERMINAR ESCUELA}
			actualizarMax(escuelaActual, cantAlumnosActual, max1, max2, nomMax1, nomMax2);
			if (escuelaActual = 'Daireaux') then begin
				if(IgualParesImpares(codigoActual)) then begin
					igualCantPeI:=igualCantPeI + 1;
				end;				
			end;
		end;
		{AL TERMINAR LOCALIDAD}
		writeln('La cantidad de escuelas en ', localidadActual, ' es de ', cantEscuelasporLocalidad);
	end;
	{AL LEER CODIGO -1}
	writeln('La cantidad de escuelas totales es: ', cantEscuelas);
END.

