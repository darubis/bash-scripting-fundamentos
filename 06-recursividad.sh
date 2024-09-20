#!/bin/bash

# Ejercicio: Cuenta regresiva
# Función recursiva que imprime una cuenta regresiva desde el número dado hasta 0.
function countdown() {
    local number=$1  # Guardamos el argumento en una variable local.
    if [ $number -ge 0 ]; then  # Comprobamos si el número es mayor o igual a 0.
        echo $number  # Imprimimos el número actual.
        countdown $((number - 1))  # Llamamos recursivamente a la función con el número decrementado.
    fi
}

# Llamamos a la función 'countdown' con el valor inicial de 100.
countdown 100

# Extra: Factorial
# Función recursiva para calcular el factorial de un número.
function factorial() {
    local number=$1  # Guardamos el argumento en una variable local.
    if [ $number -lt 0 ]; then  # Si el número es negativo, no se puede calcular el factorial.
        echo "Los números negativos no son válidos"
        return 0  # Terminamos la función.
    elif [ $number -eq 0 ]; then  # Caso base: el factorial de 0 es 1.
        echo 1
    else  # Caso recursivo: factorial(n) = n * factorial(n - 1).
        local result=$((number * $(factorial $((number - 1)))))  # Calculamos el factorial de forma recursiva.
        echo $result  # Imprimimos el resultado.
    fi
}

# Imprimimos el resultado del factorial de 5 llamando a la función.
echo "Factorial de 5: $(factorial 5)"

# Extra: Fibonacci
# Función recursiva para calcular el n-ésimo número de la secuencia de Fibonacci.
function fibonacci() {
    local number=$1  # Guardamos el argumento en una variable local.
    if [ $number -le 0 ]; then  # Validamos que la posición sea mayor que 0.
        echo "La posición tiene que ser mayor que cero"
        return 0
    elif [ $number -eq 1 ]; then  # Caso base: el primer número de Fibonacci es 0.
        echo 0
    elif [ $number -eq 2 ]; then  # Caso base: el segundo número de Fibonacci es 1.
        echo 1
    else  # Caso recursivo: fibonacci(n) = fibonacci(n - 1) + fibonacci(n - 2).
        local result=$(( $(fibonacci $((number - 1))) + $(fibonacci $((number - 2))) ))  # Calculamos recursivamente.
        echo $result  # Imprimimos el resultado.
    fi
}

# Imprimimos el 5º número en la secuencia de Fibonacci llamando a la función.
echo "Fibonacci en la posición 5: $(fibonacci 5)"