//
//  FileAppender.swift
//  BeappLogger
//
//  Created by Anthony Dudouit on 04/02/2019.
//

import Foundation

public class FileAppender: LoggerAppender {
	
	private let fileHandle: FileHandle?
	let filePath: URL
	
	public init(filename: String, sharedContainer: Bool = false, groupName: String? = nil) {
		
		if sharedContainer,
			let _groupName = groupName,
			let _groupPath = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: _groupName) {
			filePath = _groupPath.appendingPathComponent(filename)
		} else {
			filePath = FileAppender.getDocumentsDirectory().appendingPathComponent(filename)
		}
		
		do {
			if !FileManager.default.fileExists(atPath: filePath.path) {
				FileManager.default.createFile(atPath: filePath.path, contents: nil, attributes: nil)
			}
			fileHandle = try FileHandle(forWritingTo: filePath)
			
		} catch {
			fileHandle = nil
		}

		print("save into filename : \(filePath.path)")
	}
	
	deinit {
		if let _fileHandle = fileHandle {
			_fileHandle.closeFile()
		}
	}
	
	public func log(priority: LoggerPriority, message: String) {
		saveToFile(message)
	}
	
	
	// MARK :- SAVING IN FILE
	func saveToFile(_ message: String) {
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
