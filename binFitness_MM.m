function Fit=binFitness_MM(Number)
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
for j=1:1:Number
    Parents(j,1) = j;
    % Создаем массив размещения генераторов для закрепления
    fit = 0;
    for i=1:1:NumberOfP
        ForPlase(i).p=ObjectsP;
        %J
        % Chromosoma (j,i).mesto
        % ObjectsPP(Chromosoma (j,i).mesto).X
        ForPlase(i).x = ObjectsPP(Chromosoma(j,i).mesto).X;
        ForPlase(i).y = ObjectsPP(Chromosoma(j,i).mesto).Y;
    end;
    %Собственно, процесс закрепления
    for i=1:1:NumberOfObjects
        znach = 10000000000000000; % Промежуточное значение привязки
        znach1=znach;
        pointg = 0; % Помер точки, к которой привязали потребителя
        % disp('Процесс закрепления начали для хромосомы')
        % disp(i);
        for k=1:1:NumberOfP
            % disp ('Пробуем номер генератора в хромосоме\остаточная мощность генератора\мощнсть потребителя')
            % disp (к);
            % disp (ForPlase(к) .р);
            % disp(Objects (i) .Power);
            if (ForPlase(k).p > Objects(i).Power)
                znach1 = sqrt ((ForPlase(k).x - Objects(i).X)^2 + (ForPlase(k).y - Objects (i). Y)^2)*Objects (i).Power;
                if (znach1 < znach)
                    znach = znach1;
                    pointg = k;
                end;
            end;
        end;
        if (pointg==0)
            pointg=1;
            znach=l0000000000000000;
        end;% if
        % disp('Процесс закр до расчета ФИТ\Точка генерации\Остаток мощности\Мощноств привязанного потребителя')
        %disp(fit) ;
        % disp (pomtg) ;
        % disp (ForPlase (pomtg) .p) ;
        % disp( Objects(1).Power) ;
        fit=fit+znach;
        ForPlase (pointg).p = ForPlase(pointg).p - Objects(i).Power; %Убрали генерацию, на мощность потребителя
        %disp('Процесс закр ФИТ\Точка генерации\Остаток мощности\Мощность привязанного потребителя')
        %disp (fit);
        %disp (pointg) ;
        %disp (ForPlase (pointg).p) ;
        %disp (Objects(i).Power);
    end;
    Parents (j ,2) = fit;
end;
ParentsCode = sortrows(Parents,2);
disp (ParentsCode);