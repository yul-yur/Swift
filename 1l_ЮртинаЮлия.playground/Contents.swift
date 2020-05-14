import UIKit


/// 1. Квадратное уравнение
func equation (_ a: Double, _ b: Double, _ c: Double) { /// Подразумеваем, что квадратное уравнение вида ax^2 + bx + c = 0, a, b, c -  задаваемые коэффициенты
	var x1: Double
	var x2: Double

	if (a == 0) {
		if (b == 0) {
			print ("Некорректно заданы коэффициенты квадратного уравнения. Хотя бы «a» или «b» должен быть ненулевым")
		} else {
			x1 = -c/b
			print ("У уравнения один корень: x = \(x1)")
		}
	} else {
		let d = b * b - 4 * a * c
		if  (d < 0) {
			print ("Уравнение не имеет решения")
		} else if (d == 0) {
			x1 = -b / (2 * a)
			print ("У уравнения один корень: x = \(x1)")
		} else {
			x1 = (-b + sqrt(d)) / (2 * a)
			x2 = (-b - sqrt(d)) / (2 * a)
			print ("У уравнения 2 корня: x1 = \(x1), x2 = \(x2)")
		}
	}

}


/// тестируем функцию для решения квадратного уравнения
equation(1, -8, 15)
equation(0, 0, 9)


/// 2. Вычисляем гипотенузу, периметр и площадь для прямоугольного треугольника
func triangle (_ a: Double, _ b: Double) {

	if (a <= 0) || (b <= 0) {
		print ("Нужно задать катеты с положительными длинами")
	} else {
		let s = round((a*b/2)*100)/100 /// здесь и далее так пытаюсь округлить до сотых, чтоб не было некрасивого длинного хвоста после точка
		let gip = round((sqrt(a * a + b * b) * 100)) / 100
		let perimetr = round((a + b + gip) * 100) / 100

		print ("Площадь треугольника = \(s), гипотенуза = \(gip), периметр = \(perimetr)")

	}
}


/// тестируем функцию для треугольника
triangle (-4, 9.4)
triangle (8,  10)


/// 3. Вычисляем сумму вклада через 5 лет
func deposit (_ sum: Double, _ percent: Double) {
	let years: Int = 5
	var resultMoney = sum
	if (sum <= 0) || percent <= 0 {
		print ("Нужно ввести положительные сумму и процент")
	} else {
		for _ in 1...years {
			resultMoney += resultMoney * percent / 100
		}
		resultMoney = round(resultMoney * 100) / 100
		print ("Через \(years) лет размер вклада на счёте = \(resultMoney) рублей")

	}
}

/// тестируем функцию для вычисления депозита через 5 лет
deposit (9000, 5)
deposit (40000, 0)


