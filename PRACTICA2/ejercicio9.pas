program ejercicio9;

procedure descomponer(num:integer ; var sumaDigitos:integer ; var cantDigitos:integer);
var
digito:integer;
begin
	while (num <> 0) do
	begin
		digito:= num mod 10;
		cantDigitos:= cantDigitos + 1;
		sumaDigitos:= sumaDigitos + digito;
		num:= num div 10;
	end
end;

var
numero, digitos, resultado:integer;

BEGIN
	repeat
		digitos:=0;
		resultado:=0;
		readln(numero);
		descomponer(numero, resultado, digitos);
		writeln('La suma de los digitos de ', numero, ' es ', resultado);
		writeln('El numero ', numero, ' tiene ', digitos, ' digitos');
	until (resultado = 10)
END.


a. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que
posee y la suma de los mismos.
b. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la
cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman exactamente 10, el
cual debe procesarse.
