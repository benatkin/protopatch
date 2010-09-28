class Fid
  @diff: (doc1, doc2) ->
    _diff = {}
    keys = {}
    for k of doc1
      keys[k] = 1
    for k of doc2
      keys[k] = 1
    for k of keys
      if doc1[k] and doc2[k]
        unless doc1[k] == doc2[k]
          _diff[k] = {'<': doc1[k], '>': doc2[k]}
      else if doc1[k]
        _diff[k] = {'<': doc1[k]}
      else if doc2[k]
        _diff[k] = {'>': doc2[k]}
    _diff
  @patch: (doc1, doc2) -> {}

window.Fid = Fid
