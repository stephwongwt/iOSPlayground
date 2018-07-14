//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func asyncTaskSimulation(delay: NSTimeInterval, completion: (NSTimeInterval) -> ()) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
        Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_global_queue(QOS_CLASS_UTILITY, 0)) {
            completion(delay)
    }
}

func A() {
    
    func B(completion: () -> ()) {
        
        print("Function B start")
        
        let group = dispatch_group_create()
        
        dispatch_group_enter(group)
        asyncTaskSimulation(1.0) { (delay) in
            print("First task after \(delay)s")
            dispatch_group_leave(group)
        }
        
        dispatch_group_enter(group)
        asyncTaskSimulation(2.0) { (delay) in
            print("Second task after \(delay)s")
            dispatch_group_leave(group)
        }
        
        dispatch_group_enter(group)
        asyncTaskSimulation(0.5) { (delay) in
            print("Third task after \(delay)s")
            dispatch_group_leave(group)
        }
        
        dispatch_group_wait(group, DISPATCH_TIME_FOREVER)
        completion()
        
        print("Function B end")
    }
    
    func C() {
        print("Function C start")
        print("Whatever")
        print("Function C end")
    }
    
    B() {
        C()
    }
    
}

A()