trivial-string-utils
====

A petit tool box about string modification.

## Package name and its nicknames:

### *[package name]*
`PETIT.STRING-UTILS`

### *[package nicknames]*
`PSU` and `PETIT.SU`

## APIs:

### *[Generic Function]* `COERCE-STRING`
#### Syntax:
`coece-string` *object* => *string*

#### Description: 
To coerce to `CL:STRING` from a lisp object.

#### default supported types of coercing from:
a string, a character, a symbol, and a number.

#### Note:
not applied recursively.

#### how to support for your own types and/or classes:
you can register coercing method for your own types and/or classes.

### *[Function]* `STRING-++`
#### Syntax:
`coece-string` *&rest* *objects* => *string*

#### Description:
To concatenate given objects to a `CL:STRING` object.

`COERCE-STRING` will be applied to each of given objects recursively.

#### supported recursive structures:
- `CL:LIST`,
- `CL:VECTOR`.

#### non-supported recursive structures:
- Your own structure,
- generic `CL:ARRAY`, which is not a vector.

### *[Function]* `STRING-++2`
#### Syntax:
`string-++2` *pre-object* *post-object* => *string*

#### Description:
A binary function version of the `STRING-++` for `CL:APPLY`, `CL:FUNCALL` and `CL:REDUCE`.

## Examples:
    > (psu:string-++ "pi" '= pi)
    "pi=3.1415926535897932385L0"
    > (psu:string-++ #\a "Bc" 'd '(1 2 #(3 4)) 5 6)
    "aBcD123456"

## License:
Under MIT license.
