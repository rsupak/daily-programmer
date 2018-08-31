const auxSort = (num1,num2) => {
    let total = num1 + num2;
    num2 = Math.max(num1, num2);
    num1 = total - num2;
    
    return [num1, num2];
};


const sort3 = (a,b,c) => {
    [b,c] = auxSort(b,c);
    [a,b] = auxSort(a,b);
    [b,c] = auxSort(b,c);

    return [a,b,c];
}

let a = 5;
let b = 12;
let c = 8;

[a,b,c] = sort3(a,b,c)
console.log(`${a} ${b} ${c}`)
