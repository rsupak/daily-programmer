// Node constructor
function ListNode(val) {
  this.val = val;
  this.next = null;
}

// LinkedList constructor
function LinkedList() {
  this.head = null; // designates first node in list
  this.tail = null; // designates last node in list

  this.addNode = function(node) {
    if (this.head == null) {
      this.head = node;
      this.tail = node;
    } else {
      this.tail.next = node; // adds new node to tail
      this.tail = this.tail.next; // sets tail to new node
    }
  };

  // prints a user readable list to console
  this.printList = function() {
    printString = "";
    currentNode = this.head;
    while (currentNode != this.tail) {
      printString += `${currentNode.val} -> `;
      currentNode = currentNode.next;
    }
    printString += `${currentNode.val}`;
    console.log(printString);
  };
}

function mergeTwoLists(list1, list2) {
  l1 = new LinkedList();
  l2 = new LinkedList();
  for (let i = 0; i < list1.length; i++) {
    l1.addNode(new ListNode(list1[i]));
  }
  for (let i = 0; i < list2.length; i++) {
    l2.addNode(new ListNode(list2[i]));
  }
  current1 = l1.head;
  current2 = l2.head;
  // mergedList = new LinkedList();
  mergedList = [];

  while (current1 && current2) {
    if (current1.val < current2.val) {
      mergedList.push(current1.val);
      current1 = current1.next;
    } else {
      mergedList.push(current2.val);
      current2 = current2.next;
    }
  }
  while (current1) {
    mergedList.push(current1.val);
    current1 = current1.next;
  }
  while (current2) {
    mergedList.push(current2.val);
    current2 = current2.next;
  }
  return mergedList;
}

// let node1 = new ListNode(1);
// let node2 = new ListNode(2);
// let node3 = new ListNode(4);
// let node4 = new ListNode(5);
// let node5 = new ListNode(1);
// let node6 = new ListNode(3);
// let node7 = new ListNode(4);

// let list1 = new LinkedList();
// list1.addNode(node1);
// list1.addNode(node2);
// list1.addNode(node3);
// list1.addNode(node4);

// let list2 = new LinkedList();
// list2.addNode(node5);
// list2.addNode(node6);
// list2.addNode(node7);

console.log(mergeTwoLists([1, 2, 4], [1, 3, 4]));
