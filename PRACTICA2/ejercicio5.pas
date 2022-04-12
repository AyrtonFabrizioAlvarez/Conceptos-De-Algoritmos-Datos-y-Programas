
program ejercicio5;
function valeDoble (numA:integer ; numB:integer):boolean;
begin
	valeDoble:= (numB = numA*2);
end;

var
num1, num2, cantN, esDoble:integer;

BEGIN
esDoble:=0;
cantN:=0;
writeln('Ingrese el numero 1');
readln(num1);
writeln('ingrese el numero 2');
readln(num2);
while (num1 <> 0) and (num2 <> 0) do
begin
	if (valeDoble(num1, num2)) then
		esDoble:= esDoble + 1;
	cantN:= cantN+1;
	writeln('Ingrese el numero 1');
	readln(num1);
	writeln('ingrese el numero 2');
	readln(num2);
end;
writeln('Se leyeron ', cantN, ' pares de numeros');
writeln('En ', esDoble, ' de los pares leidos el nummero 2 es mayor al numero 1');
END.

a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de numA.
b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea secuencias de pares de
números hasta encontrar el par (0,0), e informe la cantidad total de pares de números leídos y la cantidad de
pares en las que numB es el doble de numA.

Ejemplo: si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los valores
4 (cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA).
