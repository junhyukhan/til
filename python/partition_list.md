# Intuition
To partition the list around a value x, we need to separate the nodes into two groups: one with values less than x (we'll call this left partition) and another with values greater than or equal to x (we'll call this right partition). We can just go through the list once, removing the node if the value is less than x, and appending it to the left partition.

In the end, we are left with two linked lists separated by its value compared to x. We link the two linked lists and return it.

# Approach
Create a dummy node to build the result list.
Traverse the original list.
For nodes with values less than x, remove them and append them to the result list. We need to make sure to link the list after removing them.
For nodes with values greater than or equal to x, keep track of the first such node. We'll call this partition_right since it will be the first node after the partition.
After traversing the list, connect the last node of the left partition to the first node of the right partition.
Return the next node of the dummy node as the new head of the partitioned list.
# Complexity
Time complexity: O(n), where n is the number of nodes in the linked list. This is because we traverse the list once.

Space complexity: O(1), as we use a constant amount of extra space.

# Code
```
class Solution:
    def partition(self, head: Optional[ListNode], x: int) -> Optional[ListNode]:
        ret = ret_cur = ListNode()

        prev = partition_right = None
        cur = head
        while cur:
            next = cur.next
            if cur.val < x:
                if prev:
                    prev.next = cur.next
                ret_cur.next = cur
                cur.next = None
                ret_cur = ret_cur.next
            else:
                if not partition_right:
                    partition_right = cur
                prev = cur
            cur = next

        ret_cur.next = partition_right

        return ret.next
```
