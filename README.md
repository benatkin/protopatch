# fid - I see what you did!

    fid({
        "pears":   1,
        "apples":  {"red": 2, "green": 1},
        "bananas": 5
      },
      {
        "apples":  {"red": 1},
        "bananas": 3,
        "oranges": 6
      })

    -> {
      "apples":    {"red": 1},
      "bananas":   3,
      "_removed":  {"pears": 1},
      "_replaced": {
        "apples":  {"red": 2, "green": 1},
        "bananas": 5
      }
    }

# TODO

* Implement with jQuery
* Add tests (QUnit for now)
* Add pure-JS version
* Add features!

