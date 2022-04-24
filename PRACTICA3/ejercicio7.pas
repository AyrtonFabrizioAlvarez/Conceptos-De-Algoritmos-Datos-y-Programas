{Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada
centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de
investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por universidad y
la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar:
● Cantidad total de centros para cada universidad.
● Universidad con mayor cantidad de investigadores en sus centros.
● Los dos centros con menor cantidad de becarios.}

program ejercicio7;

type
	centrosInvestigacion = record
		nombre:string;
		universidad:string;
		cantInvestigadores:integer;
		cantBecarios:integer;
	end;
	
	
procedure leerCentro(var centro:centrosInvestigacion);
begin
	writeln('Ingrese el nombre del centro');
	readln(centro.nombre);
	writeln('Ingrese la universidad a la que el centro pertenece');
	readln(centro.universidad);
	writeln('Ingrese la cantidad de investigadores');
	readln(centro.cantInvestigadores);
	writeln('Ingrese la cantidad de becarios');
	readln(centro.cantBecarios);
end;

procedure actualizarMax(cantInvestigadores:integer ; universidad:string ; var max:integer ; var maxUniversidad:string);
begin
	if (cantInvestigadores > max) then begin
		maxUniversidad:= universidad;
		max:= cantInvestigadores;
	end;
end;

procedure actualizarMin(cantBecarios:integer ; nombreCentro:string; var min, min2:integer ; var minCentro, minCentro2:string);
begin
	if (cantBecarios < min) then begin
		minCentro2:= minCentro;
		min2:= min;
		minCentro:= nombreCentro;
		min:= cantBecarios;
	end
	else if (cantBecarios < min2) then begin
		minCentro2:=nombreCentro;
		min2:=cantBecarios;
	end;
end;

var
centro:centrosInvestigacion;
universidadActual, maxUniversidad, minCentro, minCentro2, centroActual:string;
cantCentros, max, min, min2, cantActualInvestigadores, cantActualBecarios:integer;

BEGIN
	min:=9999;
	min2:=9999;
	minCentro:='';
	minCentro2:='';
	max:=0;
	universidadActual:='';
	centroActual:='';
	cantActualInvestigadores:=0;
	cantActualBecarios:=0;
	leerCentro(centro);
	while (centro.cantInvestigadores > 0) do begin
		cantCentros:=0;
		centroActual:=centro.nombre;
		cantActualBecarios:=centro.cantBecarios;
		cantActualInvestigadores:= centro.cantInvestigadores;
		universidadActual:= centro.universidad;
		while(universidadActual = centro.universidad)do begin
			cantCentros:= cantCentros + 1;
			
			leerCentro(centro);
		end;
		actualizarMax(cantActualInvestigadores, universidadActual, max, maxUniversidad);
		actualizarMin(cantActualBecarios, centroActual, min, min2, minCentro, minCentro2);
	end
	
END.

