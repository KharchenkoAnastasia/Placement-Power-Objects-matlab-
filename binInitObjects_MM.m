function PointG=binInitObjects_MM %#ok<STOUT>
%������� ������� ��������� ��������
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
global itogvpopul;
global itog;
stand = 0; % 1 ����������� ������, � - ������� �������
Pokazivatpop = 0;
Parents = 0;
ParentsCode = 0;
if (stand == 0)
NumberOfChromo = input('������� ������ � ��������� ');
NumberOfPovtorenii = input ('������� ���������� ���������� ��������');
NumberOfObjects = input ('������� ���������� ������������ ');
% define Objects




for i=1:1:NumberOfObjects
    disp ( '����� �����������')
    disp (i)
    Objects(i).Code=i;
   % Objects(i).X= input ('x - ');
   % Objects(i).Y=input ( 'y - ');
   % Objects(i).Power=input ( '�������� ����������� - ');
end;% for i
 
NumberOfPP = input ('������� ���������� ����� ���������� ���������� ����������� ');
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


NumberOfP = input('������� ���������� ����������� ');
ObjectsP=input ('�������� ���������� - ');
else
    % ����������� ������������
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
% �������� ����
if (Pokazivatpop == 1)
    disp( '��������� ���������');
    for j=1:1:NumberOfChromo
        for i=1:1:NumberOfP
            % disp(Chromosoma (j,i).mesto);
        end;
    end;
end;
disp( '��������� ���������');
disp(Chromosoma)
for h=1:1:NumberOfPovtorenii
    % ' �����������
    % disp (ltogvpopul) ;
    % 'POP'
    binCrossover_MM(h) ;
    %disp (itogvpopul) ;
     
     if (Pokazivatpop == 0)
        disp('������� ��� ���������');
        for j=1:1:itogvpopul
            for i=1:1:NumberOfP
                disp(Chromosoma (j,i).mesto);
            end;
        end;
    end;
     
    % ltogvpopul
    binFitness_MM (itogvpopul) ;
    % disp('��� ��������� ����� ����������� � ������� ������� ������')
    % disp (h) ;
    % disp (ltogvpopul) ;
    % ParentsCode
    if (Pokazivatpop == 0)
        disp('������� ��� ���������');
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
        disp('������� ���� ��������');
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
title('����������� ������������ �� ������������');
xlabel ('�') ;
ylabel ('�') ;
grid on;
bar (itog) ;
Ns = input (' ');
title('����������� ������������ �� ������������');
xlabel ( '�');
ylabel( '�');
grid on
binPlot_MM(TheBest)
