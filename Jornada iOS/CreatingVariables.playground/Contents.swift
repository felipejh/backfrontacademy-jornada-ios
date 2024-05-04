func sumTwoValues(myNumber value1: Int, value2: Int = 10) -> (num1: Int, num2: Int) {
    let result = value1 + value2
    
    return (value1, value2)
}

let resultFunction = sumTwoValues(myNumber: 1)
print(resultFunction)
