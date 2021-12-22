# Stack Manipulation
Because the stack is so important, PostScript offers a slew of operators to manipulate the operand stack. In this chapter we are going to explore some of them.

We could show a picture of the stack, but that takes up a lot of space. Instead we will rely on a representation of the operand stack that fits on a line.

\\[
a_{1}\ a_{2}\ a_{3}\ \ldots\ a_{n}
\\]

The above line represents a stack that has \\(n\\) items. The bottom item is \\(a_{1}\\), the item above that one is \\(a_{2}\\), etcetera. The top item is \\(a_{n}\\).

## Operators

### push
Pushes onto the operand stack are often implicit. For example, it is enough just to list the value for it to be pushed on the operand stack.

```ps
37
```

The program listing above will push the value `37` onto the operand stack.

### pop
The opposite of pushing is popping. This can be achieved by the `pop` operator. This will remove the top most item from the operand stack.

```ps
37 51 pop
```

Leaves the operand stack containing the value `37`.

### dup
To duplicate the top element on the operand stack use the `dup` operator.

```ps
37 dup
```

The above program will result in an operand stack containing two values `37`.

### exch
If there are more than two items on the operand stack, `exch` allows you to exchange the top two items. If the operand stack contains `1 2 3`, the operator `exch` will exhange the `2` and the `3`, resulting in a stack containing `1 3 2`. The program below demonstrates that behavior.

```ps
1 2 3
exch
```

### copy
The `copy` operator is like `dup` on steroids. The `dup` operator copies the top most item on the operand stack. The `copy` operator, when provided with a number `n` to copy, copies the topmost `n` items.

Look at the following program.

```ps
1 2 3 4
3 copy
```

The first line pushes the values `1`, `2`, `3` and `4` on the operand stack. The next line, specifically `3 copy`, first puts `3` on the operand stack and then executes the `copy` operator. This pops the top most number from the stack, in this case that would be `3`, and copies that many elements onto the stack. This results in a operand stack

```
1 2 3 4 2 3 4
```

### roll
Just like how `copy` is a generalization of `dup`, `roll` is a generalization of `exch`.

Assume we have the following stack

\\[
\ldots\ a_{n-1}\ a_{n-2}\ \ldots\ a_{0}  
\\]

The `roll` operator allows to select the top most `n` items from the stack and "roll" them through `j` positions. So the executing `n j roll` with the above stack results in

\\[
\ldots\ a_{j-1}\ \ldots\ a_{1}\ a_{0}\ a_{n-1}\ a_{n-2}\ \ldots\ a_{j}  
\\]

With a concrete example, The following program

```ps
1 2 3 4
3 2 roll
```

results in the operand stack being

```
1 3 4 2
```

### index
The `index` operator allows you to select copy a single element in the operand stack to the top. With an operand stack as below

\\[
\ldots\ a_{n}\ a_{n-1}\ \ldots\ a_{0}  
\\]

The `index` operator copies an element of the stack to the top. So the following snippet `j index` results in a stack

\\[
\ldots\ a_{n}\ a_{n-1}\ \ldots\ a_{0}\ a_{j} 
\\]

Or with a concrete example

```ps
1 2 3 4
2 index
```

Results in a operand stack

```
1 2 3 4 2
```

### count
To count the number of items on the operand stack use the `count` operator.

### clear
If you want to remove all the items execute the `clear` operator

## Philosophy
Manipulating the operand stack is an important skill to learn. So much so that idiomatic PostScript advocates to think hard about the order of arguments and exclusively use operand stack manipulations.

This advice is written for application that generate PostScript in mind. When using PostScript creatively there are other mechanisms to organize your program. Ways that are geared towards readability and maintainability.

That does not mean that stack manipulation isn't worthwhile. It allows great flexibility.

## Exercises
1. What happens when there is only one item on the operand stack when `exch` is executed?
2. How can you use `copy` to simulate `dup`?
3. How can you use `roll` to simulate `exch`?
4. How can you use `index` to simulate `dup`? 
5. What happens when you use negative numbers as the second operand for the `roll` operator? The second operand is the one on the top on the stack when `roll` is executed.
6. The stack contains `1 2 3 4`. Create a program to reverse the operand stack that contains four items.
