program ejercicio10;

procedure leerSecuencia(num:integer ; var pares, impares:integer ; suma:integer);
var
	digito:integer;
begin
	while (num <> 0) do
	begin
		digito:= num mod 10;
		if (digito mod 2 = 0) then
			pares:= pares + digito
		else
			impares:= impares + 1;
		suma:= suma + digito;
		num:= num div 10;	
	end
end;
	
var
numero, resultado, sumaDigPares, cantDigImpares:integer;
BEGIN
writeln(3 mod 2);
	writeln('Ingrese un numero');
	readln(numero);
	while (numero <> 123456) do
	begin
		resultado:= 0;
		sumaDigPares:= 0;
		cantDigImpares:= 0;
		leerSecuencia(numero, sumaDigPares, cantDigImpares, resultado);
		writeln('La suma de los digitos pares de ', numero, ' es ', sumaDigPares);
		writeln('El numero ', numero, ' tiene ', cantDigImpares, ' cantidad de digitos impares');
		readln(numero)
	end
END.

10. Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando llega
el número 123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus dígitos
pares y la cantidad de dígitos impares que posee.
