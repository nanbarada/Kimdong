import unittest

class Stack:
     def __init__(self):
         self.items = []

     def isEmpty(self):
         return self.items == []

     def push(self, item):
         self.items.append(item)

     def pop(self):
         return self.items.pop()

     def peek(self):
         return self.items[len(self.items)-1]

     def size(self):
         return len(self.items)


def isBalanced(s):
    stack = Stack()
    for c in s:
        if c == "(":
            stack.push(c)
        elif c == ")":
            if stack.isEmpty():
                return False
            stack.pop()
    return stack.isEmpty()


class BanlanceTest(unittest.TestCase):
    def test1(self):
        self.assertTrue(isBalanced("(5+6)*(7+8)/(4+3)"))
        self.assertTrue(isBalanced("(()()()())"))
        self.assertTrue(isBalanced("(((())))"))
        self.assertTrue(isBalanced("(()((())()))"))
        self.assertFalse(isBalanced("((((((())"))
        self.assertFalse(isBalanced("()))"))
        self.assertFalse(isBalanced("(()()(()"))
        self.assertFalse(isBalanced("(()))("))


if __name__ == "__main__":
    unittest.main()