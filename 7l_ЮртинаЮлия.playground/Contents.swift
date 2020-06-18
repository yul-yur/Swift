import UIKit

enum SendMEesageErrors: Error {
	case serverError(error: Int)
	case tooLargeMessage
	case tooSmallMessage
	case tooMuchAttatchments
}

struct Message {
	var size: Int
	var text: String
	var countAttachments: Int
}

class sendMessage {
	var sizeMessage = 30
	var errorValue = 0
	var countAttach = 100

	var messages = [
		"Hello, World!" : Message(size: 5, text: "Hello, World!,", countAttachments: 5),

		"Hello, World! Hello, World! Hello, World! Hello, World!": Message(size: 70, text: "Hello, World! Hello, World! Hello, World! Hello, World!", countAttachments: 500),

	]

	func sendingMessage (text: String, error: Int, attachments: Int) throws {

		guard let text = messages[text] else {
			throw SendMEesageErrors.tooSmallMessage
		}

		guard text.size < sizeMessage else {
			throw SendMEesageErrors.tooLargeMessage
		}

		guard error == 200 else {
			throw SendMEesageErrors.serverError(error: error)
		}

		guard text.size < sizeMessage else {
			throw SendMEesageErrors.tooLargeMessage
		}

		guard attachments < countAttach else {
			throw SendMEesageErrors.tooMuchAttatchments
		}

		print ("Сообщение *\(text.text)* успешно отправлено")
	}
}

func send(error: Int, textMessage: String, funcSend: sendMessage, attaches: Int) throws {
	try funcSend.sendingMessage(text: textMessage, error: error, attachments: attaches)
}

var testMessage = sendMessage()

do {
	try send(error: 200, textMessage: "Hello, World!", funcSend: testMessage, attaches: 20)
} catch SendMEesageErrors.tooSmallMessage {
	print ("Слишком маленькое сообщение")
} catch SendMEesageErrors.tooLargeMessage {
	print ("Слишком большое сообщение")
} catch SendMEesageErrors.serverError(let errorCode) {
	print ("Попытка отправки провалилась с ошибкой \(errorCode)")
} catch SendMEesageErrors.tooMuchAttatchments {
	print ("Слишком много вложений к сообщению")
}


