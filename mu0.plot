set fit logfile 'mu0.log'

I=0.5

n1=825
l1=0.449
R1=12.95/2 #cm

n2=499
l2=0.27
R2=10.0 #cm

n=577
R=0.1

a1(x)=x+l1*100/2
f1(x)=mu01*n1*I/l1
g1(x)=f1(x)/2*(a1(x)/sqrt(R1**2+a1(x)**2)+(l1*100-a1(x))/sqrt(R1**2+(l1*100-a1(x))**2))
h1(x)=g1(x)+b1
i1(x)=g1(x+c)

a2(x)=x+l2*100/2
f2(x)=mu02*n2*I/l2
g2(x)=f2(x)/2*(a2(x)/sqrt(R2**2+a2(x)**2)+(l2*100-a2(x))/sqrt(R2**2+(l2*100-a2(x))**2))
h2(x)=g2(x)+b2

a3(x)=x+R/2
f3(x)=mu03*n*I
g3(x)=f3(x)/2*((R**2)/(R**2+a3(x)**2)**1.5+(R**2)/(R**2+(R-a3(x))**2)**1.5)
h3(x)=g3((x+0.015)/0.6)

fit h1(x) 'HallLang.dat' u 1:2:3 via b1, mu01
fit i1(x) 'IndSpule.dat' u 1:2:3 via c, mu01
fit h2(x) 'HallDick.dat' u 1:2:3 via b2, mu02
fit h3(x) 'HallHelm.dat' u ($1/100):2:3 via mu03

set terminal windows
p h3(x), 'HallHelm.dat' u ($1/100):2:3 w e t'Helmholtzspule'