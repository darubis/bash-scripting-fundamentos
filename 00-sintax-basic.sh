#!/bin/bash

# URL del sitio web oficial de Bash: https://www.gnu.org/software/bash/

# COMENTARIOS

# Esto es un comentario de una linea.

: '
  Este es un comentario 
  de varias lineas
'

: << EOF

Esto también es un comentario multi línea.

EOF


<< 'Comment' 
    El heredoc se usa para pasar entradas multilíneas a un
    comando. Se puede aprovechar para hacer un comentario
    multilinea al no pasarselo a ningún comando aunque no
    es lo mas apropiado. De hechos Visual Code lo adminte pero
    lo señala como error
Comment


# VARIABLES

variable=0                          # variable
readonly constant="Mi constante"    # constante


declare constante="constante"
echo "Esto es una $constante"

function my_function {
  local variable_local=0            # variable local
}

# TIPOS DE DATOS

variable="String"                   # String
variable=1                          # Int
variable=("rojo" "verde" "azul")    # Array
variable=true                       # Boolean

declare -A dictionary
dictionary[valor]='valor1'          # diccionario

# Hola mundo
echo "Hola, Bash!"                  # echo sirve para imprimir en la terminal

# Para llamar a una variable se usa el simbolo $[nombre de la variable]
variable="Hola Bash"
echo $variable    