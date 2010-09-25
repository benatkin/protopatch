# fid\* - I see what you did!

Fid will be a JSON diff/patch tool.

# Object

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
      "apples":  {
        ">": {"golden": 1},
        "<": {"red": 2, "green": 1}
      },
      "bananas": {">": 3, "<": 5},
      "oranges": {">": 6},
      "pears":   {"<": 1}
    }

# Array

Based on UNIX diff.

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

# Deep

Call:

    fid({
      "house": {
        "size": "1500 sq ft",
        "hvac": {
          "heater": "electric baseboard"
        }
      },
      "lot": {
        "size": "2 acres"
      }
    },
    {
      "house": {
        "size": "1500 sq ft",
        "hvac": {
          "heater": "gas"
        }
      },
      "lot": {
        "size": "2 acres"
      }
    })

Result:

    {
      "house": {
        "hvac": {
          "heater": {">": "gas", "<": "electric baseboard"}
        }
      }
    }

# Example Documents

I'm going to try to get some good, fun example documents together.
One is documents that represent real things that change, like the
company objects in the
[CrunchBase](http://www.crunchbase.com/help/api)
[API](http://groups.google.com/group/crunchbase-api/web/api-v1-documentation).

One use of the examples will be to check whether the diff docs for them are
easy to read and understand.

# Edge Cases

* objects that contain <, >, or - keys

# TODO

* Implement with ruby
* Implement with javascript
* Handle edge cases
* Add features!

