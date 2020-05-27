function PointG=binInitObjects_MM %#ok<STOUT>
%Функция задания начальных значений
global NumberOfObjects; %Количество точек потребления энергии
global NumberOfPP; % Количество точек, возможного размещения генераторов
global NumberOfP; % Количество генераторов
global Objects; %Потребители (Структура координаты, мощность)
global ObjectsPP; %Возможные точки размещения источников (координаты)
global ObjectsP; %Возможные варианты источников (мощность)
global Chromosoma;
global Parents;
global ParentsCode;
global NumberOfChromo;
global NumberOfPovtorenii;
global itogvpopul;
global itog;
stand = 0; % 1 стандартная задача, О - вводить вручную
Pokazivatpop = 0;
Parents = 0;
ParentsCode = 0;
if (stand == 0)
NumberOfChromo = input('Введите особей в популяции ');
NumberOfPovtorenii = input ('Введите предельное количество итераций');
NumberOfObjects = input ('Введите количество потребителей ');
% define Objects




for i=1:1:NumberOfObjects
    disp ( 'точка потребления')
    disp (i)
    Objects(i).Code=i;
   % Objects(i).X= input ('x - ');
   % Objects(i).Y=input ( 'y - ');
   % Objects(i).Power=input ( 'Мощность потребления - ');
end;% for i
 
NumberOfPP = input ('Введите количество точек возможного размещения генераторов ');
for i=1:1:NumberOfPP
    ObjectsPP(i).Code=i;
    %ObjectsPP(i).X= input ( 'x - ');
    %ObjectsPP(i).Y= input ( 'y - ');
end;%for l

    ObjectsPP(1).X=133.3909 ;
    ObjectsPP(1).Y=137.8364;
    
    ObjectsPP(2).X= 478.4182;
    ObjectsPP(2).Y=416.2909;
    
    ObjectsPP(3).X=681 ;
    ObjectsPP(3).Y=190.1455;
    
    ObjectsPP(4).X=150 ;
    ObjectsPP(4).Y=210;
    
    ObjectsPP(5).X= 240 ;
    ObjectsPP(5).Y= 240;
    
    ObjectsPP(6).X= 450;
    ObjectsPP(6).Y=360;
    
    ObjectsPP(7).X=480 ;
    ObjectsPP(7).Y=330;
    
    ObjectsPP(8).X=690 ;
    ObjectsPP(8).Y=150;
    
    ObjectsPP(9).X=750 ;
    ObjectsPP(9).Y=180;
    
    ObjectsPP(10).X=745 ;
    ObjectsPP(10).Y=175;


NumberOfP = input('Введите количество генераторов ');
ObjectsP=input ('Мощность генератора - ');
else
    % Стандартное расположение
    NumberOfChromo = 500;
    NumberOfPovtorenii =300;
NumberOfObjects = 51;
% define Objects
NumberOfPP =30;
NumberOfP = 8;
ObjectsP=1100;
end;
for j=1:1:NumberOfChromo
    for i=1:1:NumberOfP
        Chromosoma (j,i).Code=i;
        good = 0;
        while good == 0
            Chromosoma (j ,i) .mesto = randint(1,1,[1,NumberOfPP]) ;
            chek(i) = Chromosoma (j,i).mesto;
            good = 1;
            if (i == 1)
                good = 1;
            else
                for k=1:1:i-1
                    if (chek(k) == chek(i))
                        good = 0;
                    end;
                end;
            end;
        end;
    end;
end;
% bmFitness_MM(NumberOfChromo) ;
% ParentsCode
% Основной цикл
if (Pokazivatpop == 1)
    disp( 'Начальная популяция');
    for j=1:1:NumberOfChromo
        for i=1:1:NumberOfP
            % disp(Chromosoma (j,i).mesto);
        end;
    end;
end;
disp( 'Начальная популяция');
disp(Chromosoma)
for h=1:1:NumberOfPovtorenii
    % ' Скрещивание
    % disp (ltogvpopul) ;
    % 'POP'
    binCrossover_MM(h) ;
    %disp (itogvpopul) ;
     
     if (Pokazivatpop == 0)
        disp('Покажем кто получился');
        for j=1:1:itogvpopul
            for i=1:1:NumberOfP
                disp(Chromosoma (j,i).mesto);
            end;
        end;
    end;
     
    % ltogvpopul
    binFitness_MM (itogvpopul) ;
    % disp('Код популяции после скрещивания и расчета целевой фукции')
    % disp (h) ;
    % disp (ltogvpopul) ;
    % ParentsCode
    if (Pokazivatpop == 0)
        disp('Покажем кто получился');
        for j=1:1:itogvpopul
            for i=1:1:NumberOfP
                disp(Chromosoma (j,i).mesto);
            end;
        end;
    end;
    itog(h) = ParentsCode (1,2) ;
    TheBest = ParentsCode(1,1) ;
    Chromosoma
    for w=1:1:NumberOfChromo
        for i=1:1:NumberOfP
            %w
            %l
            %ParentsCode(w,1)
            %Chromosoma (ParentsCode(w, 1) , i) .mesto
            ChromosomaNew(w,i).mesto = Chromosoma (ParentsCode(w,1),i).mesto,
        end;
    end;
    Chromosoma = ChromosomaNew;
    if (Pokazivatpop == 1)
        disp('Покажем кого оставили');
        for j=1:1:NumberOfChromo
            for i=1:1:NumberOfP
                disp(Chromosoma (j,i).mesto);
            end;
        end;
    end;
    disp(ParentsCode);
    Parents = 0;
    ParentsCode = 0;
end;
title('Закрепление потребителей за генераторами');
xlabel ('х') ;
ylabel ('У') ;
grid on;
bar (itog) ;
Ns = input (' ');
title('Закрепление потребителей за генераторами');
xlabel ( 'х');
ylabel( 'у');
grid on
binPlot_MM(TheBest)
