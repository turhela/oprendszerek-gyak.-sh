#!/bin/bash
echo "Add meg a negyzetes tag egyutthatojat!"
read a 
echo "Add meg az elsofoku tag egyutthatojat!"
read b
echo"Add meg a konstanst!"
read c 

D=`echo "scale=2; $b^2-4*$a*$c" |bc`

if [ $a -ne 0 ]; then
if [ $D -ge 0 ]; then
x1=`echo "scale=2; (-$b+sqrt($D))/(2*$a)" | bc`
x2=`echo "scale=2; (-$b-sqrt($D))/(2*$a)" | bc`
echo "x1= $x1 , x2= $x2"
exit
else
echo "Nincs megoldasa a valos szamok halmazan"
exit
fi 
else
x=`echo "scale=2; $c/$b" | bc`
echo "x=$x"
exit 
fi

