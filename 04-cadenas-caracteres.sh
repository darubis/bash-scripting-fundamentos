#!/bin/bash

s1="Hola"
s2="Bash"

# Concatenación
echo "$s1, $s2!"

# Repetición
echo "$s1$s1$s1"

# Indexación
echo "${s1:0:1}${s1:1:1}${s1:2:1}${s1:3:1}"

# Longitud
echo "${#s2}"

# Slicing (porción)
echo "${s2:2:4}"
echo "${s2:2}"
echo "${s2:0:2}"
echo "${s2:0:2}"

# Búsqueda
[[ "$s1" == *"a"* ]] && echo "true" || echo "false"
[[ "$s1" == *"i"* ]] && echo "true" || echo "false"

# Reemplazo
echo "${s1//o/a}"

# División
IFS='t' read -ra ADDR <<< "$s2"
echo "${ADDR[@]}"

# Mayúsculas, minúsculas y letras en mayúsculas
echo "${s1^^}"
echo "${s1,,}"
echo "$(echo "brais moure" | awk '{print toupper(substr($0,1,1))tolower(substr($0,2))}')"
echo "$(echo "brais moure" | awk '{print toupper(substr($1,1,1))tolower(substr($1,2))" "toupper(substr($2,1,1))tolower(substr($2,2))}')"

# Eliminación de espacios al principio y al final
echo "$(echo " brais moure " | xargs)"

# Búsqueda al principio y al final
[[ "$s1" == Ho* ]] && echo "true" || echo "false"
[[ "$s1" == Py* ]] && echo "true" || echo "false"
[[ "$s1" == *la ]] && echo "true" || echo "false"
[[ "$s2" == *thon ]] && echo "true" || echo "false"

s3="Brais Moure @mouredev"

# Búsqueda de posición
echo "$(awk -v a="$s3" -v b="moure" 'BEGIN{print index(a,b)}' - 1)"
echo "$(awk -v a="$s3" -v b="Moure" 'BEGIN{print index(a,b)}' - 1)"
echo "$(awk -v a="$s3" -v b="M" 'BEGIN{print index(a,b)}' - 1)"
echo "$(echo "$s3" | awk '{print tolower($0)}' | awk -v a="m" 'BEGIN{print index($0,a)}' - 1)"

# Búsqueda de ocurrencias
echo "$(echo "$s3" | tr '[:upper:]' '[:lower:]' | awk -v a="m" 'BEGIN{count=0}{for(i=1;i<=length($0);i++){if(substr($0,i,1)==a)count++}}END{print count}')"

# Formateo
echo "Saludo: $s1, lenguje: $s2!"

# Interpolación
echo "Saludo: $s1, lenguje: $s2!"

# Transformación en lista de caracteres
echo "$(echo "$s3" | grep -o . | tr '\n' ' ')"

# Transformación de lista en cadena
l1=("$s1" ", " "$s2" "!")
echo "${l1[*]}"

# Transformaciones numéricas
s4="123456"
s4=$(($s4))
echo "$s4"

s5="123456.123"
s5=$(awk "BEGIN {print $s5}")
echo "$s5"

# Comprobaciones varias
echo "$([[ "$s1" =~ ^[a-zA-Z0-9]+$ ]] && echo "true" || echo "false")"
echo "$([[ "$s1" =~ ^[a-zA-Z]+$ ]] && echo "true" || echo "false")"
echo "$([[ "$s4" =~ ^[a-zA-Z]+$ ]] && echo "false" || echo "true")"
echo "$([[ "$s4" =~ ^[0-9]+$ ]] && echo "true" || echo "false")"

# Extra
function check() {
    word1="$1"
    word2="$2"

    # Palíndromos
    reversed_word1="$(echo "$word1" | rev)"
    reversed_word2="$(echo "$word2" | rev)"
    [[ "$word1" == "$reversed_word1" ]] && echo "¿$word1 es un palíndromo?: true" || echo "¿$word1 es un palíndromo?: false"
    [[ "$word2" == "$reversed_word2" ]] && echo "¿$word2 es un palíndromo?: true" || echo "¿$word2 es un palíndromo?: false"

    # Anagramas
    sorted_word1="$(echo "$word1" | grep -o . | sort | tr -d '\n')"
    sorted_word2="$(echo "$word2" | grep -o . | sort | tr -d '\n')"
    [[ "$sorted_word1" == "$sorted_word2" ]] && echo "¿$word1 es anagrama de $word2?: true" || echo "¿$word1 es anagrama de $word2?: false"

    # Isogramas
    function isogram() {
        local word="$1"
        declare -A char_count

        for ((i=0; i<${#word}; i++)); do
            char="${word:i:1}"
            ((char_count["$char"]++))
        done

        local is_isogram=true
        local first_char_count=${char_count["${word:0:1}"]}

        for count in "${char_count[@]}"; do
            if [[ $count -ne $first_char_count ]]; then
                is_isogram=false
                break
            fi
        done

        [[ $is_isogram == true ]] && echo "true" || echo "false"
    }

    echo "¿$word1 es un isograma?: $(isogram "$word1")"
    echo "¿$word2 es un isograma?: $(isogram "$word2")"
}

check "radar" "basbashbashbashbash"