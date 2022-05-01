
program ejercicio9;

const
	dimF = 400;
	anoActual = 2022;
	
type
	alumnos = record
		inscripcion:integer;
		dni:integer;
		apellido:string;
		nombre:string;
		nacimiento:integer;
	end;
	
type
	arrAlumnos = array [1..dimF] of alumnos;
	
procedure leerAlumno(var alumno:alumnos);
begin
	writeln('Ingrese el nro de inscripcion');
	readln(alumno.inscripcion);
	writeln('Ingrese el numero de dni');
	readln(alumno.dni);
	writeln('Ingrese el apellido del alumno');
	readln(alumno.apellido);
	writeln('Ingrese el nombre del alumno');
	readln(alumno.nombre);
	writeln('Ingrese el año de nacimiento del alumno');
	readln(alumno.nacimiento);
end;
	
procedure cargarArray (var arr:arrAlumnos ; var alumno:alumnos ; var dimL:integer);
begin
	leerAlumno(alumno);
	while (alumno.dni <> -1) and (dimL < dimF) do begin
		dimL:= dimL + 1;
		arr[dimL]:= alumno;
		leerAlumno(alumno);
	end;
end;

function dnisPares (arr:arrAlumnos ; dimL:integer):integer;
var
	i, total, dig:integer;
	cumple:boolean;
begin
	total:=0;
	for i:=1 to dimL do begin
		cumple:=true;
		while (arr[i].dni <> 0) and (cumple) do begin
			dig:= arr[i].dni mod 10;
			if (dig mod 2 = 0) then
				arr[i].dni:= arr[i].dni div 10
			else
				cumple:= false;
		end;
		if (cumple) then
			total:= total + 1;
	end;
	dnisPares:= total;
end;

procedure actualizarMax(arr:arrAlumnos ; dimL:integer ; var max1, max2:integer ; var nombreMax1, apellidoMax1, nombreMax2, apellidoMax2:string);
var
	i, edad:integer;
begin
	for i:=1 to dimL do begin
		edad:= (anoActual - arr[i].nacimiento);
		if (edad > max1) then begin
			nombreMax2:= nombreMax1;
			apellidoMax2:= apellidoMax1;
			max2:= max1;
			nombreMax1:= arr[i].nombre;
			apellidoMax1:= arr[i].apellido;
			max1:= edad;
		end
		else if (edad > max2) then begin
			nombreMax2:= arr[i].nombre;
			apellidoMax2:= arr[i].apellido;
			max2:= edad;
		end;
	end;
end;

var
arr : arrAlumnos;
alumno : alumnos;
max1, max2, dimL:integer;
nombreMax1, apellidoMax1, nombreMax2, apellidoMax2:string;

BEGIN
	dimL:=0;
	max1:= -1;
	max2:= -1;
	nombreMax1:= '';
	nombreMax2:= '';
	apellidoMax1:= '';
	apellidoMax2:= '';
	cargarArray(arr, alumno, dimL);
	writeln('La cantidad de alumnos con dni compuesto solo por digitos pares es: ', dnisPares(arr, dimL) );
	actualizarMax(arr, dimL, max1, max2, nombreMax1, apellidoMax1, nombreMax2, apellidoMax2);
	writeln('Los alumnos de mayor edad son: 1- ', nombreMax1, ' ', apellidoMax1, ' de ', max1, ' años de edad');
	writeln('Los alumnos de mayor edad son: 1- ', nombreMax2, ' ', apellidoMax2, ' de ', max2, ' años de edad');
END.

