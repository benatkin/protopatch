(function() {
  describe('Fid', function() {
    describe('diff', function() {
      return it('returns {} for two empty objects', function() {
        return expect(Fid.diff({}, {})).toEqual({});
      });
    });
    return describe('patch', function() {
      return it('returns {} for two empty objects', function() {
        return expect(Fid.patch({}, {})).toEqual({});
      });
    });
  });
}).call(this);
