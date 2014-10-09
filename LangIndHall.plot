reset
set terminal epslatex color
set output 'LangIndHall.tex'
set xlabel 'Position [cm]'
set ylabel 'Magnetfeld [Gs]'
set key box out vert bot center

#set yrange[0:*]
set fit logfile 'LangIndHall.log'


mu0=4e-3*pi
n=825
I=0.5
l=0.449
R=12.95/2 #cm

a(x)=x+l*100/2
f(x)=mu0*n*I/l
g(x)=f(x)/2*(a(x)/sqrt(R**2+a(x)**2)+(l*100-a(x))/sqrt(R**2+(l*100-a(x))**2))
h(x)=g(x+b)
i(x)=g(x)+c
fit h(x) 'IndSpule.dat' u (-$1):2:3 via b
fit i(x) 'HallLang.dat' u 1:2:3 via c

p 'IndSpule.dat' u (b-$1):2:3 w e t'Induktion',\
  'HallLang.dat' u 1:($2-c):3 w e t'Hallsonde',\
   f(x) t'Näherung lange Spule',\
   g(x) lt -1 t'theoretischer Verlauf'

set output
!epstopdf LangIndHall.eps
!rm LangIndHall.eps
