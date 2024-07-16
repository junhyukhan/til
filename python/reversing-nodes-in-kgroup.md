### Reversing Nodes in k-Group in a Singly-Linked List

Here's a Python solution for reversing nodes in a k-group in a singly-linked list:

```python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def reverseKGroup(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:
        if k == 1:
            return head
        ret = ret_cur = ListNode()
        s = []
        cur = head
        while cur:
            next = cur.next
            s.append(cur)
            if len(s) >= k:
                while len(s):
                    popped = s.pop()
                    ret_cur.next = popped
                    ret_cur = ret_cur.next
                ret_cur.next = None
            cur = next
        if len(s):
            ret_cur.next = s[0]

        return ret.next
```

**Explanation:**

- Use a stack to reverse the nodes in k-group.
- Keep a dummy node as the first element will change places.
- Loop through the linked list, appending nodes to a stack.
- If the stack length equals k, pop the stack until empty, linking nodes to the dummy node.
- Set the next node of `ret` to `None` after popping the entire stack to avoid cycles.
- This prevents cycles at the end of the list and ensures correct node linking if more nodes exist.
