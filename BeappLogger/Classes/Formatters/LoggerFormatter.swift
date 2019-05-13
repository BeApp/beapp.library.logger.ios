//
//  Formatter.swift
//  BeappLogger
//
//  Created by Anthony Dudouit on 12/02/2019.
//

import Foundation

/**
The formatter is used to format the log message which will be sent to each Appender.
*/
public protocol LoggerFormatter {
	
	///  Called to format the message which will be logged by Appender
	///
	/// - Parameters:
	///   - object: Object or message to be logged
	///   - filename: File name from where loggin to be done
	///   - line: Line number in file from where the logging is done
	///   - funcName: Name of the function from where the logging is done
	///	  - priority: the log priority
	func format(_ object: Any?, filename: String, line: Int, funcName: String, priority: LoggerPriority) -> String
}
