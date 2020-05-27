function C=binCrossoverMM(PWQ)
global NumberOfObjects; %Количество точек потребления энергии
global NumberOfPP; % Количество точек, возможного размещения генераторов
global NumberOfP; % Количество генераторов
global Objects;%Потребители (Структура координаты, мощность)
global ObjectsPP; %Возможные точки размещения источников (координаты)
global ObjectsP; %Возможные варианты источников (мощность)
global Chromosoma;
global Parents;
global ParentsCode;
global NumberOfChromo;
global NumberOfPovtorenii;
global itogvpopul;
itogvpopul = NumberOfChromo;
detei=NumberOfChromo;
for z=1:1:NumberOfChromo
    % Возьмем случайным образом две хромосомы
    chrom1 = randint(1,1, [1 ,NumberOfChromo]);
    chrom2 = randint(1,1, [1,NumberOfChromo]);
    %chroml
    %chrom2
    ostgen = 0;
    ku = 0;
    % Создадим код первой хромосомы для скрещивания
    for a=1:1:NumberOfP
        good = 1;
        for q=1:1:NumberOfP
            if ( Chromosoma (chrom1,a).mesto == Chromosoma (chrom2,q).mesto)
                good = 0;
            end;
        end;
        if (good==1)
            ostgen = ostgen + 1;
            code1(ostgen) = Chromosoma (chrom1,a).mesto;
        end;
    end;
    % Создадим код второй хромосомы для скрещивания
    ostgen = 0;
    ku = 0;
    for a=1:1:NumberOfP
        good = 1;
        for q=1:1:NumberOfP
            if (Chromosoma (chrom1,a).mesto == Chromosoma(chrom2,q).mesto)
                good = 0;
            end;
        end;
        if (good == 1)
            ostgen = ostgen + 1;
            code2 (ostgen) = Chromosoma(chrom2,a).mesto;
        else
            ku = ku + 1 ;
            kogoubrali(ku) = Chromosoma (chrom2,a).mesto;
        end;
    end;
    %До6ъем хромосомы одинаковыми генами
    for f=1:1:ku
        code1(ostgen + f) = kogoubrali(f);
        code2(ostgen + f) = kogoubrali(f);
    end;
    if (ostgen<2)
        %Получилось так, что две хромосомы одинаковые, скрещивать не имеет
        %смысла
    else
        detei=detei+1;
       
        %Скрещиваем
        %Генерирем точку разреза
        tochkarazreza = randint (1,1, [ 1 ,ostgen]) ;
        if (tochkarazreza == ostgen)
            tochkarazreza = tochkarazreza - 1;
        end;
        %'делаем первого потомка'
        for s=1:1:NumberOfP
            if (s<=tochkarazreza)
                Chromosoma (detei,s).mesto = code1(s);
            else
                Chromosoma(detei,s).mesto = code2(s);
            end;
        end;
        detei=detei+1;
        %' делаем второго потомка'
        for s=1:1:NumberOfP
            if (s<=tochkarazreza)
                Chromosoma (detei,s).mesto = code2(s);
            else
                Chromosoma(detei,s).mesto = code1(s);
            end;
        end;
    end;
    itogvpopul = detei;
end;
