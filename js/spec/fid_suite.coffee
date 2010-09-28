describe 'Fid', () ->

  describe 'diff', () ->
    it 'returns {} for two empty objects', () ->
      expect(Fid.diff({}, {})).toEqual({});

  describe 'patch', () ->
    it 'returns {} for two empty objects', () ->
      expect(Fid.patch({}, {})).toEqual({});
