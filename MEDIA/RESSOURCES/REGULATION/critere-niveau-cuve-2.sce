function [valeur]=critere2(X)

load("DataCuve.dat", "DEB", "N1", "N2");

DEB=DEB'
N1=N1'
N2=N2'
Duree=1200
NBpoints=601
Te=Duree/NBpoints
T=linspace(0,Duree,NBpoints);
L=length(T)

K2=X(1);
T2=X(2);

s=poly(0,"s");
Nume=K2;
Deno=1+T2*s;
mod=syslin('c',Nume,Deno)

sortiemodele=csim(N1,T,mod);

// calcul du critère
som=0;
for I = 1:L,
som=som+((N2(I)-sortiemodele(I))^2);
end
c=sqrt(som/L);
valeur=c
return;
endfunction;
