reset
set terminal epslatex color
set output 'Homogen.tex'
set xlabel 'Position [cm]'
set ylabel 'Magnetfeld [Gs]'
set key box out vert bot center

#set xrange[0:0.001]

mu0=4e-3*pi
n=577
I=0.5
R=0.1

f(x)=mu0*I*0.8**1.5*n/R

p 'HallLang.dat' u 1:2:3 w e t'Lange Spule',\
  'HallDick.dat' u 1:2:3 w e t'Dicke Spule',\
  'HallHelm.dat' u 1:2:3 w e t'Helmholtzspule',\
  f(x) t'theo. Max. Helmholtzspule',\
  'HallLang.dat' u (-$1):2:3 w e lt 1 notitle,\
  'HallDick.dat' u (-$1):2:3 w e lt 2 notitle,\
  'HallHelm2.dat' u (-$1-3):2:3 w e lt 3 notitle


set output
!epstopdf Homogen.eps
!rm Homogen.eps