#!/bin/bash

fnhelp(){
    echo "# Desarrrollado por Edgar Evaristo Vasquez Lopez"
    echo "# Universidad de occidente"
    echo "dir"
    echo "dir /w"
    echo "cd"
    echo "cd .."
    echo "cd DIRECTORIO"
    echo "help"
    echo "md"
    echo "date"
    echo "time"
    echo "cls"
    echo "mem"
    echo "chdir"
    main
}
direccion="$(pwd)"
fnmsdos(){
    local d="EEVL:$direccion >"
    read -p "$d" command1 parameter option

    echo $command1
    echo $parameter
    if [ -n "$command1" ]; then
        case "${command1,,}" in
        dir)
            if [ -n "$parameter" ]; then
                if [ "$parameter" = "/w" ]; then
                    ls $direccion
                else
                    echo "Parametro desconocido"
                fi
            else
                ls -l $direccion
            fi
            
            ;;
         
        cd)
            if [ -n "$parameter" ]; then
                if [ -d "$parameter" ]; then
                    cd $parameter
                    direccion="$(pwd)"
                else
                    echo "La direccion no existe"
                fi
            else
                cd
                direccion = $(pwd)
            fi
            ;;
        md)
            if [ -n "$parameter" ]; then
                if [ -d "$parameter" ]; then
                   echo "La carpeta ya existe"
                else
                    mkdir $parameter
                fi
            else
                echo "Ingrese el nombre de la carpeta"
            fi
            ;;
        del)
            if [ -n "$parameter" ]; then
                if [ -d "$parameter" ]; then
                   rm $parameter
                else
                    echo "El archivo no existe"
                fi
            else
                echo "Ingrese el nombre del archivo"
            fi
            ;;
        help)
            help
            ;;
        date)
            date
            ;;  
        time)
            time
            ;;  
        cls)
            clear
            ;;   
        exit)
            echo "Desarrollado por Edgar Vasquez"
            exit
            ;; 
        mem)
            free
            ;; 
        chdir)
            pwd
            ;;     
        *)
            echo "Comando no reconocido"
        esac

    else
    echo "Comando incorrecto"
    fi 
    fnmsdos
}
main(){
    echo "interprete de comandos ms-dos"
    local opciones="msdos comandos salir"

    select opcion in $opciones;
    do
    echo $opcion
        if [ $opcion = "msdos" ]; then
            fnmsdos
        elif [ $opcion = "comandos" ]; then
            fnhelp
        elif [ $opcion = "salir" ]; then
            echo "Desarrollado por Edgar Vasquez"
            exit
        else 
            echo "Opcion incorrecta"
            main
        fi
    done
}
main



