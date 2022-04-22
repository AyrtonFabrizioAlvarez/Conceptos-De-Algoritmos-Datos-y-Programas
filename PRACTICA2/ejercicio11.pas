program ejercicio11;

procedure menorInscripcion(num:integer ; min1Aux, min2Aux:integer ; apellido:string ; var min1, min2:string);
begin
	if (num <= min1Aux) then
	begin
		min2:= min1;
		min2Aux:= min1Aux;
		min1:= apellido;
		min1Aux:= num;
	end
	else if (num <= min2Aux) then
	begin
		min2:= apellido;
		min2Aux:=num;
	end
end;

procedure mayorInscripcion(num:integer ; max1Aux, max2Aux:integer ; nombre:string ; var max1, max2:string);
begin
	if (num >= max1Aux) then
	begin
		max2:= max1;
		max2Aux:= max1Aux;
		max1:= nombre;
		max1Aux:= num;
	end
	else if (num >= max2Aux) then
	begin
		max2:= nombre;
		max2Aux:=num;
	end
end;		

function esPar(num:integer):boolean;
begin
	esPar:= (num mod 2 = 0)
end;

	
function porcentaje(cantAlumnos, cantPares:integer):real;
begin
	porcentaje:= (cantPares * 100 / cantAlumnos);
end;
	
		
var
nombre, apellido, max1, max2, min1, min2:string;
numero, cantPares, cantAlumnos, min1Aux, min2Aux, max1Aux, max2Aux:integer;

BEGIN
	cantAlumnos:= 0;
	cantPares:= 0;
	min1Aux:= 1201;
	min2Aux:= 1201;
	max1Aux:= 0;
	max2Aux:= 0;
	repeat
		writeln('Ingrese su numero de inscripcion');
		readln(numero);
		writeln('Ingrese su nombre');
		readln(nombre);
		writeln('Ingrese su apellido');
		readln(apellido);
		
		menorInscripcion(numero, min1Aux, min2Aux, apellido, min1, min2);
		mayorInscripcion(numero, max1Aux, max2Aux, nombre, max1, max2);
		
		cantAlumnos:= cantAlumnos + 1;
		
		if (esPar(numero)) then
			cantPares:= cantPares + 1;
	until (numero = 1200);
	writeln('Los apellidos correspondientes a los N de inscripcion mas bajos son ', min1, ' y ', min2);
	writeln('Los nombres correspondientes a los N de inscripcion mas altos son ', max1, ' y ', max2);
	writeln('El porcentaje de alumnos con N de inscripcion par son ', porcentaje(cantAlumnos, cantPares):1:0, '%');
END.

Para cada alumno selee: número de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con número de
inscripción 1200, que debe procesarse. Se pide calcular e informar:
● Apellido de los dos alumnos con número de inscripción más chico.
● Nombre de los dos alumnos con número de inscripción más grande.
● Porcentaje de alumnos con nro de inscripción par.
