import Foundation

struct Foo {
    let a: Int
    let b: Bool
}

struct Foo2 {
    let b: Bool
    let a: Int
}

let size = MemoryLayout<Foo>.size
let size2 = MemoryLayout<Foo2>.size

print(size)
print(size2)
