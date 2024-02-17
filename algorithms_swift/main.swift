import Foundation

let s = DispatchSemaphore(value: 0)
let t = Thread {
    print("1")
    s.signal()
}
t.start()

let t2 = Thread {
    print("2")
    s.signal()
}
t2.start()

s.wait()
print("3")


//class SaveThread {
//    private let lock = NSLock()
//    
//    func method(completion: @escaping () -> ()) {
//        defer {
//            lock.unlock()
//        }
//        lock.lock()
//        completion()
//    }
//}
//
//var array = [String]()
//let saveThread = SaveThread()
//
//let queue = DispatchQueue(label: "foo",attributes: .concurrent)
//
//queue.async {
//    for i in 0..<10 {
//        array.append("0:  \(i)")
//    }
//}
////
////saveThread.method {
////    print("1")
////    array.append("1 thread")
////}
//
//
//DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//    print(array)
//}
