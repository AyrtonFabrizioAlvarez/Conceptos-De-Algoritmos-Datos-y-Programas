{Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente información de
los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom, Centrino, etc.),
cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y tamaño en
nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores se lee de
forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores (que no
debe procesarse). Se pide implementar un programa que lea información de los microprocesadores de la empresa
importadora e informe:
● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.  (FILTRO1)
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.  (MAXIMOS)
● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de
al menos 2 Ghz  (FILTRO2)}

program ejercicio6;

type
	cpu = record
		marca:string;
		linea:string;
		cantNucleos:integer;
		velocidadReloj:real;
		tamanoNm:integer;
	end;

procedure leerCpu (var procesador:cpu);		
begin
	writeln('Ingrese la marca del procesador');
	readln(procesador.marca);
	writeln('Ingrese la linea del procesador');
	readln(procesador.linea);
	writeln('Ingrese la cantidad de nucleos');
	readln(procesador.cantNucleos);
	writeln('Ingrese la velocidad del reloj expresada en GHz');
	readln(procesador.velocidadReloj);
	writeln('Ingrese el tamaño de los transistores expresados en NM');
	readln(procesador.tamanoNm);
end;

procedure actualizarMax(marca:string ; cantProcesadores14nm:integer ; var max, max2:integer ; var maxMarca, maxMarca2:string);
begin
	if (cantProcesadores14nm > max) then begin
		maxMarca2:= maxMarca;
		maxMarca:= marca;
		max2:= max;
		max:= cantProcesadores14nm
	end
	else if (cantProcesadores14nm > max2) then begin
		maxMarca2:= marca;
		max2:= cantProcesadores14nm;
	end;
end;

var
	procesador:cpu;
	marcaActual, maxMarca, maxMarca2:string;
	filtro1, filtro2, max, max2, cantProcesadoresPorMarca, cantProcesadores14nm:integer;
BEGIN
	marcaActual:='';
	filtro1:=0;
	filtro2:=0;
	max:=0;
	maxMarca:='';
	max2:=0;
	maxMarca2:='';
	cantProcesadores14nm:=0;
	leerCpu(procesador);
	while (procesador.cantNucleos > 0) do begin
		cantProcesadoresPorMarca:=0;
		marcaActual:= procesador.marca;
		while (procesador.marca = marcaActual)do begin
			cantProcesadoresPorMarca:= cantProcesadoresPorMarca + 1;
			if (procesador.cantNucleos > 2) and (procesador.tamanoNm <= 22) then begin
				filtro1:=filtro1 + 1;
			end;
			if (procesador.tamanoNm > 14) then begin
				cantProcesadores14nm:= cantProcesadores14nm + 1;
			end;
			if (procesador.cantNucleos > 1) and (procesador.velocidadReloj >= 2) and ((marcaActual = 'intel') or (marcaActual = 'amd')) then begin
				filtro2:= filtro2 + 1;
			end;
			leerCpu(procesador);
		end;
		actualizarMax(marcaActual, cantProcesadores14nm, max, max2, maxMarca, maxMarca2)
	end;
	
	writeln('Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm son: ', max, ' - ', maxMarca, ' y ',  max2, ' - ', maxMarca2);
	writeln('La cantidad total de procesadores multicore de las marcas Intel o Amd con relojes de al menos 2GHz de velocidad son ', filtro2);
	
END.

