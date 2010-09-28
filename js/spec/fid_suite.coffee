describe 'Fid', () ->

  describe 'diff', () ->
    it 'returns {} for two empty objects', () ->
      expect(Fid.diff({}, {})).toEqual({});
    it 'returns "<" for item not in 2nd object', () ->
      expect(Fid.diff({'apples': 1}, {})).toEqual({'apples': {'<': 1}});

  describe 'patch', () ->
    it 'returns {} for two empty objects', () ->
      expect(Fid.patch({}, {})).toEqual({});
