# Cheatsheet

A short overview of common operators and constructs, useful for examples & projects in this guide.
See the [Reference Manual](manual.md) for the full list.

## Stack Manipulation Operators

| Stack before | Operator | Stack after | Description |
| ------------ | -------- | ----------- | ----------- |
| $$any$$      | `1`    | $$any\ 1$$ | Push element `1` onto the stack, value can be any literal or name |
| $$any$$      | `pop`    | $$-$$ | Discard top element |
| $$a_{1}\ a_{2}$$ | `exch` | $$a_{2}\ a_{1}$$ | Exchange top two elements |
| $$a_{1}\ a_{2}$$ | `dup` | $$a_{2}\ a_{1}$$ | Duplicate top element |
| $$a_{1}\ \dots\ a_{n}\ n$$ | `copy` | $$a_{1}\ \dots\ a_{n}\ a_{1}\ \dots\ a_{n}\ $$ | Duplicate top \\( n \\) elements |
| $$a_{n}\ \dots\ a_{0}\ n$$ | `index` | $$a_{n}\ \dots\ a_{0}\ a_{n}$$ | Duplicate arbitrary element |
| $$a_{n-1}\ \dots\ a_{0}\ n\ j$$ | `roll` | $$a_{(j-1)\ mod\ n}\ \dots\ a_{0}\ a_{n-1}\ \dots a_{j\ mod\ n}$$ | Roll \\( n \\) elements up \\( j \\) times |
| $$a_{n}\ \dots\ a_{0}$$ | `clear` | $$-$$ | Discard all elements |
| $$a_{n}\ \dots\ a_{0}$$ | `count` | $$a_{n}\ \dots\ a_{0}\ n$$ | Count elements on stack |

## Arithmetic and Math Operators

| Stack before | Operator | Stack after | Description |
| ------------ | -------- | ----------- | ----------- |
| $$n_{1}\ n_{2}$$ | `add` | $$sum$$ | \\( n_{1} + n_{2} \\) |
| $$n_{1}\ n_{2}$$ | `sub` | $$diff$$ | \\( n_{1} - n_{2} \\) |
| $$n_{1}\ n_{2}$$ | `mul` | $$product$$ | \\( n_{1} \times n_{2} \\) |
| $$n_{1}\ n_{2}$$ | `div` | $$quotient$$ | \\( n_{1} \div n_{2} \\) |
| $$n$$ | `neg` | $$-n$$ | Negative of \\( n \\) |
| $$n$$ | `sqrt` | $$\sqrt{n}$$ | Square root of \\( n \\) |
| $$a$$ | `cos` | $$\cos{a}$$ | Cosine of \\( a \\) degrees |
| $$a$$ | `sin` | $$\sin{a}$$ | Sine of \\( a \\) degrees |
| $$-$$ | `rand` | $$n$$ | Pseudo-random integer |

## Array Operators

| Stack before | Operator | Stack after | Description |
| ------------ | -------- | ----------- | ----------- |
| $$-$$     | `[` | $$mark$$ | Start array construction |
| $$mark\ obj_{0}\ \dots\ obj_{n-1}$$  | `]` | $$array$$ | End array construction |
| $$array$$ | `length` | $$int$$ | Number of elements in \\( array \\) |
| $$array\ proc$$ | `forall` | $$-$$ | Execute \\( proc \\) for each element of \\( array \\) |

## Dictionary Operators

| Stack before | Operator | Stack after | Description |
| ------------ | -------- | ----------- | ----------- |
| $$n$$     | `dict` | $$dict$$ | Create dictionary with capacity \\( n \\) |
| $$-$$ | `<<` | $$mark$$ | Start dictionary construction |
| $$mark\ key_{1}\ value_{1}\ \dots\ key_{n}\ value_{n}$$ | `>>` | $$dict$$ | End dictionary construction |
| $$dict$$ | `length` | $$int$$ | Number of entries in \\( dict \\) |
| $$dict$$ | `begin` | $$-$$ | Push \\( dict \\) on dictionary stack |
| $$-$$ | `end` | $$-$$ | Pop current dictionary off dictionary stack |
| $$/key\ value$$ | `def` | $$-$$ | Associate \\( key \\) with \\( value \\) in current dictionary |

## Relational and Boolean Operators

| Stack before | Operator | Stack after | Description |
| ------------ | -------- | ----------- | ----------- |
| $$n_{1}\ n_{2}$$  | `eq` | $$bool$$ | Test equal |
| $$n_{1}\ n_{2}$$  | `ne` | $$bool$$ | Test not equal |
| $$n_{1}\ n_{2}$$  | `ge` | $$bool$$ | Test greater than or equal |
| $$n_{1}\ n_{2}$$  | `gt` | $$bool$$ | Test greater than |
| $$n_{1}\ n_{2}$$  | `le` | $$bool$$ | Test less than or equal |
| $$n_{1}\ n_{2}$$  | `gt` | $$bool$$ | Test less than |
| $$-$$  | `true` | $$\text{true}$$ | Literal value \\( \text{true} \\) |
| $$-$$  | `false` | $$\text{false}$$ | Literal value \\( \text{false} \\) |

## Control Operators

