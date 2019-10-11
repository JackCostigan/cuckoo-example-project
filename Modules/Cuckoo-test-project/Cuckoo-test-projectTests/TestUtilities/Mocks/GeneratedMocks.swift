// MARK: - Mocks generated from file: ../../Dependencies/ProtocolKit/ProtocolKit/DependencyType.swift at 2019-10-11 08:46:02 +0000

//
//  DependencyType.swift
//  ProtocolKit
//
//  Created by admin on 11/10/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Cuckoo
@testable import ___Dependencies_ProtocolKit

import Foundation


 class MockDependencyType: DependencyType, Cuckoo.ProtocolMock {
    
     typealias MocksType = DependencyType
    
     typealias Stubbing = __StubbingProxy_DependencyType
     typealias Verification = __VerificationProxy_DependencyType

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: DependencyType?

     func enableDefaultImplementation(_ stub: DependencyType) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func a()  {
        
    return cuckoo_manager.call("a()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.a())
        
    }
    
    
    
     func b()  {
        
    return cuckoo_manager.call("b()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.b())
        
    }
    
    
    
     func c()  {
        
    return cuckoo_manager.call("c()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.c())
        
    }
    

	 struct __StubbingProxy_DependencyType: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func a() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockDependencyType.self, method: "a()", parameterMatchers: matchers))
	    }
	    
	    func b() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockDependencyType.self, method: "b()", parameterMatchers: matchers))
	    }
	    
	    func c() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockDependencyType.self, method: "c()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_DependencyType: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func a() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("a()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func b() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("b()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func c() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("c()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class DependencyTypeStub: DependencyType {
    

    

    
     func a()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func b()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func c()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

