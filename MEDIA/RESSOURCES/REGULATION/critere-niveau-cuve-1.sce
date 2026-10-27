function [valeur]=critere1(X)

load("DataCuve.dat", "DEB", "N1", "N2");

DEB=DEB'
N1=N1'
N2=N2'
Duree=1200
NBpoints=601
Te=Duree/NBpoints
T=linspace(0,Duree,NBpoints);
L=length(T)
K1=X(1);
T1=X(2);

s=poly(0,"s");
Nume=K1;
Deno=1+T1*s;
mod=syslin('c',Nume,Deno)

sortiemodele=csim(DEB,T,mod);

// calcul du critère
som=0;
for I = 1:L,
som=som+((N1(I)-sortiemodele(I))^2);
end
c=sqrt(som/L);
valeur=c
return;
endfunction;
