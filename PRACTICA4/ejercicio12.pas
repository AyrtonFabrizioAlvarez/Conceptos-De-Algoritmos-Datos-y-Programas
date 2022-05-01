{
En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo
Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
* 
a) la cantidad de galaxias de cada tipo.
b) la masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.
c) la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d) el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.
}


program ejercicio12;
const
	dimF = 53;
type
	galaxias = record
		nombre:string;
		tipo:integer;
		masa:real;
		pc:real;
	end;
		
arrGalaxias = array [1..dimF] of galaxias;

procedure leerGalaxia (var galaxia:galaxias);
begin
	writeln('Ingrese el nombre de la galaxia');
	readln(galaxia.nombre);
	writeln('Ingrese el tipo de galaxia');
	readln(galaxia.tipo);
	writeln('Ingrese la masa de la galaxia');
	readln(galaxia.masa);
	writeln('Ingrese la dsitancia en parsecs desde la tierra');
	readln(galaxia.pc);
end;

procedure cargarArray(var arr:arrGalaxias ; var galaxia:galaxias);
var
	i:integer;
begin
	for i:=1 to dimF do begin
		leerGalaxia(galaxia);
		arr[i]:= galaxia;
	end;
end;

procedure cantGalaxiasPorTipo (arr:arrGalaxias ; var cantTipo1, cantTipo2, cantTipo3, cantTipo4:integer);
var
	i:integer;
begin
	for i:=1 to dimF do begin
		if(arr[i].tipo = 1) then begin
			cantTipo1:= cantTipo1 + 1;
		end
		else if (arr[i].tipo = 2) then begin
				cantTipo2:= cantTipo2 + 1;
			end
			else if (arr[i].tipo = 3) then begin
					cantTipo3:= cantTipo3 + 1;
				end
				else if (arr[i].tipo = 4) then begin
						cantTipo4:= cantTipo4 + 1;
					end
					else
						writeln('El tipo de galaxia solo puede ser 1, 2, 3 o 4');
	end;
end;

procedure masaYporcentaje (arr:arrGalaxias ; var masaTotal, porcentaje:real);
var
	i:integer;
	masaTodos:real;
begin
	masaTodos:=0;
	for i:=1 to dimF do begin
		masaTodos:= masaTodos + arr[i].masa;
		if (arr[i].nombre = 'Via Lactea') or (arr[i].nombre = 'Andromeda') or (arr[i].nombre = 'Triangulo') then begin
			masaTotal:= masaTotal + arr[i].masa;
		end;
		porcentaje := (masaTotal * 100) / masaTodos;
	end;
end;

function obtenerGalaxias1000pc (arr:arrGalaxias):integer;
var
	i, contador:integer;
begin
	contador:=0;
	for i:=1 to dimF do begin
		if ( (arr[i].tipo = 1) or (arr[i].tipo = 2) or (arr[i].tipo = 3) ) and (arr[i].pc < 1000) then begin
			contador:= contador + 1;
		end;
	end;
	obtenerGalaxias1000pc:= contador;
end;


procedure actualizarMaxMin(arr:arrGalaxias ; var max1, max2, min1, min2:real ; var nomMax1, nomMax2, nomMin1, nomMin2:string);
var
	i:integer;
begin
	for i:=1 to dimF do begin
		if (arr[i].masa > max1) then begin
			nomMax2:= nomMax1;
			max2:= max1;
			nomMax1:= arr[i].nombre;
			max1:= arr[i].masa;
		end
			else if (arr[i].masa > max2) then begin
					nomMax2:= arr[i].nombre;
					max2:= arr[i].masa;
			end
				else if (arr[i].masa < min1) then begin
						nomMin2:= nomMin1;
						min2:= min1;
						nomMin1:= arr[i].nombre;
						min1:= arr[i].masa;
				end
					else if (arr[i].masa < min2) then begin
							nomMin2:= arr[i].nombre;
							min2:= arr[i].masa;
					end;
	end;
end;

var
arr:arrGalaxias;
galaxia:galaxias;
cantTipo1, cantTipo2, cantTipo3, cantTipo4:integer;
masaTotal, porcentaje, max1, max2, min1, min2:real;
nomMax1, nomMax2, nomMin1, nomMin2:string;
BEGIN
	cantTipo1:=0;
	cantTipo2:=0;
	cantTipo3:=0;
	cantTipo4:=0;
	masaTotal:=0.0;
	porcentaje:=0.0;
	max1:= -1;
	max2:= -1;
	min1:= 9999999999999;
	min2:= 9999999999999;
	nomMax1:= '';
	nomMax2:= '';
	nomMin1:= '';
	nomMin2:= '';
	cargarArray(arr, galaxia);
	cantGalaxiasPorTipo(arr, cantTipo1, cantTipo2, cantTipo3, cantTipo4);
	writeln('las galaxias del tipo 1 son ', cantTipo1);
	writeln('las galaxias del tipo 2 son ', cantTipo2);
	writeln('las galaxias del tipo 3 son ', cantTipo3);
	writeln('las galaxias del tipo 4 son ', cantTipo4);
	masaYporcentaje (arr, masaTotal, porcentaje);
	writeln('La masa todal de las galaxias Via Lactea, Andromeda y Triangulo es ', masaTotal:1:2);
	writeln('esto representa el ', porcentaje:1:2, '% sobre el total de masa de las 53 galaxias en estudio');
	
	writeln('La cantidad de galaxias qeu no son irregulares ye stan a menos de 1000 pc son: ', obtenerGalaxias1000pc(arr));
	
	actualizarMaxMin(arr, max1, max2, min1, min2, nomMax1, nomMax2, nomMin1, nomMin2);
	writeln('Las primer galaxia con mayor masa es: ', nomMax1, ' con ', max1, ' de masa.');
	writeln('Las segunda galaxia con mayor masa es: ', nomMax2, ' con ', max2, ' de masa.');
	writeln('Las primer galaxia con menor masa es: ', nomMin1, ' con ', min1, ' de masa.');
	writeln('Las segunda galaxia con menor masa es: ', nomMin2, ' con ', min2, ' de masa.');
	
END.

