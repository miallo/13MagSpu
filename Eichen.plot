reset
set terminal epslatex color
set output 'Eichen.tex'
set xlabel 'Skalen-Teile'
set ylabel 'Ladung [nC]'
set key top left

#set xrange[0:0.001]

I=6.85e-7
f(x)=m*x

set fit logfile 'Eichen.log'
fit f(x) 'Eichen.dat' u 2:($1*I/1000) via m

p 'Eichen.dat' u 2:($1*I/1000*1e9):3 w xe t'Messwerte' ,\
(f(x)*1e9) lt -1 t'Regressionsgerade'

set output
!epstopdf Eichen.eps
!rm Eichen.eps
