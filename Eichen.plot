reset
set terminal epslatex color
set output 'Eichen.tex'
set xlabel 'Skalen-Teile'
set ylabel 'Ladung [mC]'
set key top left

#set xrange[0:0.001]

f(x)=m*x+b

set fit logfile 'Eichen.log'
fit f(x) 'Eichen.dat' u 2:($1*2/1000) via m,b
p 'Eichen.dat' u 2:($1*2/1000):3 w xe t'Messwerte' ,\
f(x) lt -1 t'Regressionsgerade'

set output
!epstopdf Eichen.eps
