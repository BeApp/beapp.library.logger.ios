//
//  HtmlAppender.swift
//  BeappLogger
//
//  Created by Anthony Dudouit on 04/02/2019.
//

import Foundation

public class HtmlAppender: FileAppender {
	
	public init() {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd"
		let dateFormat = formatter.string(from: Date())
		super.init(filename: "log_\(dateFormat).html")
	}
	
	public override func log(priority: LoggerPriority, message: String) {
		let htmlClass = getClassHtmlLevel(priority: priority)
		let htmlMessage = "<p class=\"\(htmlClass)\">\(message)</p>"
		saveToFile(htmlMessage)
	}
	
	private func getClassHtmlLevel(priority: LoggerPriority) -> String {
		switch priority {
		case .debug:
			return "debug"
		case .info:
			return "info"
		case .warn:
			return "warn"
		case .error:
			return "error"
		}
	}
	

}
