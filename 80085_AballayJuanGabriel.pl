%HECHOS
%paseo/5
% paseo(NroPaseo,DniPaseador,fecha(Dia,Mes,A�o),ListadoMasc,DuracionPaseo)

paseo(1,'20.000.000',fecha(1,10,2020),['A','B','C'],25).
paseo(2,'15.000.000',fecha(1,10,2020),['B','E'],30).
paseo(3,'8.000.000',fecha(2,10,2020),['A','B','C','D','E'],20).
paseo(4,'20.000.000',fecha(2,10,2020),['A'],20).
paseo(5,'12.000.000',fecha(3,10,2020),['C','D','E'],40).
paseo(6,'15.000.000',fecha(3,10,2020),['B','D'],40).


%paseador/3
%paseador(DniPaseador,Nombre,Apellido)
paseador('8.000.000','Emilia','Estrada').
paseador('12.000.000','Delia','Liz�rraga').
paseador('15.000.000','Roc�o','Albinoni').
paseador('20.000.000','Nico','Pointer').

%tarifa_60_min/3
% tarifa_60_min(CantidadMascotasPaseadas,DescripcionPaseo,Tarifapor60minpaseo)
tarifa_60_min(1,'paseo exclusivo',50).
tarifa_60_min(2,'paseo de a dos',80).
tarifa_60_min(3,'paseo triple',100).
tarifa_60_min(4,'paseo de dos pares',120).
tarifa_60_min(5,'paseo qu�ntuple',150).

%REGLAS

%regla1/2.
%Conocer si entre los paseos realizados, se realiz� o no, alg�n paseo cuyo d�a y mes se reciben como argumentos en la regla.
%ej:regla1(30,9).false.

regla1(Dia,Mes):-paseo(_,_,fecha(Dia,Mes,_),_,_),!.

%regla2/6.
% Conocer para un determinado n�mero de paseo que se deber� especificar, los siguientes datos: nombre y apellido del paseador, mes, a�o en el que se realiz� el paseo, y la cantidad de minutos que dur� el paseo.

regla2(NroPaseo,Nom,Ape,Mes,A�o,CantMin):-paseo(NroPaseo,DniPaseador,fecha(_,Mes,A�o),_,CantMin),
                                         paseador(DniPaseador,Nom,Ape),!.


%regla3/3.
%  Generar una lista con las descripciones de aquellos paseos realizados durante cierto mes y a�o que se especifican.
%  En la lista a generar no deber�n figurar nombres de paseos repetidos
%  en caso que dicho mes y a�o se hayan realizado m�s de una vez el
%  mismo tipo de paseo; por lo tanto se deber�n eliminar de la lista a
%  generar aquellos nombres de paseos que llegaran a estar repetidos.

regla3(Mes,A�o,ListaSinRep):-findall(Descrip,
                               (
                                paseo(_,_,fecha(_,Mes,A�o),ListadoMasc,_),
                                tarifa_60_min(CantMascPas,Descrip,_),
                                length(ListadoMasc,CantMascPas)
                                ),
                              Lista),sort(Lista,ListaSinRep).
