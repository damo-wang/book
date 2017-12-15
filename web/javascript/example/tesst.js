class Animal {
    constructor() {
        this.type = 'animal';
    }
    says(say) {
        console.log(this.type + 'say' + say);
    }
}

let animal = new Animal();
animal.says('hello');

class Cat extends Animal {
    constructor() {
        super(); //表示父类的构造函数
        this.type = 'cat';
    }
}
let cat = new Cat();
let { type } = cat;
cat.says('I\'m cat');
console.log(type);