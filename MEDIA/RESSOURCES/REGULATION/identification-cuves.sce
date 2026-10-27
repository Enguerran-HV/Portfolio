
load("DataCuve.dat", "DEB", "N1", "N2");
DEB=DEB'
N1=N1'
N2=N2'
Duree=1200
NBpoints=601
Te=Duree/NBpoints
T=linspace(0,Duree,NBpoints);

plot(T,DEB,T,N1,T,N2) ;
// sleep ( 5000 ) ;
close ();

k1=1.8;          // valeur optimum : 1.507296
t1=50;           // valeur optimum : 96.351852
k2=0.8;          // valeur optimum : 0.6796535
t2=100;          // valeur optimum : 68.995165
s=poly(0,"s");
Num1=k1;
Den1=1+t1*s;
modele1=syslin('c',Num1,Den1)
sortiemod1=csim(DEB,T,modele1);
close();
plot(T,DEB,T,N1,T,sortiemod1')

// sleep (5000);
X0=[k1;t1]

XF = fminsearch(critere1,X0)

K1=XF(1);
T1=XF(2);
s=poly(0,"s");
Num1=K1;
Den1=1+T1*s;
modele1=syslin('c',Num1,Den1)
sortiemodele1=csim(DEB,T,modele1);
close();
plot(T,DEB,T,N1,T,sortiemodele1)

s=poly(0,"s");
Num2=k2;
Den2=1+t2*s;
modele2=syslin('c',Num2,Den2)
sortiemod2=csim(N1,T,modele2);
close();
plot(T,N1,T,N2,T,sortiemod2')

// sleep (5000);




X0=[k2;t2]

XF = fminsearch(critere2,X0)

K2=XF(1);
T2=XF(2);
s=poly(0,"s");
Num2=K2;
Den2=1+T2*s;
modele2=syslin('c',Num2,Den2)
sortiemodele2=csim(N1,T,modele2);
close();
plot(T,N1,T,N2,T,sortiemodele2)
