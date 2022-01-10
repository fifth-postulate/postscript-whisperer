# Variables
Up until now, all the operands that we used, are but on the stack from literal values. When we are working on larger projects that soon becomes a hassle. In this chapter we will learn how to define variables that can be reused.

## Key
PostScript has a notion _key_. They are akin to symbols in Ruby. Keys provide a way to associate a value to a certain name.

You create a key by prefix a sequence of certain characters with a slash: "/". So the following code

```ps
/booster
```

pushes a key on the operand stack that is identified by the name `booster`.

## Definition
To associate a value with a key PostScript uses the `def` operator. For example the following code

```ps
{{#include ../../image-src/hello-world.variable.ps:1:1}}
```

Associates the value `100` with the key `/size`.

## Lookup
When you want to use the value that is associated with a certain key, you can look up the value by using the name of the key.

For example, the result of the following code

```ps
{{#include ../../image-src/hello-world.variable.ps:1:1}}
size size
```

Is that the value associated with the key `/size` is pushed on the stack twice. In this particular case the top two items of the operand stack would be `100` and `100`.

## Benefits
The same benefits of using variables apply to PostScript programs as well as in other programming languages. Those include

* **Readability**: A program that uses well chosen names can help in understanding code.
* **Reuse**: Instead of copying the literal value, variables allow you to reuse that value.
* **Adoptability**: When a value needs to change there is a single source of truth for it. This makes it easier to experiment with different values.
* **Maintainability**: Variables, when used to your benefit, serve as a form of documentation. They allow to show the intent whichs helps in the maintainability of code.

## Tip
An idiom that you often encounter in PostScript programs involving the `def` operand is the following

```ps
100 /size exch def
```

If you take a minute to think about the above code sample, you might come to the conclusion that it associates the value `100` with the key `/size`.

The reasoning could go like this. The literal value `100` first, then the key `/size` is pushed on top of that. The `exch` operator changes the order of the top two items on the stack. So now, `/size` is at the bottom and `100` is on top. Just when if we would have executed the following code

```ps
/size 100
```

The `def` operator takes the two items on the stack and associates the key with the value. In this case `/size` is associated with `100`.

One place that you will use this idiom is when you have a long and involved calculation to produce a value and want repeated access to the value. Instead of first pushing a key onto the stack, performing the calculation and then making an association, effectively like this

```ps
/size
.
.
.
lines and lines of code to calculate a value
.
.
.
def
```

You could rearrange that into

```ps
.
.
.
lines and lines of code to calculate a value
.
.
.
/size exch def
```

This way the key is closer to the definition, which could aid in understanding.

## Exercises
1. You made a PostScript program that draws a house in the "Hello, World!"-chapter. Introduce some variables into your program that allows you to manipulate the shape of the house by changing the values.
