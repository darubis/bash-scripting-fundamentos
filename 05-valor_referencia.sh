#!/bin/bash

# Tipos de dato por valor

my_int_a=10
my_int_b=$my_int_a
my_int_b=20
# my_int_a=30
echo $my_int_a
echo $my_int_b

# Tipos de dato por referencia (simulado con arrays)

my_list_a=(10 20)
my_list_b=("${my_list_a[@]}")
my_list_b+=(30)
echo "${my_list_a[@]}"
echo "${my_list_b[@]}"

# Funciones con datos por valor

my_int_func() {
    local my_int=$1
    my_int=20
    echo $my_int
}

my_int_c=10
my_int_func $my_int_c
echo $my_int_c

# Funciones con datos por referencia (simulado con arrays)

my_list_func() {
    local -n my_list=$1
    my_list+=(30)

    my_list_d=("${my_list[@]}")
    my_list_d+=(40)

    echo "${my_list[@]}"
    echo "${my_list_d[@]}"
}

my_list_c=(10 20)
my_list_func my_list_c
echo "${my_list_c[@]}"

# Extra

# Por valor

value() {
    local temp=$1
    local value_a=$2
    local value_b=$temp
    echo "$value_a $value_b"
}

my_int_d=10
my_int_e=20
read my_int_f my_int_g <<< "$(value $my_int_d $my_int_e)"

echo "$my_int_d, $my_int_e"
echo "$my_int_f, $my_int_g"

# Por referencia (simulado con arrays)

ref() {
    local temp=("${!1}")
    eval "$1=(\"\${!2}\")"
    eval "$2=(\"\${temp[@]}\")"
    echo "${!1[@]} ${!2[@]}"
}

my_list_e=(10 20)
my_list_f=(30 40)
read -a my_list_g <<< "$(ref my_list_e[@] my_list_f[@])"

echo "${my_list_e[@]}, ${my_list_f[@]}"
echo "${my_list_g[@]}"