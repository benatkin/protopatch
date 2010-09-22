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
        "apples":  {"red": 1},
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
      "apples":  {"red": 1},
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
        "apples":  {"red": 1},
        "bananas": 3,
        "oranges": 6,
        "mangos":  2
      },
      {"reversible": true})

Result:

    {
      "apples":  {"red": 1},
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

# TODO

* Implement with jQuery
* Add tests (QUnit for now)
* Add pure-JS version
* Add features!

