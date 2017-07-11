//
//  context.swift
//  Codpi
//
//  Created by Gábor Sebestyén on 2017. 07. 10..
//

import Foundation

import odpi


//
// wrapper class for dpiContext
//
public final class DriverContext {
  // internal ? dpi ?
  public var context: UnsafeMutablePointer<dpiContext>?
  
  public static let shared = DriverContext()
  
  private init() {
    var errInfo = dpiErrorInfo()
    
    if dpiContext_create(UInt32(DPI_MAJOR_VERSION), UInt32(DPI_MINOR_VERSION), &context, &errInfo) < 0 {
      // die(DriverErrorInfo(info: errInfo))
      fatalError("BANG! Failed to create global driver context")
    }
  }
  
  
  deinit {
    dpiContext_destroy(context)
  }
}
