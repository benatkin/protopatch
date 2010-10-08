# Design for future versions

## Array

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
          "-": 0,
          "<": [
            "#!/usr/bin/env ruby",
            "require 'rubygems'"
          ],
          ">": ["#!/usr/bin/env ruby -rubygems"]
        },
        {
          "-": 2,
          ">": [
            "require 'haml'",
            "",
            "get '/inline' do",
            "  haml '%div.title Hello World'",
            "end"
          ]
        },
        {
          "-": 9,
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

Patching:

    function patch(orig, adiff) {
      for (var i=0; i < adiff.length; i++) {
        var diff = adiff[i];
        var args = [diff["-"], diff["<"] ? diff["<"].length : 0].concat(diff[">"] ? diff[">"] : []);
        arr.splice.apply(arr, args);
      }
    }

