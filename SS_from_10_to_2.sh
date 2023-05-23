#!/bin/bash

# Проверка количества аргументов перед скриптом
if [ $# -ne 2 ]; then
    echo "Напишите: $0 <число> <система счисления: 2 или 10>"
    exit 1
fi

number=$1  # Значение числа
SS=$2

# Проверка, равна ли система счисления 10
if [ $SS -eq 10 ]; then

    # Преобразование десятичного числа в двоичное
    result=""
    while [ $number -gt 0 ] 
    do 
        remainder=$(( $number % 2 ))  # Остаток от деления на 2
        result="$remainder$result"  # Добавление остатка в начало результата
        number=$(( $number / 2 ))
    done
    echo "$1 в двоичной системе счисления: $result"
fi

number=$1

# Проверка наличия только 0 и 1 в двоичном числе с помощью регулярного выражения
if [[ ! $number =~ ^[01]+$ ]] 
then
    echo "Неправильное двоичное число: $number" >&2
    exit 1
fi

result=0
power=0

# Итерация по каждой цифре двоичного числа
while [ $number -gt 0 ] 
do
    digit=$(( number % 10 ))  # Получение последней цифры числа
    number=$(( number / 10 ))  # Удаление последней цифры числа

    result=$(( result + digit * 2**power ))  # Вычисление значения цифры и добавление к результату
    power=$(( power + 1 ))  # Увеличение степени для следующей цифры
done

echo "$1 в десятичной системе счисления: $result"
exit 0
