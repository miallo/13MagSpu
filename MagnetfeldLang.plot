reset
set terminal epslatex color
set output 'SpuleLang.tex'
set xlabel 'Position [cm]'
set ylabel 'Magnetfeld [Gs]'
set key top left

#set yrange[0:*]

p 'IndSpule.dat' u 1:2:3 w e t'Induktion',\
  'HallLang.dat' u 1:2:3 w e t'Hallsonde'

set output
!epstopdf SpuleLang.eps
!rm SpuleLang.eps