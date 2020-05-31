import UIKit
import Bond

var gold = Observable<Int>(0)

gold.observeNext { (value) in
    print(value)
}

gold.receive(5)
gold.receive(10)
