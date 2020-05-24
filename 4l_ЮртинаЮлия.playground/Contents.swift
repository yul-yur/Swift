import UIKit

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.


enum Action {
	enum Engine: String{
		case on = "заведен"
		case off = "заглушен"
	}
	case ActivateMotor(active: Engine)

	enum Windows: String {
		case open = "открыты"
		case close = "закрыты"
	}
	case CarWindows(window: Windows)

	enum Roofs: String {
		case open = "открыта"
		case close = "закрыта"
	}
	case OpenRoof(roof: Roofs)



	enum Transmission: String {
		case auto = "автомат"
		case mechanics = "механика"
	}
	case ChangeTransmission(trans: Transmission)

	case AddTrailers(trailer: Int)
	case RemoveTrailers(trailer: Int)


}


class Car {
	var mark: String
	var yearOfRelease: Int
	var engine: Action.Engine
	var windows: Action.Windows

	func Action (act: Action) {

	}

	init(mark: String, yearOfRelease: Int) {
		self.mark = mark
		self.yearOfRelease = yearOfRelease
		self.engine = .off
		self.windows = .close

	}

}


class SportCar: Car {
	var maxSpeed: Int
	var isOpenRoof: Action.Roofs

	override init (mark: String, yearOfRelease: Int) {
		self.isOpenRoof = .close
		self.maxSpeed = 400
		super.init(mark: mark, yearOfRelease: yearOfRelease)
	}

	override func Action(act: Action) {
		switch act {

		case .ActivateMotor(active: let active) where active == .off:
			engine = .off
		case .ActivateMotor(active: let active) where active == .on:
			engine = .on

		case .CarWindows(window: let window) where window == .close:
			windows = .close
		case .CarWindows(window: let window) where window == .open:
			windows = .open

		case .OpenRoof(roof: let roof) where roof == .close:
			isOpenRoof = .close
		case .OpenRoof(roof: let roof) where roof == .open:
			isOpenRoof = .open
		default:
			break
		}

	}

	func description() {
		print ("Спортивный автомобиль марки \(mark), год выпуска \(yearOfRelease), максимальная скорость - \(maxSpeed) км/ч, крыша авто \(isOpenRoof.rawValue), окна \(windows.rawValue), мотор \(engine.rawValue).")
	}


}

class TruckCar: Car {
	var trailers: Int
	var transmission: Action.Transmission

	override init (mark: String, yearOfRelease: Int) {
		self.trailers = 0
		self.transmission = .mechanics
		super.init(mark: mark, yearOfRelease: yearOfRelease)
	}

	override func Action(act: Action) {
		switch act {

		case .ActivateMotor(active: let active) where active == .off:
			engine = .off
		case .ActivateMotor(active: let active) where active == .on:
			engine = .on

		case .CarWindows(window: let window) where window == .close:
			windows = .close
		case .CarWindows(window: let window) where window == .open:
			windows = .open

		case .ChangeTransmission(trans: let trans) where trans == .auto:
			transmission = .auto
		case .ChangeTransmission(trans: let trans) where trans == .mechanics:
			transmission = .mechanics

		case .AddTrailers(trailer: let trailer):
			trailers += trailer
		case .RemoveTrailers(trailer: let trailer):
		trailers -= trailer


		default:
			break
		}

	}

	func description() {
		print ("Грузовик марки \(mark), год выпуска \(yearOfRelease), количество прицепов - \(trailers), коробка передачи - \(transmission.rawValue), окна \(windows.rawValue), мотор \(engine.rawValue). ")
	}

}

var kamaz = TruckCar(mark: "КамАЗ", yearOfRelease: 1999)
kamaz.Action(act: .AddTrailers(trailer: 3))
kamaz.Action(act: .ChangeTransmission(trans: .auto))
kamaz.Action(act: .ActivateMotor(active: .on))
kamaz.Action(act: .RemoveTrailers(trailer: 1))
kamaz.description()

var ferrari = SportCar(mark: "Ferrari F430", yearOfRelease: 2013)
ferrari.Action(act: .ActivateMotor(active: .on))
ferrari.Action(act: .CarWindows(window: .open))
ferrari.Action(act: .OpenRoof(roof: .open))
//ferrari.Action(act: .AddTrailers(trailer: 3) - почему-то можно к спорт. машине применить действие, которое должно быть доступно только для грузовиков
ferrari.description()
