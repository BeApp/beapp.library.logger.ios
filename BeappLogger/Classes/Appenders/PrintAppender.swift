//
//  PrintAppender.swift
//  BeappLogger
//
//  Created by Anthony Dudouit on 04/02/2019.
//

import Foundation
/**
Appender by default

Use simply the print method to print the message in the console
*/
public class PrintAppender: LoggerAppender {
	
	public init(){}
	
	public func log(priority: LoggerPriority, message: String) {
		print(message)
	}
}
