//
//  ViewController.swift
//  DJSwiftExtensionDemo
//
//  Created by minstone.DJ on 2020/3/19.
//  Copyright © 2020 minstone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        self.view.backgroundColor = UIColor.hex(0xF7F7F7)
//        self.view.backgroundColor = UIColor.init(hexString: "#4285F4")
//        self.view.backgroundColor = UIColor.init(hexString: "0x4285F4")
        
        
        var lists = ["one", "two", "3", "4"]
        let _ = lists[3]
    
        
        lists.dj_addObject(nil)
        
        let _ = lists[safe: 4]
        
        let _ = lists.dj_objectAt(8)
        
        let _ = lists.dj_stringAt(2)
        print("string at 2 ==== \(lists.dj_stringAt(2))")
        
        //直接调用系统方法，越界会崩溃
//        lists.remove(at: 9)
        
//        lists.dj_removeAt(9)
//        lists.dj_removeAt(2)
//        lists.insert("nine", at: 8)
//        lists.dj_insertAt("five", 5)
        lists.dj_insertAt(nil, 4)
        
        
        print("last lists === \(lists)")

        
        var param = ["one":"1", "two":"2", "three":"3"]
        param.dj_set("four", "4")
        print("param === \(param)")
        param.dj_set("five", nil)
        
        
        param.removeValue(forKey: "five")
        
    
        print("current param === \(param)")
        
        self.view.dj_addTapAction(#selector(handleTapAction(_:)))
        
    }

    @objc func handleTapAction(_ tap: UITapGestureRecognizer) {
        print("handle tap action")
    }

}

