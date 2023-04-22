import UIKit
import SnapKit

class ViewController: UIViewController {
    
    enum Operation: String {
        case addition = "+"
        case subtraction = "-"
        case multiply = "x"
        case divide = "/"
        case equal = "="
        case clean = "AC"
        case percent = "%"
    }
    
    var firstNumber: String = ""
    var secondNumber: String = ""
    
    var currentOperation: Operation?
    
    let label = UILabel()
    
    let button = UIButton(type: .system)
    let button1 = UIButton(type: .system)
    let button2 = UIButton(type: .system)
    let button3 = UIButton(type: .system)
    let button4 = UIButton(type: .system)
    let button5 = UIButton(type: .system)
    let button6 = UIButton(type: .system)
    let button7 = UIButton(type: .system)
    let button8 = UIButton(type: .system)
    let button9 = UIButton(type: .system)
    let button10 = UIButton(type: .system)
    let button11 = UIButton(type: .system)
    let button12 = UIButton(type: .system)
    let button13 = UIButton(type: .system)
    let button14 = UIButton(type: .system)
    let button15 = UIButton(type: .system)
    let button16 = UIButton(type: .system)
    let button17 = UIButton(type: .system)
    let button18 = UIButton(type: .system)
    
    let buttonWidth = 70
    let buttonHeight = 70
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.backgroundColor = .systemBackground
        label.text = "0"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 40)
        view.addSubview(label)
        
        prepareButton(button, color: .orange, title: "=")
        prepareButton(button1, color: .orange, title: "+")
        prepareButton(button2, color: .orange, title: "-")
        prepareButton(button3, color: .orange, title: "x")
        prepareButton(button4, color: .orange, title: "/")
        prepareButton(button5, color: .darkGray, title: ".")
        prepareButton(button6, color: .darkGray, title: "3")
        prepareButton(button7, color: .darkGray, title: "6")
        prepareButton(button8, color: .darkGray, title: "9")
        prepareButton(button9, color: .gray, title: "%")
        prepareButton(button10, color: .darkGray, title: "0")
        button10.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 85)
        prepareButton(button11, color: .darkGray, title: "2")
        prepareButton(button12, color: .darkGray, title: "5")
        prepareButton(button13, color: .darkGray, title: "8")
        prepareButton(button15, color: .darkGray, title: "1")
        prepareButton(button16, color: .darkGray, title: "4")
        prepareButton(button17, color: .darkGray, title: "7")
        prepareButton(button18, color: .gray, title: "AC")
        
        view.addSubview(button)
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        view.addSubview(button4)
        view.addSubview(button5)
        view.addSubview(button6)
        view.addSubview(button7)
        view.addSubview(button8)
        view.addSubview(button9)
        view.addSubview(button10)
        view.addSubview(button11)
        view.addSubview(button12)
        view.addSubview(button13)
        view.addSubview(button15)
        view.addSubview(button16)
        view.addSubview(button17)
        view.addSubview(button18)
        
        
        
        setupLayout()
        colorChangeLabel()
        
        
        
    }
    
    func prepareButton(_ button: UIButton,
                       color: UIColor,
                       title: String,
                       needCorner: Bool = true,
                       titleColor: UIColor = .white) {
        button.backgroundColor = color
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = needCorner ? CGFloat(buttonHeight / 2) : 0
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        button.setTitleColor(titleColor, for: .normal)
    }
    
    func setupLayout() {
        label.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.leading.equalTo(view.snp.leading).offset(25)
            make.trailing.equalTo(view.snp.trailing).offset(-25)
            make.bottom.equalTo(button18.snp.top).offset(-16)
        }
        button.snp.makeConstraints { make in
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
            make.trailing.equalTo(view.snp.trailing).offset(-25)
            make.bottom.equalTo(view.snp.bottom).offset(-25)
        }
        button1.snp.makeConstraints { make in
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
            make.bottom.equalTo(button.snp.top).offset(-16)
            make.trailing.equalTo(view.snp.trailing).offset(-25)
        }
        button2.snp.makeConstraints { make in
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
            make.bottom.equalTo(button1.snp.top).offset(-16)
            make.trailing.equalTo(view.snp.trailing).offset(-25)
        }
        button3.snp.makeConstraints { make in
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
            make.bottom.equalTo(button2.snp.top).offset(-16)
            make.trailing.equalTo(view.snp.trailing).offset(-25)
        }
        button4.snp.makeConstraints { make in
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
            make.bottom.equalTo(button3.snp.top).offset(-16)
            make.trailing.equalTo(view.snp.trailing).offset(-25)
        }
        button5.snp.makeConstraints { make in
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
            make.bottom.equalTo(view.snp.bottom).offset(-25)
            make.trailing.equalTo(button.snp.leading).offset(-16)
        }
        button6.snp.makeConstraints { make in
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
            make.bottom.equalTo(button5.snp.top).offset(-16)
            make.trailing.equalTo(button1.snp.leading).offset(-16)
        }
        button7.snp.makeConstraints { make in
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
            make.bottom.equalTo(button6.snp.top).offset(-16)
            make.trailing.equalTo(button2.snp.leading).offset(-16)
        }
        button8.snp.makeConstraints { make in
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
            make.bottom.equalTo(button7.snp.top).offset(-16)
            make.trailing.equalTo(button3.snp.leading).offset(-16)
        }
        button9.snp.makeConstraints { make in
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
            make.bottom.equalTo(button8.snp.top).offset(-16)
            make.trailing.equalTo(button4.snp.leading).offset(-16)
        }
        button10.snp.makeConstraints { make in
            make.width.equalTo(156)
            make.height.equalTo(buttonHeight)
            make.bottom.equalTo(view.snp.bottom).offset(-25)
            make.trailing.equalTo(button5.snp.leading).offset(-16)
        }
        button11.snp.makeConstraints { make in
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
            make.bottom.equalTo(button10.snp.top).offset(-16)
            make.trailing.equalTo(button6.snp.leading).offset(-16)
        }
        button12.snp.makeConstraints { make in
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
            make.bottom.equalTo(button11.snp.top).offset(-16)
            make.trailing.equalTo(button7.snp.leading).offset(-16)
        }
        button13.snp.makeConstraints { make in
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
            make.bottom.equalTo(button12.snp.top).offset(-16)
            make.trailing.equalTo(button8.snp.leading).offset(-16)
        }
        button15.snp.makeConstraints { make in
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
            make.bottom.equalTo(button10.snp.top).offset(-16)
            make.trailing.equalTo(button11.snp.leading).offset(-16)
        }
        button16.snp.makeConstraints { make in
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
            make.bottom.equalTo(button15.snp.top).offset(-16)
            make.trailing.equalTo(button12.snp.leading).offset(-16)
        }
        button17.snp.makeConstraints { make in
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
            make.bottom.equalTo(button16.snp.top).offset(-16)
            make.trailing.equalTo(button13.snp.leading).offset(-16)
        }
        button18.snp.makeConstraints { make in
            make.width.equalTo(156)
            make.height.equalTo(buttonHeight)
            make.bottom.equalTo(button17.snp.top).offset(-16)
            make.trailing.equalTo(button9.snp.leading).offset(-16)
        }
    }
    
    @objc private func pressButton(_ button: UIButton) {
        let value = button.titleLabel?.text ?? "Y"
        
        if isOperation(value: value) {
            pressToOperation(operation: getOperationFor(stringOperation: value))
        }
        
        if isNumber(value: value) {
            pressToNumber(number: value)
        }
        
    }
    
    func isOperation(value: String) -> Bool {
        if value == "=" || value == "+" || value == "-" || value == "x" || value == "/" || value == "%" || value == "AC" {
            return true
        }
        return false
    }
    
    func isNumber(value: String) -> Bool {
        for i in 0...9 {
            if "\(i)" == value {
                return true
            }
        }
        
        if value == "." {
            return true
        }
        
        return false
    }
    func colorChangeLabel() {
        if label.backgroundColor == .systemBackground {
            label.textColor = .black
        } else {
            label.textColor = .white
        }
    }
    func pressToNumber(number: String) {
        if firstNumber.isEmpty { // если мы еще вообще ничего не нажимали
            if number == "." {
                firstNumber = "0."
            } else {
                firstNumber = number
            }
            vyvodVLabel(a: firstNumber)
        } else if !firstNumber.isEmpty && (currentOperation == nil) { // если мы уже первое число вводили, но еще не выбирали операцию
            firstNumber.append(number)
            vyvodVLabel(a: firstNumber)
        } else if currentOperation != nil && secondNumber.isEmpty {
            if number == "." {
                secondNumber = "0."
            } else {
                secondNumber = number
            }
            vyvodVLabel(a: secondNumber)
        } else if currentOperation != nil && !secondNumber.isEmpty {
            secondNumber.append(number)
            vyvodVLabel(a: secondNumber)
        }
        
    }
    func pressToOperation(operation: Operation) {
        if operation == .equal {
            if currentOperation == .divide && secondNumber == "0" {
                vyvodVLabel(a: "ТЫ ЕБАНУТЫЙ?!")
            } else {
                equal(a: (Double(firstNumber) ?? 0.0), b: (Double(secondNumber) ?? 0.0), operation: currentOperation!)
            }
        } else if operation == .percent {
            let result = procent(a: Double(firstNumber)!)
            vyvodVLabel(a: checkToDot(a: result))
        } else {
            currentOperation = operation
            vyvodVLabel(a: currentOperation!.rawValue)
        }
        
        if operation == .clean {
            cleanAll()
        }
    }
    
    func getOperationFor(stringOperation: String) -> Operation {
        switch stringOperation {
        case "-":
            return .subtraction
        case "+":
            return .addition
        case "x":
            return .multiply
        case "/":
            return .divide
        case "=":
            return .equal
        case "AC":
            return .clean
        case "%":
            return .percent
        default:
            return .addition
        }
    }
    
    // MARK: -
    
    func equal(a: Double, b: Double, operation: Operation) {
        var result = 0.0
        
        switch operation {
        case .addition:
            result = addition(a: a, b: b)
        case .subtraction:
            result = subtraction(a: a, b: b)
        case .multiply:
            result = multiply(a: a, b: b)
        case .divide:
            result = divide(a: a, b: b)
        default:
            result = -999
        }
        
        let textresult = checkToDot(a: result)
        vyvodVLabel(a: textresult)
        
    }
    func vyvodVLabel(a: String) {
        label.text = a
    }
    
    func checkToDot (a: Double) -> String {
        if a.truncatingRemainder(dividingBy: 1) == 0 {
            return "\(Int(a))"
        } else {
            return  "\(a)"
        }
    }
    
    
    func cleanAll() {
        label.text = "0"
        firstNumber = ""
        secondNumber = ""
        currentOperation = nil
    }
    
    
}
