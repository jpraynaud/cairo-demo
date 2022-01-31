# Cairo Demo
A set off simple showcase programs written in **Cairo Lang**.

* For more informations about **Cairo Lang**, visit https://www.cairo-lang.org
* Compiler and environment setup: https://www.cairo-lang.org/docs/quickstart.html

# Programs list:
* Hello
* Simple Polynomial
* Array Summation
* Simple AMM
* Starknet 
    * Ownable
    * Balance


# Compile and run instructions
```
# Change directory
cd hello

# Compile program
cairo-compile hello.cairo --output hello_compiled.json

# Run program
cairo-run --program=hello_compiled.json --print_output --layout=small
Program output:
  123
```