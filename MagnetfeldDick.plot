reset
set terminal epslatex color
set output 'SpuleDick.tex'
set xlabel 'Position [cm]'
set ylabel 'Magnetfeld [Gs]'
set key top left

#set xrange[0:0.001]

p 'HallDick.dat' u 1:2:3 w e t'Hallsonde'

set output
!epstopdf SpuleDick.eps
!rm SpuleDick.eps