{
Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se
completa el vector. Una vez finalizada la carga de datos se pide:
* 
a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.
}
program ejercicio10;

const
	rango = 300;
	
type
	arrSalarios = array [1..rango] of real;
	
procedure cargarArray (var arr:arrSalarios ; var dimL:integer);
var
	salario:real;
begin
	writeln('Ingrese el salario del empleado');
	readln(salario);
	while (salario <> 0) and (dimL < rango) do begin
		dimL:= dimL + 1;
		arr[dimL] := salario;
		writeln('Ingrese el salario del empleado');
		readln(salario);
	end;
end;

procedure aumentarSalarios (var arr:arrSalarios ; dimL:integer ; aumentoX:real);
var
	i:integer;
begin
	for i:=1 to dimL do begin
		arr[i] := arr[i] * aumentoX;
	end;
end;

function promedioSueldos (arr:arrSalarios ; dimL:integer):real;
var
	i:integer;
	total:real;
begin
	total:=0;
	for i:=1 to dimL do begin
		total:= total + arr[i]
	end;
	promedioSueldos:= total / dimL;
end;
	
var
arr:arrSalarios;
dimL:integer;
montoAumento:real;

BEGIN
dimL:=0;
montoAumento:=1.15;
cargarArray(arr, dimL);
aumentarSalarios(arr, dimL, montoAumento);
writeln('El sueldo promedio luego de del aumento del 15% es de ', promedioSueldos(arr, dimL));
END. 

