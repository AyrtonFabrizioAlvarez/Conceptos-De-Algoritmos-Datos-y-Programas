program ejercicio3;

type
	escuela = record
		cue:integer;
		nombre:string;
		cantAlumnos:integer;
		cantDocentes:integer;
		localidad:string;
	end;
	
	
procedure leerEscuela (var colegio:escuela);
begin
	writeln('Ingrese el numero de CUE');
	readln(colegio.cue);
	writeln('Ingresae el nombre del establecimiento');
	readln(colegio.nombre);
	writeln('Ingrese la cantidad de alumnos');
	readln(colegio.cantAlumnos);
	writeln('Ingrese la cantidad de docentes');
	readln(colegio.cantDocentes);
	writeln('Ingrese la localidad');
	readln(colegio.localidad);
end;

	
function esLaPlata (localidad:string ; docentes, alumnos:integer):boolean;
begin
	esLaPlata:= ((localidad = 'la plata') or (localidad = 'LA PLATA') or (localidad = 'La Plata')) and (alumnos div docentes < 23.434);
end;


function relacion (docentes, alumnos:integer):real;
begin
	relacion:= (alumnos div docentes);
end;


procedure maximos (cue, docentes, alumnos:integer ; nombre:string ; var max1, max2:real ; var nomMax1, nomMax2:string);
var
rel:real;
begin
	rel:=relacion(docentes, alumnos);
	if (rel < max1) then begin		
		max2:=max1;
		nomMax2:=nomMax1;
		max1:=cue;
		nomMax1:=nombre;
	end
	else if (rel < max2) then begin
		max2:= cue;
		nomMax2:= nombre;
	end;
end;

var
	colegio:Escuela;
	j, cantLaPlata:integer;
	max1, max2:Real;
	nomMax1, nomMax2:string;

BEGIN
cantLaPlata:=0;
max1:=23.435;
max2:=23.435;
nomMax1:='';
nomMax2:='';
for j:=1 to 4 do begin
	leerEscuela(colegio);
	if (esLaPlata(colegio.localidad, colegio.cantDocentes, colegio.cantAlumnos)) then
		cantLaPlata:= cantLaPlata + 1;
	maximos (colegio.cue, colegio.cantDocentes, colegio.cantAlumnos, colegio.nombre, max1, max2, nomMax1, nomMax2)
end;
writeln('La cantidad de escuelas de la plata con relacion alumnos por docente superior es ', cantLaPlata);
writeln('Las 2 escuelas con mayor relacion son: ', nomMax1, ' ', max1:1:2, ' - ', nomMax2, ' ', max2:1:2);
END.

{
● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
a) Un módulo para la lectura de la información de la escuela.
b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
de alumnos y la cantidad de docentes).}


