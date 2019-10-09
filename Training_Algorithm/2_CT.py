def isBalanced(s):
    n=0
    for i in range(len(s)):
        n += (1 if s[i]=='(' else -1)
        if n < 0:
            return False

    return True if n==0 else False

print(isBalanced('(()()()())'))
print(isBalanced('(((())))'))
print(isBalanced('(()((())()))'))
print(isBalanced('((((((())'))
print(isBalanced('()))'))
print(isBalanced('(()()(()'))
print(isBalanced('(()))('))