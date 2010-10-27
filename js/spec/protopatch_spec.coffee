flat_doc1  = {
               "pears"  : 1,
               "apples" : {"red": 2, "green": 1},
               "bananas": 5,
               "mangos" : 2
             }
flat_doc2  = {
               "apples" : {"golden": 1},
               "bananas": 3,
               "oranges": 6,
               "mangos" : 2
             }
flat_patch = {
               "apples" : {
                            "+": {"golden": 1},
                            "-": {"red": 2, "green": 1}
                          },
               "bananas": {"+": 3, "-": 5},
               "oranges": {"+": 6},
               "pears"  : {"-": 1}
             }

describe 'ProtoPatch', () ->

  describe 'patch', () ->

    it 'returns the same when patching with null', () ->
      expect(ProtoPatch.patch({}, null)).toEqual({})

    it 'removes "-" item in patch', () ->
      expect(ProtoPatch.patch({'apples': 1}, {'apples': {'-': 1}})).toEqual({})

    it 'adds "+" item in patch', () ->
      expect(ProtoPatch.patch({}, {'bananas': {'+': 3}})).toEqual({'bananas': 3})

    it 'replaces "-" and "+" item in patch', () ->
      expect(ProtoPatch.patch({'bananas': 5}, {'bananas': {'-': 5, '+': 3}}))
         .toEqual({'bananas': 3})

    it 'leaves unchanged with nil patch', () ->
      expect(ProtoPatch.patch({'bananas': 5}, null)).toEqual({'bananas': 5})

    it 'correctly patches with diff from README', () ->
      expect(ProtoPatch.patch(flat_doc1, flat_patch)).toEqual(flat_doc2)

  describe 'diff', () ->

    it 'returns null for two empty objects', () ->
      expect(ProtoPatch.diff({}, {})).toBeNull()

    it 'returns "-" for item not in 2nd object', () ->
      expect(ProtoPatch.diff({'apples': 1}, {})).toEqual({'apples': {'-': 1}})

    it 'returns "+" for item not in 1st object', () ->
      expect(ProtoPatch.diff({}, {'bananas': 3})).toEqual({'bananas': {'+': 3}})

    it 'returns "-" and "+" for changed item', ->
      expect(ProtoPatch.diff({'bananas': 5}, {'bananas': 3}))
        .toEqual({'bananas': {'-': 5, '+': 3}})

    it 'omits unchanged item', ->
      expect(ProtoPatch.diff({'bananas': 5}, {'bananas': 5})).toEqual()

    it 'correctly returns diff from README', ->
      expect(ProtoPatch.diff(flat_doc1, flat_doc2)).toEqual(flat_patch)

