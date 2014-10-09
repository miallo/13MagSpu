reset
set terminal epslatex color
set output 'Hall.tex'
set xlabel 'Position [cm]'
set ylabel 'Magnetfeld [Gs]'
set key box out vert bot center

#set xrange[0:0.001]
set fit logfile 'Hall.log'

mu0=4e-3*pi
I=0.5

n1=825
l1=0.449
R1=12.95/2 #cm

n2=499
l2=0.27
R2=10.0 #cm

a1(x)=x+l1*100/2
f1(x)=mu0*n1*I/l1
g1(x)=f1(x)/2*(a1(x)/sqrt(R1**2+a1(x)**2)+(l1*100-a1(x))/sqrt(R1**2+(l1*100-a1(x))**2))
h1(x)=g1(x)+b1

a2(x)=x+l2*100/2
f2(x)=mu0*n2*I/l2
g2(x)=f2(x)/2*(a2(x)/sqrt(R2**2+a2(x)**2)+(l2*100-a2(x))/sqrt(R2**2+(l2*100-a2(x))**2))
h2(x)=g2(x)+b2

fit h1(x) 'HallLang.dat' u 1:2:3 via b1
fit h2(x) 'HallDick.dat' u 1:2:3 via b2

p 'HallLang.dat' u 1:($2-b1):3 w e t'Lange Spule',\
   f1(x) t'Lange Spule: Näherung lange Spule',\
   g1(x) lt -1 t'Lange Spule: theoretischer Verlauf',\
  'HallDick.dat' u 1:($2-b2):3 w e t'Dicke Spule',\
   f2(x) t'Dicke Spule: Näherung lange Spule',\
   g2(x) lt -1 t'Dicke Spule: theoretischer Verlauf'

set output
!epstopdf Hall.eps
!rm Hall.eps
