//: Playground - noun: a place where people can play

import UIKit


//: ## 优化Enum的输出
enum Direction {
    case East, South, West, North
}
let direction:Direction = Direction.East
print(direction)
//: output:East
//: ## 枚举关联值支持泛型
enum myOptional<T> {
    case myNone
    case mySome(T)
}
var a: myOptional<Int> = .myNone
a = .mySome(11)


//: ## 枚举的递归
enum Tree<T> {
    case Leaf(T)
    indirect case Node(Tree, Tree)
}
let leftTree:Tree<Int> = .Leaf(121)
let rightTree:Tree<Int> = .Leaf(50)
let subTree:Tree<Int> = .Node(leftTree, rightTree)

print(subTree)
//: output:Node(Tree<Swift.Int>.Leaf(121), Tree<Swift.Int>.Leaf(50))

//: ## repeat循环语句
var count = 0;
repeat {
  print("it's \(count++) counts")
} while (count < 2)

//UIViewAnimationOptions
//: ## OptionSetType使用
struct VolumeOption: OptionSetType {
    let rawValue: Int
    
    static let SoundClose = VolumeOption(rawValue: -1)
    static let SoundOpen = VolumeOption(rawValue: 1)
    static let VolumeUp = VolumeOption(rawValue: 2)
    static let VolumeDown = VolumeOption(rawValue: 3)
    
}

var v:VolumeOption = [.SoundOpen, .VolumeUp, .VolumeDown]
if v.contains(.SoundOpen) {
    print("Sound is available !")// Sound is available !
}

//: ## Arguments Label
func save(name: String, encrypt: Bool){
    //..
}
class Widget {
    func save(name: String, encrypt: Bool){
        //..
    }
}

save("global", encrypt: true)
let widget = Widget()
widget.save("internal", encrypt: true)

//: ## if-let可选绑定的复合使用
let x: Int? = 10
let y: String? = "wrcj"
let z: Bool = true
if let x = x, let y = y where z == true {
    print("x's value:\(x), y's value:\(y)")
}

//: ## guard-else的可选绑定
let num: Int? = 100
guard let num = num else {
    fatalError()
}
print(num)
//: output: 100

//: ## if-case的模式匹配
if case .mySome(let v) = a where v > 10 {
    print("the value isn't none, and greater than 10")
}
//: output:the value isn't none, and greater than 10

//: ## for-in的模式匹配
let array = [1,2,3,4,5]
for value in array where value % 2 == 0 {
    print(value
    )
}
//: output: 1 3 5

//: ## API检查
if #available(iOS 9.0, *) {
    // new 9.0 API
} else {
    // old API
}

//: ## 协议扩展
extension CollectionType {
    func countIf(match: Generator.Element -> Bool) -> Int {
        var n = 0
        for value in self {
            if match(value) { n++ }
        }

        return n
    }
}

let set = [1,2,3,4,5,6,7,8,9]
let counts = set.countIf { (num) -> Bool in
    if num >= 5 {
        return true
    } else {
        return false
    }
}
print("the counts is \(counts)")
//: output:the counts is 5

//: ## Error Handing
enum DataFetchError: ErrorType {
    case MissingData
    case MissingSource
    case NetworkUnavailable
}

func fetchDataOnline(json: AnyObject) throws {
    guard let result = json["result"] as? Int else {
        throw DataFetchError.NetworkUnavailable
    }
    
    guard let source = json["source"] as? NSDictionary else {
        throw DataFetchError.MissingSource
    }
    
    guard let data = json["data"] as? NSDictionary else {
        throw DataFetchError.MissingData
    }
    
    print("reuslt:\(result), source:\(source), data:\(data)")
}

func getData () {
    do {
        try fetchDataOnline("no data")
    } catch DataFetchError.NetworkUnavailable {
        print("NetworkUnavailable")
    }catch DataFetchError.MissingData {
        print("MissingData")
    } catch DataFetchError.MissingSource {
        print("MissingSource")
    } catch let error {
        print(error)
    }
}
