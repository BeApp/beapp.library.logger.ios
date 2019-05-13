//
//  TinyFormatter.swift
//  BeappLogger
//
//  Created by Anthony Dudouit on 12/02/2019.
//

import Foundation

/**
A formatter with less info to show
*/
public class TinyFormatter: LoggerFormatter {
	
	public init() {}
	
	public func format(_ object: Any?, filename: String, line: Int, funcName: String, priority: LoggerPriority) -> String {
		return "\(priority.rawValue) \(object ?? "NIL")"
	}
	
}
