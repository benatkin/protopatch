flat_doc1 = {
              "pears"  : 1,
              "apples" : {"red": 2, "green": 1},
              "bananas": 5,
              "mangos" : 2
            }
flat_doc2 = {
              "apples" : {"golden": 1},
              "bananas": 3,
              "oranges": 6,
              "mangos" : 2
            }
flat_diff = {
              "apples" : {
                           ">": {"golden": 1},
                           "<": {"red": 2, "green": 1}
                         },
              "bananas": {">": 3, "<": 5},
              "oranges": {">": 6},
              "pears"  : {"<": 1}
            }

describe 'Fid', () ->

  describe 'diff', () ->

    it 'returns {} for two empty objects', () ->
      expect(Fid.diff({}, {})).toEqual({});

    it 'returns "<" for item not in 2nd object', () ->
      expect(Fid.diff({'apples': 1}, {})).toEqual({'apples': {'<': 1}});

    it 'returns ">" for item not in 1st object', () ->
      expect(Fid.diff({}, {'bananas': 3})).toEqual({'bananas': {'>': 3}})

    it 'returns "<" and "> for changed item', ->
      expect(Fid.diff({'bananas': 5}, {'bananas': 3}))
        .toEqual({'bananas': {'<': 5, '>': 3}})

    it 'omits unchanged item', ->
      expect(Fid.diff({'bananas': 5}, {'bananas': 5})).toEqual({})

    it 'correctly returns diff from README', ->
      expect(Fid.diff(flat_doc1, flat_doc2)).toEqual(flat_diff)

  describe 'patch', () ->

    it 'returns {} for two empty objects', () ->
      expect(Fid.patch({}, {})).toEqual({});

    it 'removes "<" item in patch', () ->
      expect(Fid.patch({'apples': 1}, {'apples': {'<': 1}})).toEqual({})

    it 'adds ">" item in patch', () ->
      expect(Fid.patch({}, {'bananas': {'>': 3}})).toEqual({'bananas': 3})

    it 'replaces "<" and ">" item in patch', () ->
      Fid.patch({'bananas': 5}, {'bananas': {'<': 5, '>': 3}})
         .should == {'bananas': 3}

    it 'leaves unchanged with empty patch', () ->
      Fid.patch({'bananas': 5}, {}).should == {'bananas': 5}

