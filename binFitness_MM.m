function Fit=binFitness_MM(Number)
global NumberOfObjects; %���������� ����� ����������� �������
global NumberOfPP; % ���������� �����, ���������� ���������� �����������
global NumberOfP; % ���������� �����������
global Objects; %����������� (��������� ����������, ��������)
global ObjectsPP; %��������� ����� ���������� ���������� (����������)
global ObjectsP; %��������� �������� ���������� (��������)
global Chromosoma;
global Parents;
global ParentsCode;
global NumberOfChromo;
global NumberOfPovtorenii;
for j=1:1:Number
    Parents(j,1) = j;
    % ������� ������ ���������� ����������� ��� �����������
    fit = 0;
    for i=1:1:NumberOfP
        ForPlase(i).p=ObjectsP;
        %J
        % Chromosoma (j,i).mesto
        % ObjectsPP(Chromosoma (j,i).mesto).X
        ForPlase(i).x = ObjectsPP(Chromosoma(j,i).mesto).X;
        ForPlase(i).y = ObjectsPP(Chromosoma(j,i).mesto).Y;
    end;
    %����������, ������� �����������
    for i=1:1:NumberOfObjects
        znach = 10000000000000000; % ������������� �������� ��������
        znach1=znach;
        pointg = 0; % ����� �����, � ������� ��������� �����������
        % disp('������� ����������� ������ ��� ���������')
        % disp(i);
        for k=1:1:NumberOfP
            % disp ('������� ����� ���������� � ���������\���������� �������� ����������\������� �����������')
            % disp (�);
            % disp (ForPlase(�) .�);
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
        % disp('������� ���� �� ������� ���\����� ���������\������� ��������\�������� ������������ �����������')
        %disp(fit) ;
        % disp (pomtg) ;
        % disp (ForPlase (pomtg) .p) ;
        % disp( Objects(1).Power) ;
        fit=fit+znach;
        ForPlase (pointg).p = ForPlase(pointg).p - Objects(i).Power; %������ ���������, �� �������� �����������
        %disp('������� ���� ���\����� ���������\������� ��������\�������� ������������ �����������')
        %disp (fit);
        %disp (pointg) ;
        %disp (ForPlase (pointg).p) ;
        %disp (Objects(i).Power);
    end;
    Parents (j ,2) = fit;
end;
ParentsCode = sortrows(Parents,2);
disp (ParentsCode);