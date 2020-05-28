import UIKit

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.

enum Motor: String{
	case on = "заведен"
	case off = "заглушен"
}

enum Windows: String {
	case open = "открыты"
	case close = "закрыты"
}

enum Roofs: String {
	case open = "открыта"
	case close = "закрыта"
}

enum Transmission: String {
	case auto = "автомат"
	case mechanics = "механика"
}

//enum Action {
//
//	case ActivateMotor(active: Motor)
//
//	case CarWindows(window: Windows)
//
//	case OpenRoof(roof: Roofs)
//
//	case ChangeTransmission(trans: Transmission)
//
//	case AddTrailers(trailer: Int)
//	case RemoveTrailers(trailer: Int)
//
//
//}

protocol Car {
	var mark: String {get}
	var releaseYear: Int {get}
	var engine: Motor {get set}
	var windows: Windows {get set}

	func Action ()
}

extension Car {
	mutating func ActivateMotor(act: Motor){
		engine = Motor(rawValue: act.rawValue)!
	}

}

extension Car {
	mutating func CarWindows (act: Windows) {
		windows = Windows(rawValue: act.rawValue)!
	}
}

class sportCar: Car {
	var mark: String
	var releaseYear: Int
	var engine: Motor
	var windows: Windows

	var maxSpeed: Int
	var isOpenRoof: Roofs

	func Action() {

	}

	init (mark: String, releaseYear: Int) {
		self.mark = mark
		self.releaseYear = releaseYear
		self.engine = .off
		self.windows  = .close
		self.maxSpeed = 400
		self.isOpenRoof = .close
	}

}

class truckCar: Car {
	var mark: String
	var releaseYear: Int
	var engine: Motor
	var windows: Windows

	var trailers: Int
	var transmission: Transmission

	func Action() {

	}

	init (mark: String, releaseYear: Int) {
		self.mark = mark
		self.releaseYear = releaseYear
		self.engine = .off
		self.windows  = .close
		self.trailers = 0
		self.transmission = .mechanics
	}

}

extension sportCar: CustomStringConvertible {

	func OpenRoof (act: Windows) {
		isOpenRoof = Roofs(rawValue: act.rawValue)!
	}

	var description: String {
		return ("Спортивный автомобиль марки \(mark), год выпуска \(releaseYear), максимальная скорость - \(maxSpeed) км/ч, крыша авто \(isOpenRoof.rawValue), окна \(windows.rawValue), мотор \(engine.rawValue).")
	}
}

extension truckCar: CustomStringConvertible {

	func AddTrailers (tr: Int) {
		trailers += tr
	}

	func changeTransmission (act: Transmission) {
		transmission = Transmission(rawValue: act.rawValue)!
	}
	var description: String {
		return ("Грузовик марки \(mark), год выпуска \(releaseYear), количество прицепов - \(trailers), коробка передачи - \(transmission.rawValue), окна \(windows.rawValue), мотор \(engine.rawValue). ")
	}
}

var kamaz = truckCar(mark: "КамАЗ", releaseYear: 1999)
kamaz.changeTransmission(act: .auto)
kamaz.AddTrailers(tr: 4)
kamaz.ActivateMotor(act: .on)
print(kamaz.description)

var ferrari = sportCar(mark: "Ferrari F430", releaseYear: 2013)
ferrari.ActivateMotor(act: .on)
ferrari.CarWindows(act: .open)
//ferrari.OpenRoof(act: .open)
print(ferrari.description)


