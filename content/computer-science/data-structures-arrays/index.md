---
title: "Data Structures: Arrays and Lists"
date: 2025-10-03
draft: false
description: "Understanding arrays, lists, and their operations"
lessons: ["Computer Science"]
topics: ["data-structures", "arrays", "lists", "algorithms"]
---

## Introduction to Arrays

Arrays are one of the most fundamental data structures in computer science. They store elements of the same type in contiguous memory locations, allowing for efficient access and manipulation.

## Array Characteristics

### Memory Layout
- **Contiguous Storage**: Elements are stored in adjacent memory locations
- **Fixed Size**: Traditional arrays have a predetermined size
- **Index-Based Access**: O(1) time complexity for accessing elements

### Basic Operations

#### 1. Access
```python
arr = [10, 20, 30, 40, 50]
element = arr[2]  # Returns 30
```
**Time Complexity**: O(1)

#### 2. Insertion
```python
# Insert at end
arr.append(60)  # [10, 20, 30, 40, 50, 60]

# Insert at specific position
arr.insert(2, 25)  # [10, 20, 25, 30, 40, 50, 60]
```
**Time Complexity**: 
- At end: O(1) amortized
- At specific position: O(n)

#### 3. Deletion
```python
# Remove by value
arr.remove(30)

# Remove by index
del arr[2]

# Pop last element
last = arr.pop()
```
**Time Complexity**: O(n) for removal by value or at specific position

## Dynamic Arrays vs Static Arrays

### Static Arrays
- Fixed size determined at creation
- Memory allocated once
- Common in languages like C, C++

### Dynamic Arrays
- Can grow and shrink as needed
- Resizes automatically when capacity is reached
- Examples: Python lists, Java ArrayList, C++ vector

## Common Array Algorithms

### 1. Linear Search
```python
def linear_search(arr, target):
    for i in range(len(arr)):
        if arr[i] == target:
            return i
    return -1
```
**Time Complexity**: O(n)

### 2. Binary Search (on sorted arrays)
```python
def binary_search(arr, target):
    left, right = 0, len(arr) - 1
    
    while left <= right:
        mid = (left + right) // 2
        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    
    return -1
```
**Time Complexity**: O(log n)

### 3. Reverse an Array
```python
def reverse_array(arr):
    left, right = 0, len(arr) - 1
    while left < right:
        arr[left], arr[right] = arr[right], arr[left]
        left += 1
        right -= 1
    return arr
```
**Time Complexity**: O(n)

## Multi-dimensional Arrays

### 2D Arrays (Matrices)
```python
# Creating a 3x3 matrix
matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

# Accessing element at row 1, column 2
element = matrix[1][2]  # Returns 6
```

### Traversing 2D Arrays
```python
# Row-major traversal
for i in range(len(matrix)):
    for j in range(len(matrix[i])):
        print(matrix[i][j], end=' ')
    print()
```

## Performance Comparison

| Operation | Array | Linked List |
|-----------|-------|-------------|
| Access | O(1) | O(n) |
| Insert (end) | O(1)* | O(1) |
| Insert (middle) | O(n) | O(1)** |
| Delete (end) | O(1) | O(n)*** |
| Delete (middle) | O(n) | O(1)** |
| Search | O(n) | O(n) |

*Amortized for dynamic arrays  
**After finding the position  
***For singly linked lists

## Advantages and Disadvantages

### Advantages
- ✅ Fast random access (O(1))
- ✅ Memory efficient (no extra pointers)
- ✅ Cache-friendly due to contiguous storage
- ✅ Simple to use and understand

### Disadvantages
- ❌ Fixed size (for static arrays)
- ❌ Expensive insertions/deletions in middle
- ❌ Memory waste if not fully utilized
- ❌ Resizing dynamic arrays requires copying

## Practical Applications

1. **Database Indexing**: Fast lookups using array indices
2. **Image Processing**: Representing pixels in a 2D array
3. **Mathematical Computations**: Matrix operations
4. **Buffers**: Data storage for I/O operations
5. **Lookup Tables**: Fast constant-time lookups

## Conclusion

Arrays are essential data structures that provide efficient random access to elements. Understanding their characteristics, operations, and trade-offs is crucial for choosing the right data structure for your application. While they excel at accessing elements, operations that require frequent insertions or deletions in the middle might benefit from other data structures like linked lists or trees.

## Further Reading
- Array sorting algorithms
- Space-time trade-offs in data structures
- Advanced array techniques (sliding window, two pointers)
