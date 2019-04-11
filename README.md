# CalculateReversePolish

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/calculate_reverse_polish`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

```
    gem build /PATH/TO/calculate_reverse_polish/calculate_reverse_polish.gemspec
    gem install calculate_reverse_polish.gem
   
```

or run cli tool

```clickhouse
    ./PATH/TO/bin/calculate_reverse_polish
```



## Development

I decided to create a ruby gem as it can be used as a library to build any kind of applications, and is highhly reusable

Gem is build as small interpertter

It has `Parser` class, who is parsing input, `Validator`, 
to validate parsed input, `Errors` module to define custom `FormatError` class. 
`Core` class playes a role of both Pre-processor and interpretter,
it extracts arguments from parsed input, puts it into `stack`, 
then pull from `stack`, creates and runs `Operation` and stores result of operation back into stack.
It allow us to process multy line input, like 
```
>13
13
> 10 -
3
```

It sound like `Core` class breaks Single Responsibility principle, but in fact it has very narrow interface, 
and is only responsible for passing input to `process` input. Since app is fairly small such approach is easier to read.

`Operation` class is responsible for actually running computation.

`REPL` module, runs REPL is used `cli` tool. Using `CalculateReversePolish::Core` class it is possible to create all 
kind of clients.

Most of specs are written for `Core` class as it absorbs all functionaly and specs are closer to integration specs, 
which test only interface, but not details of realization.