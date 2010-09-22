# fid\* - I see what you did!

Fid will be a JSON diff/patch tool.

## Simple

Call:

    fid({
      "pears":   1,
      "apples":  {"red": 2, "green": 1},
      "bananas": 5,
      "mangos":  2
    },
    {
      "apples":  {"golden": 1},
      "bananas": 3,
      "oranges": 6,
      "mangos":  2
    })

Result:

    {
      "apples":  {"red": 1},
      "bananas": 3,
      "<": {
        "pears":   1,
        "apples":  {"red": 2, "green": 1},
        "bananas": 5
      }
    }
    {
      "apples":  {"golden": 1},
      "bananas": 3,
      "pears":   null,
      "oranges": 6,
      "*":       1
    }

## Reversible

Call:

    fid({
      "pears":   1,
      "apples":  {"red": 2, "green": 1},
      "bananas": 5,
      "mangos":  2
    },
    {
      "apples":  {"golden": 1},
      "bananas": 3,
      "oranges": 6,
      "mangos":  2
    },
    {"reversible": true})

Result:

    {
      "apples":  {"golden": 1},
      "bananas": 3,
      "pears": null,
      "oranges": 6,
      "*": {
        "<": {
          "apples":  {"red": 2, "green": 1},
          "bananas": 5
        },
        ">": {
          "oranges": 1
        },
        "reversible": true
      }
    }

# Nothing in common

In this case, the result has no \* key and the patcher can skip
doing a compariSON and just return the second argument!

Call:

    fid({
      "oranges": 3,
      "bananas": 5
    },
    {
      "apples": 2,
      "pears":  1
    })

Result:

    {
      "apples": 2,
      "pears":  1
    }

# Array

Based on UNIX diff. Starts with an asterisk. Also an example of a nested diff.

Call:

    fid({
      "lines": [
        "#!/usr/bin/env ruby",
        "require 'rubygems'",
        "require 'sinatra'",
        "",
        "get '/' do",
        "  'Hello world!'",
        "end"
      ]
    },
    {
      "lines": [
        "#!/usr/bin/env ruby -rubygems",
        "require 'sinatra'",
        "require 'haml'",
        "",
        "get '/inline' do",
        "  haml '%div.title Hello World'",
        "end",
        "",
        "get '/' do",
        "  haml :index",
        "end",
        "",
        "get '/stylesheet.css' do",
        "  content_type 'text/css', :charset => 'utf-8'",
        "  sass :stylesheet",
        "end"
      ]
    })

Result:

    {
      "lines": [
        "*",
        {
          "-": "1,2c1",
          "<": [
            "#!/usr/bin/env ruby",
            "require 'rubygems'"
          ],
          ">": ["#!/usr/bin/env ruby -rubygems"]
        },
        {
          "-": "3a3,7",
          ">": [
            "require 'haml'",
            "",
            "get '/inline' do",
            "  haml '%div.title Hello World'",
            "end"
          ]
        },
        {
          "-": "6c10,15",
          "<": [
            "  'Hello world!'"
          ]
          ">": [
            "  haml :index",
            "end",
            "",
            "get '/stylesheet.css' do",
            "  content_type 'text/css', :charset => 'utf-8'",
            "  sass :stylesheet",
          ]
        }
      ]
    }

# Edge Cases

* null value in second object
* array that starts with "\*"
* hash containing "\*" key

# TODO

* Implement with ruby
* Implement with javascript
* Handle edge cases
* Add features!
