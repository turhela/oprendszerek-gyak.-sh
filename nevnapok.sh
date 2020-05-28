#!/bin/bash

hasznalatiutmutato="Hasznalati utmutato:
./nevnap.sh -h honap sorszama (01-12) -n nap sorszama (1-31)
vagy ./nevnap ma
vagy ./nevnap osszes
vagy ./nevnap -h honap sorszama (01-12)"

if [ $# -eq 4 ]; then

	I=$1
	while [ "$I" != "" ]
	do
        case $I in
                -h)
                        shift
                        H=$1
                        ;;
                -n)
                        shift
                        N=$1
                        ;;
                *)
                        echo $hasznalatiutmutato
                        exit 1
                        ;;
        esac
        shift
        I=$1
	done
	cat nevnapoklista.txt | grep -w "$H $N"

	exit

elif [ $# -eq 2 ]; then
        I=$1
        while [ "$I" != "" ]
                do
                        case $I in
                                -h)
                                        shift
                                        H=$1
                                        ;;
                                *)
                                        echo $hasznalatiutmutato
                                        exit 1
                                        ;;
                        esac
                        shift
                        I=$1
                done

        cat nevnapoklista.txt | grep  ^"$H "
        exit
		
elif [ $# -eq 1 ]; then
        if [ $1 == "ma" ]; then
        datum=$(date +"%m %d")
        cat nevnapoklista.txt | grep ^"$datum "
        exit

        elif [ $1 == "osszes" ]; then
        cat nevnapoklista.txt
        exit

        else
        echo $hasznalatiutmutato
        exit 1
        fi

else echo $hasznalatiutmutato
exit 1
fi

