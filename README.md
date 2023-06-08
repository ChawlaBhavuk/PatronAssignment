# PatronAssignment
 
Given a sequence of arbitrary values, sort them according to the following algorithm:

1. Find the lowest value in the sequence. Append it to the result. If there is more than one lowest value, append only one of them to the result.
2. Find the next higher value in the sequence. Append it to the result. If there is more than one, append only one of them to the result.
3. Continue this way until you reach the highest value in the list. For example, if we start with `[1, 7, 1, 4, 2, 2, 3]`, at this point in the algorithm, we have `[1, 2, 3, 4, 7]` as the partial result, and we still have `[1, 2]` remaining in the input.
4. After this, we do the same algorithm again with the remaining values, but going from highest to lowest. The highest remaining value is `2`, so we add it to the list. After that, `1` is left.
5. Our final result from `[1, 7, 1, 4, 2, 2, 3]` is `[1, 2, 3, 4, 7, 2, 1]`.
6. If any more values remain, we start the algorithm again from the beginning.

To make this clearer, here is an example:

```
Input:  [1, 2, 1, 2, 3, 7, 4, 9, 11, 3, 1, 2, 3, 1, 3, 7, 4, 9]
Output: [1, 2, 3, 4, 7, 9, 11, 9, 7, 4, 3, 2, 1, 1, 2, 3, 3, 1]
```

Let's separate the output into separate rising and falling parts:

```
Rising:  1, 2, 3, 4, 7, 9, 11
Falling: 9, 7, 4, 3, 2, 1
Rising:  1, 2, 3
Falling: 3, 1
```

As you can see, we go up, then we go down, then we go up, then we go down, _ad infinitum_ or at least until we run out of input. We can call this a "wave sort". Each element in the input list appears only once in the output list.

**Notes**

- What do "lowest value" and "highest value" mean? For integers, it's obvious. For strings or any other type, it has to do with sorting. Consider the following strings: "cat", "ant", "elephant". Let's sort them ascending: "ant", "cat", "elephant". The lowest value is "ant". The highest value is "elephant".
- Your code should be able to handle _any type_ which can be sorted. For example: numbers, strings, custom types, etc.
- Do not write an entire application or use multiple files. Write code which can be pasted together into a playground/REPL and run as is.
- You may have as many helper functions as you like, but you must have **one** main function called `solve`. It can be a stand-alone function or an extension method. No overloads!
- Write your code in the language of the job for which you are applying. Use these examples to test your code. They are correct.
- You may use any collection types you wish, as long as the answer is correct.
- Write type-safe code. Do not use metaprogramming, reflection, or types such as `Any`.
- Efficiency and speed are _not_ important. Solving the problem correctly _is_ important.
- Although solving the problem correctly is the most important consideration, the second most important are brevity and concision. Keep your solution as small as possible without sacrificing good style and clarity, but don't overthink it.
- Do the work yourself. We will be discussing your solution in your interview, so be prepared to explain it.
- Provide your solution as a Gist on GitHub and send the link to your interview contact at Patron so the engineering team can review it.
- Do not leave comments on this Gist. They will be deleted.

**Example 1**

```
Input:  [1, 2, 1, 2, 3, 7, 4, 9, 11, 3, 1, 2, 3, 1, 3, 7, 4, 9]
Output: [1, 2, 3, 4, 7, 9, 11, 9, 7, 4, 3, 2, 1, 1, 2, 3, 3, 1]

Rising:  1, 2, 3, 4, 7, 9, 11
Falling: 9, 7, 4, 3, 2, 1
Rising:  1, 2, 3
Falling: 3, 1
```

**Example 2**

```
Input:  ["cat", "fish", "ant", "ant", "elephant", "platypus", "platypus", "cat"]
Output: ["ant", "cat", "elephant", "fish", "platypus", "platypus", "cat", "ant"]

Rising:  "ant", "cat", "elephant", "fish", "platypus",
Falling: "platyus", "cat", "ant"
```
