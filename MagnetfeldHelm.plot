reset
set terminal epslatex color
set output 'SpuleHelm.tex'
set xlabel 'Position [cm]'
set ylabel 'Magnetfeld [Gs]'
set key top left

#set xrange[0:0.001]

p 'HallHelm.dat' u 1:2:3 w e t'Hallsonde'

set output
!epstopdf SpuleHelm.eps
!rm SpuleHelm.eps