def solution(arr):
        answer = []
        if len(arr) == 0:
                print("[-1")
        else:
                minValue = min(arr)
                arr.remove(minValue)
        return answer
melong = [2,3,5,1,2,3,1]
solution(melong)