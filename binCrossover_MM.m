function C=binCrossoverMM(PWQ)
global NumberOfObjects; %���������� ����� ����������� �������
global NumberOfPP; % ���������� �����, ���������� ���������� �����������
global NumberOfP; % ���������� �����������
global Objects;%����������� (��������� ����������, ��������)
global ObjectsPP; %��������� ����� ���������� ���������� (����������)
global ObjectsP; %��������� �������� ���������� (��������)
global Chromosoma;
global Parents;
global ParentsCode;
global NumberOfChromo;
global NumberOfPovtorenii;
global itogvpopul;
itogvpopul = NumberOfChromo;
detei=NumberOfChromo;
for z=1:1:NumberOfChromo
    % ������� ��������� ������� ��� ���������
    chrom1 = randint(1,1, [1 ,NumberOfChromo]);
    chrom2 = randint(1,1, [1,NumberOfChromo]);
    %chroml
    %chrom2
    ostgen = 0;
    ku = 0;
    % �������� ��� ������ ��������� ��� �����������
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
    % �������� ��� ������ ��������� ��� �����������
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
    %��6��� ��������� ����������� ������
    for f=1:1:ku
        code1(ostgen + f) = kogoubrali(f);
        code2(ostgen + f) = kogoubrali(f);
    end;
    if (ostgen<2)
        %���������� ���, ��� ��� ��������� ����������, ���������� �� �����
        %������
    else
        detei=detei+1;
       
        %����������
        %��������� ����� �������
        tochkarazreza = randint (1,1, [ 1 ,ostgen]) ;
        if (tochkarazreza == ostgen)
            tochkarazreza = tochkarazreza - 1;
        end;
        %'������ ������� �������'
        for s=1:1:NumberOfP
            if (s<=tochkarazreza)
                Chromosoma (detei,s).mesto = code1(s);
            else
                Chromosoma(detei,s).mesto = code2(s);
            end;
        end;
        detei=detei+1;
        %' ������ ������� �������'
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
