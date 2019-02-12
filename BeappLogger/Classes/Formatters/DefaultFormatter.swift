//
//  DefaultFormatter.swift
//  BeappLogger
//
//  Created by Anthony Dudouit on 12/02/2019.
//

import Foundation

/**
The default formatter of each log passed through the Logger
*/
public class DefaultFormatter: LoggerFormatter {
	
	fileprivate static var dateFormat = "yyyy-MM-dd hh:mm:ss.SSS"
	
	fileprivate static var dateFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.dateFormat = dateFormat
		formatter.locale = Locale.current
		formatter.timeZone = TimeZone.current
		return formatter
	}
	
	public func format(_ object: Any?, filename: String, line: Int, funcName: String, priority: LoggerPriority) -> String {
		return "\(Date().toString()) \(priority.rawValue)[\(filename): \(funcName) (\(line))] \(object ?? "NIL")"
	}
	
}


internal extension Date {
	func toString() -> String {
		return DefaultFormatter.dateFormatter.string(from: self as Date)
	}
}
