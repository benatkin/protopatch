(function() {
  describe('Fid', function() {
    describe('diff', function() {
      it('returns {} for two empty objects', function() {
        return expect(Fid.diff({}, {})).toEqual({});
      });
      return it('returns "<" for item not in 2nd object', function() {
        return expect(Fid.diff({
          'apples': 1
        }, {})).toEqual({
          'apples': {
            '<': 1
          }
        });
      });
    });
    return describe('patch', function() {
      return it('returns {} for two empty objects', function() {
        return expect(Fid.patch({}, {})).toEqual({});
      });
    });
  });
}).call(this);
