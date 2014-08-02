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

### *[Function]* `HEAD-MATCH-P`
#### Syntax:
`head-match-p` *item* *whole-string* => *(or null fixnum)*

#### Description:
`HEAD-MATCH-P` tests whether the *item* is same to head part of the *whole-string*.

When test matched, `HEAD-MATCH-P` returns the length of *item*.
When test does not matched, `HEAD-MATCH-P` returns `NIL`.

### *[Function]* `TAIL-MATCH-P`
#### Syntax:
`head-match-p` *item* *whole-string* => *(or null fixnum)*

#### Description:
`TAIL-MATCH-P` tests whether the *item* is same to tail part of the *whole-string*.

When test matched, `TAIL-MATCH-P` returns the matched index (0-based).
When test does not matched, `TAIL-MATCH-P` returns `NIL`.

### *[Function]* `STRING-##`
#### Syntax:
`string-##` *item* *whole-string* => (values `CL:STRING` *modified-or-not-p*)

#### Description:
`STRING-##` removes *item* from head part of the *whole-string*, if matched.

### *[Function]* `STRING-%%
#### Syntax:
`string-%%` *item* *whole-string* => (values `CL:STRING` *modified-or-not-p*)

#### Description:
`STRING-%%` removes *item* from tail part of the *whole-string*, if matched.

## Note for the type of given arguments for `HEAD-MATCH-P`, `TAIL-MATCH-P`, `STRING-##` and `STRING-%%`
When the all given arguments are `CL:STRING` object, these functions just work as described above.

When the given *item* is not a `CL:STRING` object, these functions recursively apply `COERCE-STRING` to *item* before testing.

When the given *whole-string* is not a `CL:STRING` object, same as *item*.

## Examples:
    > (psu:string-++ "pi" '= pi)
    "pi=3.1415926535897932385L0"
    > (psu:string-++ #\a "Bc" 'd '(1 2 #(3 4)) 5 6)
    "aBcD123456"

    > (string-## "foo" "foobarbaz")
    "barbaz" ;
    t
    > (string-%% "baz" "foobarbaz")
    "foobar" ;
    t
    > (string-## "baz" "foobarbaz")
    "foobarbaz" ;
    nil
    > (string-%% "foo" "foobarbaz")
    "foobarbaz" ;
    nil
    > (string-## 3 pi)
    ".1415926535897932385L0" ;
    t

## License:
Under MIT license.

