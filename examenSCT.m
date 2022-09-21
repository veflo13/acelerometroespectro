
%************************************************************************
%*                        PROGRAMA EXAMEN A CASA                        *
%*                    ALUMNA:Verónica Flores Gutiérrez                  *
%*                    PROFESOR: Dr. Francisco Chávez                    *
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
t=(0:dt:stoptime-dt);
ts=(0:FS:(18351*FS)-1);


%------------------------------------------------------------------------
%%ESPECTRO DE FRECUENCIAS EN LA COMPONENTE VERTICAL CIUDAD UNIVERSITARIA

f1=figure('Menubar','none','NumberTitle','off','Name','COMPONENTE VERTICAL CIUDAD UNIVERSITARIA',... 
       'Color',[1, 1, 1],'Resize','on')
   hold on; 
   %GRÁFICA DE LA SEÑAL 
subplot(5,1,1)
plot(ts,vsct);
title 'SEÑAL ORIGINAL'

%espectro de Fourier 
subplot(5,1,2);
t=(0:dt:stoptime-dt);
N=size(t,1);
es= abs(fft (vsct));
dF=FS/N;%Hz
fre=0:1:18351-1; %Hz
f=fre';
plot(f,es/N);
%ylim([0 5000]);
%xlim ([0 180000]);
 title 'ESPECTRO DE FRECUENCIAS'
      xeti1=text(410,0,'[ Hz ]');
    yeti1=text(0,1.2,'[cm/s ]');

    
    %ESPECTRO NORMALIZADO 
subplot (5, 1, 3);
es= es/max (es);
plot(f,es)
ylim([0 0.9]);
xlim ([0 400]);
 title 'Espectro Normalizado'
      xeti1=text(410,0,'[ Hz ]');
      yeti1=text(0,1.2,'[cm/s ]');
        
%Diseño de filtro espectro de respuesta     
subplot (5,1,4);
ws=[1]/FS;
wp=[0.1];
[n,Wn]= buttord(wp,ws,0.64,30);
[B,A]=butter(n,Wn);
[h,fr]=freqz(B,A,[],FS);
plot(fr,abs(h));
xlim ([0 20]);
ylim ([0 2]);
 title 'DISEÑO DEL FILTRO Respuesta de amplitud'
   xeti1=text(0,-10,'[ Hz]');
    %yeti1=text(0,0,'[ Numero de Canal ]');

    
    
    %CONVOLUCIÓN DEL FILTRO
    tss=ts';
X=[tss,vsct];
z=filter(B,A,X);
subplot (5,1,5);
c=z(:,2);
plot(ts,c);
 title 'GRAFICO DE LA SEÑAL FILTRADA'
    %xeti1=text(0,-10,'[ segundos ]');
    %yeti1=text(0,0,'[ Numero de Canal ]');
%esn=es/max(es);
%plot (a,esn); 
hold off;


%--------------------------------------------------------------------------
%COMPONENTE ESTE-OESTE CIUDAD UNIVERSITARIA 

f2=figure('Menubar','none','NumberTitle','off','Name','COMPONENTE ESTE-OESTE CIUDAD UNIVERSITARIA',... 
       'Color',[1, 1, 1],'Resize','on')
   
 
   hold on;
   
   %GRÁFICA DE LA SEÑAL 
subplot(5,1,1)
plot(ts,ewsct);
title 'SEÑAL ORIGINAL'

%Espectro de frecuencias 
subplot(5,1,2);
t=(0:dt:stoptime-dt);
N=size(t,1);
es= abs(fft (ewcu));
dF=FS/N;%Hz
fre=0:1:7315-1; %Hz
f=fre';
plot(f,es/N);
%ylim([0 5000]);
%xlim ([0 180000]);
 title 'ESPECTRO DE FRECUENCIAS'
      xeti1=text(410,0,'[ Hz ]');
    yeti1=text(0,1.2,'[cm/s ]');

    
    %ESPECTRO NORMALIZADO 
subplot (5, 1, 3);
es= es/max (es);
plot(f,es)
ylim([0 0.9]);
xlim ([0 400]);
 title 'Espectro Normalizado'
    xeti1=text(0,-10,'[ Hz ]');
    %yeti1=text(0,0,'[ Numero de Canal ]');
        
%Diseño de filtro espectro de respuesta     
subplot (5,1,4);
ws=[1]/FS;
wp=[0.1];
[n,Wn]= buttord(wp,ws,0.64,30);
[B,A]=butter(n,Wn);
[h,fr]=freqz(B,A,[],FS);
plot(fr,abs(h));
xlim ([0 20]);
ylim ([0 2]);
 title 'DISEÑO DEL FILTRO Respuesta de amplitud'
  xeti1=text(410,0,'[ Hz ]');
    yeti1=text(0,1.2,'[cm/s ]');

    
    
    %CONVOLUCIÓN DEL FILTRO
    tss=ts';
X=[tss,ewsct];
z=filter(B,A,X);
subplot (5,1,5);
c=z(:,2);
plot(ts,c);
 title 'GRAFICO DE LA SEÑAL FILTRADA'
    %xeti1=text(0,-10,'[ segundos ]');
    %yeti1=text(0,0,'[ Numero de Canal ]');
%esn=es/max(es);
%plot (a,esn); 
hold off;

%--------------------------------------------------------------------------
%Componente Norte-Sur Ciudad Universitaria. 

f2=figure('Menubar','none','NumberTitle','off','Name','COMPONENTE Norte-Sur CIUDAD UNIVERSITARIA',... 
       'Color',[1, 1, 1],'Resize','on')
   hold on;
   
   %GRÁFICA DE LA SEÑAL 
subplot(5,1,1)
plot(ts,nssct);
title 'SEÑAL ORIGINAL'

%Espectro de frecuencias 
subplot(5,1,2);
t=(0:dt:stoptime-dt);
N=size(t,1);
es= abs(fft (nssct));
dF=FS/N;%Hz
fre=0:1:18351-1; %Hz
f=fre';
plot(f,es/N);
%ylim([0 5000]);
%xlim ([0 180000]);
 title 'ESPECTRO DE FRECUENCIAS'
      xeti1=text(410,0,'[ Hz ]');
    yeti1=text(0,1.2,'[cm/s ]');

    
    %ESPECTRO NORMALIZADO 
subplot (5, 1, 3);
es= es/max (es);
plot(f,es)
ylim([0 0.9]);
xlim ([0 400]);
 title 'Espectro Normalizado'
      xeti1=text(410,0,'[ Hz ]');
    yeti1=text(0,1.2,'[cm/s ]');
        
%Diseño de filtro espectro de respuesta     
subplot (5,1,4);
ws=[1]/FS;
wp=[0.1];
[n,Wn]= buttord(wp,ws,0.64,30);
[B,A]=butter(n,Wn);
[h,fr]=freqz(B,A,[],FS);
plot(fr,abs(h));
xlim ([0 20]);
ylim ([0 2]);
 title 'DISEÑO DEL FILTRO Respuesta de amplitud'
   xeti1=text(0,-10,'[ Hz]');
    %yeti1=text(0,0,'[ Numero de Canal ]');

    
    
    %CONVOLUCIÓN DEL FILTRO
    tss=ts';
X=[tss,ewsct];
z=filter(B,A,X);
subplot (5,1,5);
c=z(:,2);
plot(ts,c);
 title 'GRAFICO DE LA SEÑAL FILTRADA'
    %xeti1=text(0,-10,'[ segundos ]');
    %yeti1=text(0,0,'[ Numero de Canal ]');
%esn=es/max(es);
%plot (a,esn); 
hold off;
