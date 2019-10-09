def solution(x,n):
    answer = []
    for i in range(n):
        answer.append(x*(i+1))
    return answer
x = 2
n = 20
list = []
for i in range(n):
    list.append(x+(x*i))
print(list)
