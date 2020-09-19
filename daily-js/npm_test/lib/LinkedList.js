"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _LinkedListNode = require("./LinkedListNode");

var _LinkedListNode2 = _interopRequireDefault(_LinkedListNode);

var _Comparator = require("./Comparator");

var _Comparator2 = _interopRequireDefault(_Comparator);

var _fs = require("fs");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var LinkedList = function () {
  function LinkedList(comparatorFunction) {
    _classCallCheck(this, LinkedList);

    this.head = null;
    this.tail = null;
    this.size = 0;
    this.compare = new _Comparator2.default(comparatorFunction);
  }

  _createClass(LinkedList, [{
    key: "prepend",
    value: function prepend(value) {
      var node = new _LinkedListNode2.default(value);
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
  }, {
    key: "append",
    value: function append(value) {
      var node = new _LinkedListNode2.default(value);
      var currentNode = void 0;
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
  }, {
    key: "delete",
    value: function _delete(value) {
      var deletedNode = null;
      var currentNode = this.head;
      var previousNode = currentNode;
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
  }, {
    key: "find",
    value: function find(_ref) {
      var value = _ref.value,
          callback = _ref.callback;

      var result = void 0;
      var currentNode = this.head;
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
  }, {
    key: "deleteTail",
    value: function deleteTail() {
      var deletedNode = this.tail;
      if (this.head == this.tail) {
        this.head = null;
        this.tail = null;
      } else {
        var currentNode = this.head;
        while (currentNode.next != this.tail) {
          currentNode = currentNode.next;
        }
        currentNode.next = null;
        this.tail = currentNode;
      }
      return deletedNode;
    }
  }, {
    key: "deleteHead",
    value: function deleteHead() {
      var deletedNode = this.head;
      if (this.head == this.tail) {
        this.head = null;
        this.tail = null;
      } else {
        this.head = this.head.next;
      }
      return deletedNode;
    }
  }, {
    key: "fromArray",
    value: function fromArray(values) {
      var _this = this;

      values.forEach(function (element) {
        _this.append(element);
      });
    }
  }, {
    key: "toArray",
    value: function toArray() {
      // let array = [];
      // let currentNode = this.head;
      // while (currentNode) {
      //   array.push(currentNode);
      //   currentNode = currentNode.next;
      // }
      // return array;
    }
  }, {
    key: "toString",
    value: function toString(callback) {
      var listString = "";
      var currentNode = this.head;
      if (this.head) {
        if (callback && typeof callback === "function") {
          while (currentNode.next) {
            listString += callback(currentNode.value) + ",";
            currentNode = currentNode.next;
          }
          listString += "" + callback(currentNode.value);
        } else {
          while (currentNode.next) {
            listString += currentNode.value + ",";
            currentNode = currentNode.next;
          }
          listString += "" + currentNode.value;
        }
      }
      return listString;
    }
  }, {
    key: "reverse",
    value: function reverse() {
      // let array = [];
      // let currentNode = this.head;
      // while (currentNode) {
      //   array.unshift(currentNode);
      //   currentNode = currentNode.next;
      // }
      // return fromArray(array);
    }
  }]);

  return LinkedList;
}();

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


exports.default = LinkedList;