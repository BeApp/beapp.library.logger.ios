//
//  HtmlAppender.swift
//  BeappLogger
//
//  Created by Anthony Dudouit on 04/02/2019.
//

import Foundation

public class HtmlAppender: LoggerAppender {
	
	private let filename: URL
	private let fileHandle: FileHandle?
	
	public init() {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd"
		let dateFormat = formatter.string(from: Date())
		filename = HtmlAppender.getDocumentsDirectory().appendingPathComponent("log_\(dateFormat).html")
		do {
			if !FileManager.default.fileExists(atPath: filename.path) {
				FileManager.default.createFile(atPath: filename.path, contents: nil, attributes: nil)
			}
			fileHandle = try FileHandle(forWritingTo: filename)
		} catch {
			fileHandle = nil
		}
		
		saveToFile("<h2>APP INIT</h2>")
		print("save into filename : \(filename.path)")
	}
	
	deinit {
		if let _fileHandle = fileHandle {
			_fileHandle.closeFile()
		}
	}
	
	public func log(priority: LoggerPriority, message: String) {
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
	
	// MARK :- SAVING IN FILE
	private func saveToFile(_ message: String) {
		let s = message + "\n"
		if let data = s.data(using: String.Encoding.utf8),
			let _fileHandle = fileHandle {
			_fileHandle.seekToEndOfFile()
			_fileHandle.write(data)
		}
	}
	
	private class func getDocumentsDirectory() -> URL {
		let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return paths[0]
	}

}
