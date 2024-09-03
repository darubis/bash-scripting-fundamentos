#!/bin/bash

# Listas
my_list=("Brais" "Bl4ck" "Wolfy" "Visionos")
echo "${my_list[@]}"
my_list+=("Castor")  # Inserción
my_list+=("Castor")
echo "${my_list[@]}"
my_list=("${my_list[@]/Brais}")  # Eliminación
echo "${my_list[@]}"
echo "${my_list[1]}"  # Acceso
my_list[1]="Cuervillo"  # Actualización
echo "${my_list[@]}"
IFS=$'\n' my_list=($(sort <<<"${my_list[*]}"))  # Ordenación
unset IFS
echo "${my_list[@]}"
echo "$(declare -p my_list)"

# Tuplas (en Bash no existen tuplas, pero simulamos con arrays)
my_tuple=("Brais" "Moure" "@mouredev" "36")
echo "${my_tuple[1]}"  # Acceso
echo "${my_tuple[3]}"
IFS=$'\n' my_tuple=($(sort <<<"${my_tuple[*]}"))  # Ordenación
unset IFS
echo "${my_tuple[@]}"
echo "$(declare -p my_tuple)"

# Sets (en Bash no existen sets, pero simulamos con arrays)
my_set=("Brais" "Moure" "@mouredev" "36")
echo "${my_set[@]}"
if [[ ! " ${my_set[*]} " =~ " mouredev@gmail.com " ]]; then
  my_set+=("mouredev@gmail.com")  # Inserción
fi
echo "${my_set[@]}"
my_set=("${my_set[@]/Moure}")  # Eliminación
echo "${my_set[@]}"
IFS=$'\n' my_set=($(sort <<<"${my_set[*]}"))  # Ordenación
unset IFS
echo "${my_set[@]}"
echo "$(declare -p my_set)"

# Diccionario (en Bash no existen diccionarios, pero simulamos con arrays asociativos)
declare -A my_dict=(
  ["name"]="Brais"
  ["surname"]="Moure"
  ["alias"]="@mouredev"
  ["age"]="36"
)
my_dict["email"]="mouredev@gmail.com"  # Inserción
echo "${my_dict[@]}"
unset my_dict["surname"]  # Eliminación
echo "${my_dict[@]}"
echo "${my_dict["name"]}"  # Acceso
my_dict["age"]="37"  # Actualización
for key in "${!my_dict[@]}"; do
  sorted_dict+=(["$key"]="${my_dict[$key]}")
done
echo "${sorted_dict[@]}"
echo "$(declare -p my_dict)"

# Agenda
function my_agenda() {
  declare -A agenda

  function insert_contact() {
    read -p "Introduce el teléfono del contacto: " phone
    if [[ "$phone" =~ ^[0-9]{1,11}$ ]]; then
      agenda["$name"]="$phone"
    else
      echo "Debes introducir un número de teléfono de un máximo de 11 dígitos."
    fi
  }

  while true; do
    echo ""
    echo "1. Buscar contacto"
    echo "2. Insertar contacto"
    echo "3. Actualizar contacto"
    echo "4. Eliminar contacto"
    echo "5. Salir"

    read -p "Selecciona una opción: " option

    case "$option" in
      1)
        read -p "Introduce el nombre del contacto a buscar: " name
        if [[ -n "${agenda[$name]}" ]]; then
          echo "El número de teléfono de $name es ${agenda[$name]}."
        else
          echo "El contacto $name no existe."
        fi
        ;;
      2)
        read -p "Introduce el nombre del contacto: " name
        insert_contact
        ;;
      3)
        read -p "Introduce el nombre del contacto a actualizar: " name
        if [[ -n "${agenda[$name]}" ]]; then
          insert_contact
        else
          echo "El contacto $name no existe."
        fi
        ;;
      4)
        read -p "Introduce el nombre del contacto a eliminar: " name
        if [[ -n "${agenda[$name]}" ]]; then
          unset agenda["$name"]
        else
          echo "El contacto $name no existe."
        fi
        ;;
      5)
        echo "Saliendo de la agenda."
        break
        ;;
      *)
        echo "Opción no válida. Elige una opción del 1 al 5."
        ;;
    esac
  done
}

my_agenda