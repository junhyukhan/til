# Intuition

To solve the problem of rotating a linked list, we need to find the node at the ‘threshold’ position where the list will be split and reconnected. The node at this position will become the last node of the rotated list. The node following the ‘threshold’ node will be the new head of the rotated list.

# Approach

1. Create a dummy node.
2. Determine the length of the list.
2. Calculate the ‘threshold’ value, which is the position where the list will be split.
3. Traverse the list to the ‘threshold’ node.
4. Update the pointers to rotate the list by connecting the end of the original list to the head of the original list and setting the new head of the rotated list.
5. Handle edge cases where the list length is zero or the rotation is a multiple of the list length.

# Complexity

- Time complexity: O(n), where n is the length of the linked list. This is because we traverse the list twice: once to find the length and once to rotate the list.
- Space complexity: O(1), as we are using a constant amount of extra space.
# Code
```
class Solution:
    def rotateRight(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:
        if not head:
            return head
        
        ret = ListNode()

        size = 0
        cur = head
        while cur:
            size += 1
            cur = cur.next

        threshold = size - (k % size)
        if threshold == size:
            return head

        cur = head
        i = 1
        while cur:
            next = cur.next
            if i == threshold:
                cur.next = None
            elif i == threshold + 1:
                ret.next = cur
            if i == size:
                cur.next = head
            i += 1
            cur = next

        return ret.next
```
