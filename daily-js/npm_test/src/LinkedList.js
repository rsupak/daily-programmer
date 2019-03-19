import LinkedListNode from './LinkedListNode';
import Comparator from './Comparator';

export default class LinkedList {
  constructor(comparatorFunction) {
    this.head = null;
    this.tail = null;
    this.compare = new Comparator(comparatorFunction);
  }

  prepend(value) {
  }

  append(value) {
  }

  delete(value) {
  }

  find({ value = undefined, callback = undefined }) {
  }

  deleteTail() {
  }

  deleteHead() {
  }

  fromArray(values) {
  }

  toArray() {
  }

  toString(callback) {
  }

  reverse() {
  }
}