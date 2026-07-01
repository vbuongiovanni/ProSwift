//: A UIKit based Playground for presenting user interface
  
import UIKit

let view: AnyObject = UIButton()

switch view {
case is UIButton:
    print("Found a button!")
case is UILabel:
    print("Found a label!")
case is UISwitch:
    print("Found a switch!")
case is UIView:
    print("Found a view")
default:
    print("something else?")
}
