%************************************************************************
%*                        PROGRAMA COMPARATIVO 2022                     *
%*                        Verónica Flores Gutiérrez                     *
%************************************************************************

%clear all;
%close all; 
%pa1 = cd;
traye= uigetdir('','C:\Users\veflo\OneDrive\Documentos\BIBLIOTECA\UNIVERSIDAD Y ESPECIALIDAD\PROGRAMACION\PROGRAMAS MAT\TEMAS SELECTOS DE GEOTECNIA');
cd (traye);

%ESPECIFICACIONES DE LA SEÑAL 
%Total de muestras en el acelerográfo de CU = 7315
%Total de muestras en el acelerográfo de SCT = 
%Frecuencia de muestreo = 0.01
%Vel muesreo = 100 / s 
FS=100;
dt=1/FS;
stoptime=1;

%VECTOR DE TIEMPO 
t1=(0:dt:stoptime-dt);
ts1=(0:FS:(18352*FS)-1);

t2=(0:dt:stoptime-dt);
ts2=(0:FS:(31700*FS)-1);

t3=(0:dt:stoptime-dt);
ts3=(0:FS:(44995*FS)-1);



%------------------------------------------------------------------------
%%ESPECTRO DE FRECUENCIAS EN LA COMPONENTE VERTICAL SCT del 85 17 y 22

f1=figure('Menubar','none','NumberTitle','off','Name','COMPONENTE VERTICAL SCT',... 
       'Color',[1, 1, 1],'Resize','on')
   hold on; 
   %GRÁFICA DE LA SEÑAL 
subplot(3,1,1)
plot(ts1,vsct85,ts2,vsct17,':',ts3,vsct22);
legend ('1985', '2017', '2022');
ylim([-400 400]);
xlim ([0 2500000]);
xeti1=text(2500000,0,'[Hz]');
yeti1=text(0,500,'[cm/s]');
title 'COMPONENTE VERTICAL DE LA SCT 1985, 2017, 2022';
subtitle 'SEÑAL ORIGINAL'


%espectro de Fourier 
subplot(3,1,2);
t1=(0:dt:stoptime-dt);
N1=size(t1,1);

t2=(0:dt:stoptime-dt);
N2=size(t2,1);

t3=(0:dt:stoptime-dt);
N3=size(t3,1);

es1= abs(fft (vsct85));
es2= abs(fft (vsct17));
es3= abs(fft (vsct22));


dF1=FS/N1;%Hz
fre1=0:1:18352-1; %Hz
f1=fre1';

dF2=FS/N2;%Hz
fre2=0:1:31700-1; %Hz
f2=fre2';

dF3=FS/N3;%Hz
fre3=0:1:44995-1; %Hz
f3=fre3';

plot(f1,es1/N1,f2,es2/N2,':',f3,es3/N3);
legend ('1985', '2017', '2022');
%ylim([0 20000]);
xlim ([0 5000]);
subtitle 'ESPECTRO DE FRECUENCIAS'
    xeti1=text(5000,0,'[Hz]');
    yeti1=text(-400,120000,'[cm/s]');

    
    %ESPECTRO NORMALIZADO 
subplot (3, 1, 3);
es1= es1/max(es1);
es2=es2/max(es2);
es3=es3/max(es3);
plot(f1,es1, f2,es2, f3,es3)
legend ('1985', '2017', '2022');
%ylim([0 1]);
xlim ([0 5000]);subtitle 'Espectro Normalizado'
      xeti1=text(5000,0,'[ Hz ]');
      yeti1=text(0,1.2,'[cm/s ]');
        
      
