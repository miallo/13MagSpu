reset
set terminal epslatex color
set output 'Eichen.tex'
set xlabel 'Skalen-Teile'
set ylabel 'Ladung [mC]'
set key top left

#set xrange[0:0.001]

f(x)=m*x+b
g(x)=a*x

set fit logfile 'Eichen.log'
fit f(x) 'Eichen.dat' u 2:($1*2/1000) via m,b
fit g(x) 'Eichen.dat' u 2:($1*2/1000) via a

p 'Eichen.dat' u 2:($1*2/1000):3 w xe t'Messwerte' ,\
f(x) lt -1 t'Regressionsgerade 1',\
g(x) lt 0 t'Regressionsgerade 2'

set output
!epstopdf Eichen.eps
!rm Eichen.eps