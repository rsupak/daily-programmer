class TwoSum {
  constructor() {
    this.nums = {};
  }
  add(num) {
    if (!this.nums[num]) this.nums[num] = 0
    this.nums[num]++;
  }

  find(num) {
    for ( let key in Object.keys(this.nums)) {
      let b = num - key;
      if (key == b && this.nums[key] > 1) return true;
      if (key != b && nums[b]) return true;
      return false;
    }
  }
}


let two = new TwoSum();
console.log(two)
two.add(4);
two.add(1);
// console.log(two.find(5))
// console.log(two.find(4))
