import UIKit

var str = "Hello, playground"

/// Задание 1 - функция, которая определяет, четное число или нет
func isEvenNumber (_ a: Int) -> Bool {
	if (a % 2) == 0 {
		return true
	} else {
		return false
	}
}

/// Задание 2 - функция, которая определяет, делится ли число без остатка на 3
func isDevidedByThree (_ a: Int) -> Bool {
	if (a % 3) == 0 {
		return true
	} else {
		return false
	}
}

/// Задание 3 - создаем массив из 100 элементов
var array: [Int] = []

let length = 100
for i in 1...length {
	array.append(i)
}

/// Задание 4 - удаляем из массива все четные числа и числа, которые не делятся на 3
for (_, value) in array.enumerated() {
	if (isDevidedByThree(value) == false) || (isEvenNumber(value) == true) {
		array.remove(at: array.firstIndex(of: value)!)
	}
}
//print (array)


/// Задание 5 - написать функцию для числе Фиббоначи.

/// На 94-м числе программа перестаёт работать=( Но fibb(93) еще вычисляется. Видимо, дальше начинаются слишком большие значения для типа Int
func fibb(_ n: Int) -> [Int] {
	var arr: [Int] = []

	if (n == 1) {
		arr.append(1)
	} else if (n == 2) {
		arr.append(1)
		arr.append(1)
	} else {
		arr.append(1)
		arr.append(1)
		var a = arr[0]
		var b = arr[1]
		var value = 0
		for _ in 2...(n-1) {
			value = a + b
			a = b
			b = value
			arr.append(value)
		}
	}
	return arr
}

//print(fibb(100))


