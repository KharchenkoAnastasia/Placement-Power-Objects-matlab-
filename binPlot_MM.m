function B=binPlot_MM(Number)
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
for i=1:1:NumberOfP
    disp (i) ;
    ForPlase(i).p = ObjectsP;
    ForPlase(i).x = ObjectsPP(Chromosoma (Number,i).mesto).X;
    disp (ObjectsPP(Chromosoma(Number,1).mesto).X);
    ForPlase(i).y= ObjectsPP(Chromosoma (Number,i) .mesto). Y;
    disp(ObjectsPP(Chromosoma (Number,1) .mesto) .Y);
end;
% ������
for i=1:1:NumberOfObjects
    znach = 10000000000000000; % ������������� �������� ��������
    pointg = 0; % ����� �����, � ������� ��������� �����������
    for k=1:1:NumberOfP
        if (ForPlase(k).p > Objects(i).Power)
            znach1 = sqrt ((ForPlase(k).x - Objects(i).X)^2 + (ForPlase(k).y -Objects(i).Y)^2) ;
        else znach1=1000000000;
        end;
        if (znach1 < znach)
            znach = znach1;
            pointg = k;
        end;
    end;
    %disp (i) ;
    %znach=znach
   % if (pointg==1)
    %    string= [num2str(i) ,'', num2str(Objects(i).Power), '' , ' ' ,num2str(pointg),'', num2str(znach)];
     %   disp(string)
   % end
    ForPlase (pointg).p = ForPlase (pointg).p - Objects (i).Power; %������ ���������, �� �������� �����������
    plotx(1) = int32 (Objects (i).X) ;
    ploty(1) = int32 (Objects (i). Y) ;
    plotx(2) = int32 (ForPlase(pointg).x) ;
    ploty(2) = int32 (ForPlase(pointg). y) ;

    plot (plotx,ploty)

    i=i
    Objects (i).X
    Objects (i).Y
    Objects (i).Power

    pointg=pointg
    ForPlase (pointg).x
    ForPlase (pointg).y
    title ('����������� ������������ �� ������������');
    xlabel('�');
    ylabel( '�');
    grid on;
    hold on
end;