| Stack before | Operator | Stack after | Description |
| ------------ | -------- | ----------- | ----------- |
| $$any$$ | `exec` | $$-$$ | Execute arbitrary object |
| $$bool\ proc$$ | $$if$$ | $$-$$ | Execute \\( proc \\) if \\( bool \\) is true |
| $$bool\ proc_{1}\ proc_{2}$$ | $$ifelse$$ | $$-$$ | Execute \\( proc_{1} \\) if \\( bool \\) is true, \\( proc_{2} \\) if false |
| $$init\ inc\ limit\ proc$$ | $$for$$ | $$-$$ | Execute \\( proc \\) with values from \\( init \\) by steps of \\( inc \\) to \\( limit \\) |
| $$n\ proc$$ | $$repeat$$ | $$-$$ | Execute \\( proc \\) \\( n \\) times |
| $$proc$$ | $$loop$$ | $$-$$ | Execute \\( proc \\) an indefinite number of times |
| $$-$$ | $$exit$$ | $$-$$ | Exit innermost active loop |

## Graphics State Operators

| Stack before | Operator | Stack after | Description |
| ------------ | -------- | ----------- | ----------- |
| $$-$$ | `gsave` | $$-$$ | Push graphics state |
| $$-$$ | `grestore` | $$-$$ | Pop graphics state |
| $$num$$ | `setlinewidth` | $$-$$ | Set line width |
| $$-$$ | `currentlinewidth` | $$int$$ | Current line width |
| $$int$$ | `setlinecap` | $$-$$ | Set shape of line ends for stroke (`0 = butt`, `1 = round`, `2 = square`)
| $$-$$ | `currentlinecap` | $$int$$ | Current line cap |
| $$int$$ | setlinejoin | $$-$$ | Set shape of corners for stroke (0 = miter, 1 = round, 2 = bevel)
| $$-$$ | `currentlinejoin` | $$int$$ | Current line join |
| $$num$$ | `setgray` | $$-$$ | Set color to specified gray value (0 = black, 1 = white)

## Coordinate System and Matrix Operators

| Stack before | Operator | Stack after | Description |
| ------------ | -------- | ----------- | ----------- |
| $$t_{x}\ t_{y}$$ | `translate` | $$-$$ | Translate user space by \\( (t_{x}, t_{y}) \\) |
| $$s_{x}\ s_{y}$$ | `scale` | $$-$$ | Translate user space by \\( (s_{x}, s_{y}) \\) |
| $$a$$ | `rotate` | $$-$$ | Rotate user space by \\( a \\) degrees |

## Path Construction Operators

| Stack before | Operator | Stack after | Description |
| ------------ | -------- | ----------- | ----------- |
| $$-$$ | `newpath` | $$-$$ | Initialize current path to be empty |
| $$-$$ | `currentpoint` | $$x y$$ | Return current point coordinates |
| $$x\ y$$ | `moveto` | $$-$$ | Set current point to \\( (x, y) \\) |
| $$dx\ dy$$ | `rmoveto` | $$-$$ | Perform relative `moveto` |
| $$x\ y$$ | `lineto` | $$-$$ | Append straight line to \\( (x, y) \\) |
| $$dx\ dy$$ | `rmoveto` | $$-$$ | Perform relative `lineto` |
| $$x\ y\ r\ a_{1}\ a_{2}$$ | `arc` | $$-$$ | Append counterclockwise arc, with \\( (x, y) \\) as the center for a radius of \\( r \\) from angle \\( a_{1} \\) to angle \\( a_{2} \\) |
| $$x\ y\ r\ a_{1}\ a_{2}$$ | `arcn` | $$-$$ | Append clockwise arc |
| $$x_{1}\ y_{1}\ x_{2}\ y_{2}\ x_{3}\ y_{3}$$ | `curveto` | $$-$$ | Append Bézier cubic section |
| $$-$$ | `closepath` | $$-$$ | Connect subpath back to its starting point |

## Painting Operators

| Stack before | Operator | Stack after | Description |
| ------------ | -------- | ----------- | ----------- |
| $$-$$ | `erasepage` | $$-$$ | Paint current page white |
| $$-$$ | `stroke` | $$-$$ | Draw line along current path |
| $$-$$ | `fill` | $$-$$ | Fill current path with current color |

## Utility Operators

| Stack before | Operator | Stack after | Description |
| ------------ | -------- | ----------- | ----------- |
| $$any_{1}\ \dots\ any_{n}$$ | `stack` | $$any_{1}\ \dots\ any_{n}$$ | Print stack nondestructively |
| $$-$$ | `showpage` | $$-$$ | Transmit and reset current page |

## Common constructs

### Comment

```ps
% Everything here is now a comment
```

### Default A5 paper size

See also: [Paper Sizes](paper-sizes.md).

```ps
/pagewidth 148 def
/pageheight 210 def
```

### Scale the coordinate system to millimeters

See also: [Points, Inches and Millimeters](sizes.md).

```ps
72 25.4 div dup scale
```

### Center the coordination system on the page

```ps
pagewidth 2 div pageheight 2 div translate
```

### Dictionary literals

Creates a dictionary of key-value pairs from the given list, puts the dictionary on the dictionary stack,
and later pops it off the stack again.

```ps
<</foo 1 /bar 2 /baz 3>> begin
    ...
end
```

### Defining a procedure

Creates a new procedure named `proc`:

```ps
/proc {
    ...
} def
```

### Giving names to procedure operands

Creates a new procedure named `proc`, which expects 3 operands on the stack: `x y z`.

```ps
/proc { % x y z
    [/x /y /z] dup length dict begin { exch def } forall
        ...
    end
} def
```
