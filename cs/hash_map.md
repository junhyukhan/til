# Summary of Hash Tables and Related Concepts

## 1. How Hash Tables Work
- A **hash table** is a data structure that stores key-value pairs.
- It uses a **hash function** to compute an index (or "bucket") where the value is stored.
- If multiple keys map to the same index (collision), a resolution strategy is used.

## 2. Collision Handling Strategies
### **1. Separate Chaining**
- Each bucket stores a **linked list (or tree in Java 8+ HashMap)**.
- Multiple values at the same index are stored in a list.
- **Used by:** Java (`HashMap`), Python (`dict` pre-3.6), C++ (`unordered_map`).

### **2. Open Addressing**
- If a collision occurs, the table searches for an available slot.
- Methods:
  - **Linear Probing:** Check the next available slot.
  - **Quadratic Probing:** Check slots at increasing distances.
  - **Double Hashing:** Use a second hash function to determine the step size.
- **Used by:** Python (`dict` since 3.6), Rust (`HashMap`), Go (`map`).

---

## 3. Hash Functions Used in Popular Languages
| Language | Hash Function for `String` |
|----------|----------------------------|
| **Java (`HashMap`)** | `h = 31 * h + char` |
| **Python (`dict`)** | Uses a mix of bitwise operations and randomization |
| **C++ (`unordered_map`)** | Implementation-defined (`std::hash`) |
| **Rust (`HashMap`)** | Uses **SipHash** for security |
| **Go (`map`)** | Uses a combination of hash mixing functions |

---

## 4. Initial Array Size and Growth in Hash Maps
| Language | Initial Capacity | Load Factor | Growth Factor | Collision Handling |
|----------|----------------|-------------|--------------|---------------------|
| **Java (`HashMap`)** | 16 | 0.75 | ×2 | Separate chaining |
| **Python (`dict`)** | 8 (pre-3.10), 16 (3.11+) | ~0.66 | Power of 2 | Open addressing |
| **C++ (`unordered_map`)** | 8 or 16 | 1.0 | ×2 | Separate chaining |
| **Rust (`HashMap`)** | 16 | 0.875 | ×2 | Open addressing (Robin Hood hashing) |
| **Go (`map`)** | 8 | ~0.75 | Power of 2 | Open addressing |

---

## 5. Java’s Hash Function and Indexing
### Step 1: Compute `hashCode()`
```java
h = 31 * h + char;
```
Example for "abc":
```java
h = 31 * (31 * (31 * 0 + 'a') + 'b') + 'c'
  = 31 * (31 * 97 + 98) + 99
  = 96354
```
### Step 2: Hash Transformation
```java
static final int hash(Object key) {
    int h = key.hashCode();
    return h ^ (h >>> 16);
}
```
### Step 3: Find the Array Index
```java
index = hash & (array_size - 1);
```
	•	Uses bitwise AND for fast modulus operation when array_size is a power of 2.

## 6. Example: Hash Table in Python (Separate Chaining)
```java
class HashTable:
    def __init__(self, size=8):
        self.size = size
        self.table = [[] for _ in range(size)]  # Array of lists (chaining)

    def hash_function(self, key):
        return hash(key) % self.size

    def insert(self, key, value):
        index = self.hash_function(key)
        for pair in self.table[index]:  
            if pair[0] == key:  
                pair[1] = value  # Update existing key
                return
        self.table[index].append([key, value])  # Append new pair

    def get(self, key):
        index = self.hash_function(key)
        for pair in self.table[index]:
            if pair[0] == key:
                return pair[1]
        return None  # Key not found

    def remove(self, key):
        index = self.hash_function(key)
        self.table[index] = [pair for pair in self.table[index] if pair[0] != key]

# Example Usage
ht = HashTable()
ht.insert("apple", 10)
ht.insert("banana", 20)
print(ht.get("apple"))  # Output: 10
ht.remove("apple")
print(ht.get("apple"))  # Output: None
```
	•	Uses separate chaining (each bucket is a list).

## 7. Example: Hash Table in Python (Open Addressing - Linear Probing)
```java
class OpenAddressingHashTable:
    def __init__(self, size=8):
        self.size = size
        self.table = [None] * size

    def hash_function(self, key):
        return hash(key) % self.size

    def insert(self, key, value):
        index = self.hash_function(key)
        original_index = index
        while self.table[index] is not None:  # Linear probing
            if self.table[index][0] == key:  
                self.table[index] = (key, value)  # Update value
                return
            index = (index + 1) % self.size
            if index == original_index:
                raise Exception("HashTable is full")
        self.table[index] = (key, value)

    def get(self, key):
        index = self.hash_function(key)
        original_index = index
        while self.table[index] is not None:
            if self.table[index][0] == key:
                return self.table[index][1]
            index = (index + 1) % self.size
            if index == original_index:
                return None  # Key not found
        return None

    def remove(self, key):
        index = self.hash_function(key)
        original_index = index
        while self.table[index] is not None:
            if self.table[index][0] == key:
                self.table[index] = None  # Mark as deleted
                return
            index = (index + 1) % self.size
            if index == original_index:
                return  # Key not found

# Example Usage
ht = OpenAddressingHashTable()
ht.insert("apple", 10)
ht.insert("banana", 20)
print(ht.get("apple"))  # Output: 10
ht.remove("apple")
print(ht.get("apple"))  # Output: None
```
	•	Uses open addressing (linear probing) to resolve collisions.

## 8. Key Takeaways
	•	Hash tables use hashing to efficiently store and retrieve data.
	•	Collisions are resolved via:
	•	Separate chaining (linked lists per bucket).
	•	Open addressing (probing for a new slot).
	•	Java uses multiplication by 31 in String.hashCode().
	•	Indexing in Java HashMap:
	•	Hash transformation (h ^ (h >>> 16))
	•	Bitwise masking (hash & (array_size - 1))
	•	Resizing a hash table requires rehashing all keys.
	•	Different languages use different hash functions and resizing strategies.
