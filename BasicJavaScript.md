# JavaScript Basics
JavaScript is, as its name suggests, a script (small program) that runs on a web page. It can also be used behind the scenes (not in the web browser), but many times it is used to add interactivity to your web pages. Let's explore some of the fundamental elements of JavaScript--here we'll be using a more recent version called ES6.

## Variables
Variables, like in math, are where you assign a value to a symbol, such as assigning the string `'Hello World'` to the symbol `x`. In JavaScript, you can add a `var` (variable) declaration before your symbol `x`. ES6 also gives us `let`. [They have some differences that we'll cover in the next section.]
```
var x = 'Hello World';
let y = 'Hello World';
```
Note the semicolon at the end--this signals the end of a JavaScript line and is needed unless you are entering into a block of code (see the Conditionals example below). Also note that when we use `var` or `let`, we can change the value of our variable and from then on, the variable will carry the new value.
```
x = 'Hello Globe';
```
Why didn't we add a `let` at the beginning? It's because we already declared the _type_ of variable so we don't need to anymore. At this point, we just need to reassign it. Let's look at another type of variable.
``` 
const z = 3;
```
This type of variable is a `const` (constant), so as you'd expect, JavaScript will not let you change this variable--it is called 'immutable'--so if you were to try to do this...
```
z = 4;
```
...it would give you an error. 

## Arrays
Let's explore some other kinds of JavaScript variables. An array is a collection of similar items (strings, integers, etc.) that are separated by commas and grouped in square brackets:
```
var numbers = [1, 2, 3, 4, 5]`;
var letters = ['a', 'b', 'c']`;
```

## Loops
As we now have collections of information, we can iterate through them (go through them one by one). 
```
for (var number of numbers) {
  console.log(number);
}
```

## Conditionals
A conditional is a block of code that declares, as you might expect, a condition. If the condition is met, the block will be entered and code inside of it will be executed.
```
if (letter == 'a') {
  // whatever code I write here will be executed if the condition is met.
}
```
Conditionals can include `&&` (AND) and `||` (OR). These are called logical operators. With conditionals you can also  
```
if (letter == 'a' && number == 1) {
  // This code will be executed only if the two conditions are met
} else if (letter == 'a' || number == 1) {
  // This code will execute if either condition is met
} else {
  // if none of the other conditions are met, this code will run
}
```
