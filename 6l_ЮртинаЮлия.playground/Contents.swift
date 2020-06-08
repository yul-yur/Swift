import UIKit

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.


struct Queue<Element>{

	var items = [Element]()

    mutating func push(_ item: Element){
        items.append(item)
    }

    mutating func pop() -> Element {
        return items.removeLast()
    }

	func filterElement(array: [Element], function: (Element)-> Bool) -> [Element]{

		var newFilterArray = [Element]()

		for i in array {
			if function(i){
				newFilterArray.append(i)
			}
		}

		return newFilterArray
	}

	subscript(i: Int) -> Element? {

		if  (i > items.count) {
			return nil
		}
		return items[i]
	}
}


var d = Queue<Int>(items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 0])
d[30]

