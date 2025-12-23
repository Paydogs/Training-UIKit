//
//  ToolkitLoggerAdapter.swift
//  Training-UIKit
//
//  Created by Andras Olah on 2025. 12. 23..
//

import Foundation
import Toolkit

struct ToolkitLoggerAdapter: LoggerInterface {
    private let logger = Toolkit.Logger(identifier: Bundle.main.bundleIdentifier!)
    
    func trace(_ message: @autoclosure () -> String, file: String, function: String, line: Int) {
        logger.trace(message(), file: file, function: function, line: line)
    }
    
    func debug(_ message: @autoclosure () -> String, file: String, function: String, line: Int) {
        logger.debug(message(), file: file, function: function, line: line)
    }
    
    func info(_ message: @autoclosure () -> String, file: String, function: String, line: Int) {
        logger.info(message(), file: file, function: function, line: line)
    }
    
    func warn(_ message: @autoclosure () -> String, file: String, function: String, line: Int) {
        logger.warn(message(), file: file, function: function, line: line)
    }
    
    func error(_ message: @autoclosure () -> String, file: String, function: String, line: Int) {
        logger.error(message(), file: file, function: function, line: line)
    }
    
    func fatal(_ message: @autoclosure () -> String, file: String, function: String, line: Int) -> Never {
        return logger.fatal(message(), file: file, function: function, line: line)
    }
}
