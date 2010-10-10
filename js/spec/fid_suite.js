(function() {
  var flat_diff, flat_doc1, flat_doc2;
  flat_doc1 = {
    "pears": 1,
    "apples": {
      "red": 2,
      "green": 1
    },
    "bananas": 5,
    "mangos": 2
  };
  flat_doc2 = {
    "apples": {
      "golden": 1
    },
    "bananas": 3,
    "oranges": 6,
    "mangos": 2
  };
  flat_diff = {
    "apples": {
      "+": {
        "golden": 1
      },
      "-": {
        "red": 2,
        "green": 1
      }
    },
    "bananas": {
      "+": 3,
      "-": 5
    },
    "oranges": {
      "+": 6
    },
    "pears": {
      "-": 1
    }
  };
  describe('Fid', function() {
    describe('diff', function() {
      it('returns null for two empty objects', function() {
        return expect(Fid.diff({}, {})).toBeNull();
      });
      it('returns "-" for item not in 2nd object', function() {
        return expect(Fid.diff({
          'apples': 1
        }, {})).toEqual({
          'apples': {
            '-': 1
          }
        });
      });
      it('returns "+" for item not in 1st object', function() {
        return expect(Fid.diff({}, {
          'bananas': 3
        })).toEqual({
          'bananas': {
            '+': 3
          }
        });
      });
      it('returns "-" and "+" for changed item', function() {
        return expect(Fid.diff({
          'bananas': 5
        }, {
          'bananas': 3
        })).toEqual({
          'bananas': {
            '-': 5,
            '+': 3
          }
        });
      });
      it('omits unchanged item', function() {
        return expect(Fid.diff({
          'bananas': 5
        }, {
          'bananas': 5
        })).toEqual();
      });
      return it('correctly returns diff from README', function() {
        return expect(Fid.diff(flat_doc1, flat_doc2)).toEqual(flat_diff);
      });
    });
    return describe('patch', function() {
      it('returns same when patching with null', function() {
        return expect(Fid.patch({}, null)).toEqual({});
      });
      it('removes "-" item in patch', function() {
        return expect(Fid.patch({
          'apples': 1
        }, {
          'apples': {
            '-': 1
          }
        })).toEqual({});
      });
      it('adds "+" item in patch', function() {
        return expect(Fid.patch({}, {
          'bananas': {
            '+': 3
          }
        })).toEqual({
          'bananas': 3
        });
      });
      it('replaces "-" and "+" item in patch', function() {
        return expect(Fid.patch({
          'bananas': 5
        }, {
          'bananas': {
            '-': 5,
            '+': 3
          }
        })).toEqual({
          'bananas': 3
        });
      });
      return it('leaves unchanged with empty patch', function() {
        return expect(Fid.patch({
          'bananas': 5
        }, {})).toEqual({
          'bananas': 5
        });
      });
    });
  });
}).call(this);
