//
//  PrintAppender.swift
//  BeappLogger
//
//  Created by Anthony Dudouit on 04/02/2019.
//

import Foundation

public class PrintAppender: LoggerAppender {
	
	public init(){}
	
	public func log(priority: LoggerPriority, message: String) {
		print(message)
	}
}
