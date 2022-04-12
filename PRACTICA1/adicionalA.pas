
program adicionalA;


var
codigo, cantInversiones, maxCodigo, i, cantInversionSuperior:integer;
inversion, promedio, maxInversion, totalInversiones:real;
superaInversion:boolean;


BEGIN
maxCodigo:=0;
maxInversion:=0;
cantInversionSuperior:=0;
repeat 
	totalInversiones:= 0;
	writeln('Ingrese el codigo de la empresa');
	readln(codigo);
	writeln('Ingrese la cantidad de inversiones');
	readln(cantInversiones);
	for i:=1 to cantInversiones do begin
		writeln('Ingrese el monto de la inversion ', i);
		readln(inversion);
		totalInversiones:= totalInversiones + inversion;
		if (totalInversiones > maxInversion) then begin
			maxCodigo:=codigo;
			maxInversion:=totalInversiones;
		end;
		if (inversion > 50000) then begin
			superaInversion:=true;
		end;
		
	end;
	promedio:= totalInversiones / cantInversiones;
	writeln('El promedio de la empresa ', codigo, ' es de ', promedio:1:2);
	if (superaInversion) then begin
	cantInversionSuperior:= cantInversionSuperior + 1;
	end
until (codigo = 100);
writeln('La empresa	', maxCodigo, ' es la que tiene mayor capital invertido	', '(', maxInversion:1:2, ')');
writeln('Las empresas qeu invirtieron mas de 50000 en una inversion son	', cantInversionSuperior);
	
	
END.

Por ejemplo:
Ingrese un código de empresa: 33
Ingrese la cant. de inversiones: 4
Ingrese el monto de cada inversión: 33200 56930 24500.85 10000
Resultado del análisis: Empresa 33 Monto promedio 31157,71
Ingrese un código de empresa: 41
Ingrese la cant. de inversiones: 3
Ingrese el monto de cada inversión: 102000.22 53000 12000
Resultado del análisis: Empresa 41 Monto promedio 55666,74
Ingrese un código de empresa: 100
Ingrese la cant. de inversiones: 1
Ingrese el monto de cada inversión: 84000.34
Resultado del análisis: Empresa 100 Monto promedio 84000.34
