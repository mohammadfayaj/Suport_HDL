%curatam linia de comanda, workspace
clear all; 
close all; 
clc;
for t = 10
    %Introducem de la tastatura numarul itnrarilor
    %prompt = 'Dati numarul de intrari: ';
    %prompt;
    n = t;
    %Deschidem un fisier de tip txt
    file_name = sprintf('pe%d.txt',t);
    fileID = fopen(file_name,'wt');
    %Creare format BLIF
    fprintf(fileID,'%s\n%s','.model priority_encoder','.inputs ');
    for i = 1:n
        fprintf(fileID, ' I%d', i-1);
    end
    %Verificat numar de biti necesari pentru iesire
    c=n;
    count = 0;
    if rem(log2(c),1)==0
        while(c)
            count=count+1;
            c=bitshift(c,-1); 
        end
        count=count-1;
    else    
        while(c)
            count=count+1;
            c=bitshift(c,-1);
        end
    end
    sprintf('Numar biti necesari: %d\n',count)
    %Creare format BLIF
    fprintf(fileID,'\n%s','.outputs');
    for i = 1:count+1
        fprintf(fileID, ' C%d', i-1);
    end
    %Generare matrice de intrare si iesire
    I = flipud(diag(ones(n,1)));
    b=zeros(1,n);
    k=0;
    I = [I(1:k,:); b; I(k+1:end,:)]
    C = de2bi(0:n-1,count,'left-msb');
    e=ones(n,1);
    C = [C e];
    f=zeros(1,count+1);
    C = [C(1:k,:); f; C(k+1:end,:)]

    fprintf(fileID,'\n');
    %Creare continut fisier BLIF
    for j=1:count+1
        fprintf(fileID,'%s','.names');
        for u=1:n
            fprintf(fileID, ' I%d', u-1);
        end
        fprintf(fileID,' C%d', j-1);
        for i=1:n+1
            fprintf(fileID, '\n');
            if C(i,j) == 0
                fprintf(fileID, '%s', '#');
                for p=1:n;
                    if p>n-i+2
                        fprintf(fileID, '%s', '-');
                    else
                        fprintf(fileID, '%d', I(i,p));
                    end
                end
            else
                for p=1:n;
                    if p>n-i+2
                        fprintf(fileID, '%s', '-');
                    else
                        fprintf(fileID, '%d', I(i,p));
                    end;
                end
            end
            fprintf(fileID,' %d', C(i,j));
        end
        fprintf(fileID,'\n');
    end
    fprintf(fileID,'%s','.end');
    fclose(fileID);
end
