program ejercicio14;

procedure calcularRendimiento(cantHectareas, tipo:integer ; var precio:Real );
begin
	if (tipo = 1) then 
		precio:= cantHectareas * 6 * precio
	else if (tipo = 2) then
			precio:= cantHectareas * 2.6 * precio
		else
			precio:= cantHectareas * 1.4 * precio;
end;

procedure procesarInformacion (localidad:string ; cantHectSembradas, tipo:integer);
begin
	
end

var
cantHectareasSembradas, tipo:integer;
localidad:string;
precio:real;
BEGIN
	repeat
		writeln('Ingrese la localidad')
		readln(localidad)
		writeln('Ingrese la cantidad de Hectareas Sembradas')
		readln(cantHectareasSembradas)
		writeln('Ingrese el tipo de zona (1- zona fertil	2- zona estandar	3- zona arida)')
		readln(tipo)	
		
	until (cantHectareas = 900)
	
END.

 a. Realizar un módulo que calcule el rendimiento económico de una plantación de soja. El módulo debe
recibir la cantidad de hectáreas (ha) sembradas, el tipo de zona de siembra (1: zona muy fértil, 2: zona estándar,
3: zona árida) y el precio en U$S de la tonelada de soja; y devolver el rendimiento económico esperado de dicha
plantación.
Para calcular el rendimiento económico esperado debe considerar el siguiente rendimiento por tipo de zona:

Tipo de zona 	Rendimiento por ha
	1 				6 toneladas por ha
	2 				2,6 toneladas por ha
	3 				1,4 toneladas por ha
	
b. ARBA desea procesar información obtenida de imágenes satelitales de campos sembrados con soja en la
provincia de Buenos Aires. De cada campo se lee: localidad, cantidad de hectáreas sembradas y el tipo de zona
(1, 2 ó 3). La lectura finaliza al leer un campo de 900 ha en la localidad ‘Saladillo’, que debe procesarse. El precio
de la soja es de U$S320 por tn. Informar:
● La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000.
● La localidad del campo con mayor rendimiento económico esperado.
● La localidad del campo con menor rendimiento económico esperado.
● El rendimiento económico promedio.
