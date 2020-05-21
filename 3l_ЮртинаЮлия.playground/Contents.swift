import UIKit

//1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

// Структура для автомобилей
struct Car {
	var mark: String
	var year: Int
	var volume: Double
	var isActiveMotor: String
	var isOpenWindow: String
	var filledVolume: Double

	enum Action {
		case ActivateMotor (active: Bool)
		case OpenWindows (openWindows: Bool)
		case AddWeight (weight: Double)
		case DeleteWeight (weight: Double)
	}

	mutating func changeState (act: Action) {
		switch act {
		case .ActivateMotor(active: let active):
			active ? (isActiveMotor = "двигатель запущен") : (isActiveMotor = "двигатель выключен")
		case .OpenWindows(openWindows: let openWindows):
			openWindows ? (isOpenWindow = "окна открыты") : (isOpenWindow = "окна закрыты")
		case .AddWeight(weight: let weight):
			filledVolume += weight
		case .DeleteWeight(weight: let weight):
			filledVolume -= weight
		}
	}

	func description() {
		print("Машина \(mark), год выпуска: \(year)г. , объем багажника = \(volume), заполеннный объем = \(filledVolume), у машины \(isActiveMotor) и \(isOpenWindow)")
	}

	init(markCar: String, yearCar: Int, volumeCar: Double) {
		self.mark = markCar
		self.year = yearCar
		self.volume = volumeCar
		self.isActiveMotor = "двигатель выключен"
		self.isOpenWindow = "окна закрыты"
		self.filledVolume = 0

	}

}

var reno = Car(markCar: "Reno Logan", yearCar: 2002, volumeCar: 100)
reno.changeState(act: .ActivateMotor(active: true))
reno.changeState(act: .AddWeight(weight: 70))
reno.changeState(act: .OpenWindows(openWindows: true))
reno.description()

var zhig = Car(markCar: "Жигули", yearCar: 1990, volumeCar: 60)
zhig.changeState(act: .ActivateMotor(active: true))
zhig.changeState(act: .AddWeight(weight: 100))
zhig.changeState(act: .OpenWindows(openWindows: true))
zhig.changeState(act: .DeleteWeight(weight: 80))
zhig.description()

// Структура для грузовиков
struct Truck {
	var mark: String
	var year: Int
	var volume: Double
	var isActiveMotor: String
	var isOpenWindow: String
	var filledVolume: Double

	enum Action {
		case ActivateMotor (active: Bool)
		case OpenWindows (openWindows: Bool)
		case AddWeight (weight: Double)
		case DeleteWeight (weight: Double)
	}

	mutating func changeState (act: Action) {
		switch act {
		case .ActivateMotor(active: let active):
			active ? (isActiveMotor = "двигатель запущен") : (isActiveMotor = "двигатель выключен")
		case .OpenWindows(openWindows: let openWindows):
			openWindows ? (isOpenWindow = "окна открыты") : (isOpenWindow = "окна закрыты")
		case .AddWeight(weight: let weight):
			filledVolume += weight
		case .DeleteWeight(weight: let weight):
			filledVolume -= weight
		}
	}

	func description() {
		print("Грузовик \(mark), год выпуска: \(year)г. , объем кузова = \(volume), заполеннный объем = \(filledVolume), у грузовика \(isActiveMotor) и \(isOpenWindow)")
	}

	init(markTruck: String, yearTruck: Int, volumeTruck: Double) {
		self.mark = markTruck
		self.year = yearTruck
		self.volume = volumeTruck
		self.isActiveMotor = "двигатель выключен"
		self.isOpenWindow = "окна закрыты"
		self.filledVolume = 0

	}

}

var kamaz = Truck(markTruck: "КамАЗ", yearTruck: 2009, volumeTruck: 300)
kamaz.changeState(act: .ActivateMotor(active: true))
kamaz.changeState(act: .AddWeight(weight: 200))
kamaz.changeState(act: .OpenWindows(openWindows: true))
kamaz.description()

