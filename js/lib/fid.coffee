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
    _diff = null if _.size(_diff) == 0
    _diff
  @patch: (doc, _patch) ->
    patched = _.clone(doc)
    for k of _patch
      if _patch[k]['<'] and _patch[k]['>']
        patched[k] = _patch[k]['>']
      else if _patch[k]['<']
        delete patched[k]
      else if _patch[k]['>']
        patched[k] = _patch[k]['>']
    patched

window.Fid = Fid
