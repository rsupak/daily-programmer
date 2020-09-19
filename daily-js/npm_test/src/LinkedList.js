import LinkedListNode from "./LinkedListNode";
import Comparator from "./Comparator";
import { link } from "fs";

export default class LinkedList {
  constructor(comparatorFunction) {
    this.head = null;
    this.tail = null;
    this.size = 0;
    this.compare = new Comparator(comparatorFunction);
  }

  prepend(value) {
    let node = new LinkedListNode(value);
    if (this.head == null) {
      this.head = node;
      this.tail = node;
    } else {
      node.next = this.head;
      this.head = node;
    }
    this.size++;
    return this;
  }

  append(value) {
    let node = new LinkedListNode(value);
    let currentNode;
    if (this.head == null) {
      this.head = node;
      this.tail = node;
    } else {
      this.tail.next = node;
      this.tail = this.tail.next;
    }
    this.size++;
    return this;
  }

  delete(value) {
    let deletedNode = null;
    let currentNode = this.head;
    let previousNode = currentNode;
    while (currentNode) {
      if (currentNode.value == value && currentNode == this.head) {
        deletedNode = this.deleteHead();
      } else if (currentNode.value == value && currentNode == this.tail) {
        deletedNode = this.deleteTail();
      } else if (currentNode.value == value) {
        deletedNode = currentNode;
        currentNode = currentNode.next;
        previousNode.next = currentNode;
      } else {
        previousNode = currentNode;
        currentNode = currentNode.next;
      }
    }
    return deletedNode;
  }

  find({ value, callback }) {
    let result;
    let currentNode = this.head;
    while (currentNode) {
      if (callback && typeof callback === "function") {
        if (callback(currentNode.value)) {
          return currentNode;
        }
      }
      if (currentNode.value == value) {
        return currentNode;
      }
      currentNode = currentNode.next;
    }
    return null;
  }

  deleteTail() {
    let deletedNode = this.tail;
    if (this.head == this.tail) {
      this.head = null;
      this.tail = null;
    } else {
      let currentNode = this.head;
      while (currentNode.next != this.tail) {
        currentNode = currentNode.next;
      }
      currentNode.next = null;
      this.tail = currentNode;
    }
    return deletedNode;
  }

  deleteHead() {
    let deletedNode = this.head;
    if (this.head == this.tail) {
      this.head = null;
      this.tail = null;
    } else {
      this.head = this.head.next;
    }
    return deletedNode;
  }

  fromArray(values) {
    values.forEach(element => {
      this.append(element);
    });
  }

  toArray() {
    // let array = [];
    // let currentNode = this.head;
    // while (currentNode) {
    //   array.push(currentNode);
    //   currentNode = currentNode.next;
    // }
    // return array;
  }

  toString(callback) {
    let listString = "";
    let currentNode = this.head;
    if (this.head) {
      if (callback && typeof callback === "function") {
        while (currentNode.next) {
          listString += `${callback(currentNode.value)},`;
          currentNode = currentNode.next;
        }
        listString += `${callback(currentNode.value)}`;
      } else {
        while (currentNode.next) {
          listString += `${currentNode.value},`;
          currentNode = currentNode.next;
        }
        listString += `${currentNode.value}`;
      }
    }
    return listString;
  }

  reverse() {
    // let array = [];
    // let currentNode = this.head;
    // while (currentNode) {
    //   array.unshift(currentNode);
    //   currentNode = currentNode.next;
    // }
    // return fromArray(array);
  }
}

// let linkedList = new LinkedList();
// var nodeStringifier = function nodeStringifier(value) {
//   return value.key + ":" + value.value;
// };
// var nodeValue1 = { value: 1, key: "key1" };
// var nodeValue2 = { value: 2, key: "key2" };

// linkedList.prepend(nodeValue2).append(nodeValue2);
// // console.log(linkedList.head.value);
// console.log(linkedList.toString());
// console.log(linkedList.toString(nodeStringifier));
// let list = new LinkedList();
// let arr = [1, 2, 3];
