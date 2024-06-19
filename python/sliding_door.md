## Sliding Door Algorithm Explanation
Explanation written with the help of chatGPT, code is written on my own.

https://leetcode.com/problems/minimum-size-subarray-sum

The sliding door (or sliding window) algorithm is a powerful technique used to solve problems involving contiguous subarrays or substrings efficiently. It involves two pointers (or indices) that move through the array to maintain a window of elements that satisfies a particular condition. This method reduces the need for nested loops, thus optimizing the time complexity.

### Example: Minimum Size Subarray Sum

The below code finds the minimum length of a contiguous subarray of which the sum is at least `target`.

```python
class Solution:
    def minSubArrayLen(self, target: int, nums: List[int]) -> int:
        res = len(nums) + 1
        total = 0
        l = 0
        for r, cur in enumerate(nums):
            total += cur
            while total >= target:
                res = min(res, r - l + 1)
                total -= nums[l]
                l += 1

        return res if res <= len(nums) else 0
```

### Steps Explained:

1. **Initialization**:
   - `res` is set to a value larger than the maximum possible subarray length (`len(nums) + 1`), to ensure any valid subarray found will be smaller.
   - `total` keeps track of the sum of the current window.
   - `l` (left pointer) is initialized to 0, marking the start of the window.

2. **Iterating with the Right Pointer**:
   - The right pointer `r` iterates through the array.
   - For each element `cur` at index `r`, add it to `total`.

3. **Shrinking the Window**:
   - While the sum `total` is greater than or equal to `target`, the current window is valid.
   - Update `res` with the smaller length between the current window (`r - l + 1`) and the previous minimum.
   - Shrink the window from the left by subtracting `nums[l]` from `total` and incrementing `l`.

4. **Final Result**:
   - If `res` is still larger than the length of the array, no valid subarray was found; return 0.
   - Otherwise, return `res` as the minimum length of the subarray.

This technique efficiently narrows down the problem space, ensuring each element is processed at most twice, resulting in an O(n) time complexity.
