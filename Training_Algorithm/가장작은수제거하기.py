def solution(arr):
        answer = []
        if len(arr) == 0:
            arr.append(-1)
        else:
            minValue = min(arr)
            arr.remove(minValue)
        return answer