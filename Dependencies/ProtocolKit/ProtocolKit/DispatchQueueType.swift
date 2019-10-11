//
//  DispatchQueueType.swift
//  ProtocolKit
//
//  Created by Zachary Davison on 11/06/2018.
//  Copyright © 2018 thingsdoer. All rights reserved.
//

import Foundation
import Dispatch

public protocol DispatchQueueType: class {
  func asyncAfter(deadline: DispatchTime,
                  qos: DispatchQoS,
                  flags: DispatchWorkItemFlags,
                  execute work: @escaping @convention(block) () -> Swift.Void)
  func sync(execute: () -> Void)
  func async(group: DispatchGroup?,
             qos: DispatchQoS,
             flags: DispatchWorkItemFlags,
             execute: @escaping @convention(block) () -> Void)
}

extension DispatchQueueType {
  public func asyncAfter(deadline: DispatchTime, execute work: @escaping @convention(block) () -> Swift.Void) {
    asyncAfter(deadline: deadline, qos: DispatchQoS.default, flags: DispatchWorkItemFlags(), execute: work)
  }
  
  public func async(
    group: DispatchGroup? = nil,
    qos: DispatchQoS = .unspecified,
    flags: DispatchWorkItemFlags = [],
    execute work: @escaping @convention(block) () -> Void) {
    async(group: group, qos: qos, flags: flags, execute: work)
  }
}

extension DispatchQueue: DispatchQueueType {
}
