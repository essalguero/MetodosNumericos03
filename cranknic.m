function [t,u]=cranknic(odefun,tspan,y0,Nh,varargin)
%CRANKNIC  Resuelve ecuaciones diferenciales utilizando
%  el metodo de Crank-Nicolson.
%  [T,Y]=CRANKNIC(ODEFUN,TSPAN,Y0,NH) con TSPAN=[T0,TF]
%  integra el sistema de ecuaciones diferenciales
%  y'=f(t,y) desde el tiempo T0 al TF con condicion
%  inicial Y0 usando el metodo de Crank-Nicolson sobre
%  una malla equiespaciada de NH intervalos. La funcion
%  ODEFUN(T,Y) debe devolver un vector columna
%  correspondiente a f(t,y).
%  Cada fila en el tablero solucion Y corresponde a un
%  tiempo devuelto en el vector columna T.
%  [T,Y] = CRANKNIC(ODEFUN,TSPAN,Y0,NH,P1,P2,...) pasa
%  los parametros adicionales P1,P2,... a la funcion
%  ODEFUN como ODEFUN(T,Y,P1,P2...).
tt=linspace(tspan(1),tspan(2),Nh+1);
y=y0(:); % siempre crea un vector columna
u=y.';
global glob_h glob_t glob_y glob_odefun;
glob_h=(tspan(2)-tspan(1))/Nh;
glob_y=y;
glob_odefun=odefun;

if( ~exist('OCTAVE_VERSION') )
 options=optimset;
 options.Display='off';
 options.TolFun=1.e-06;
 options.MaxFunEvals=10000;
end

for glob_t=tt(2:end) if ( exist('OCTAVE_VERSION') )
  [w info msg] = fsolve('cranknicfun',glob_y);
else
  w = fsolve(@(w) cranknicfun(w),glob_y,options);
end
  u = [u; w.'];
  glob_y = w;
end
t=tt;
clear glob_h glob_t glob_y glob_odefun;
end


