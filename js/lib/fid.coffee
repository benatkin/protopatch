class Differ
  diff: (a, b) ->
    p = {}
    keys = {}
    for k of a
      keys[k] = 1
    for k of b
      keys[k] = 1
    for k of keys
      if a[k] and b[k]
        unless a[k] == b[k]
          p[k] = {'-': a[k], '+': b[k]}
      else if a[k]
        p[k] = {'-': a[k]}
      else if b[k]
        p[k] = {'+': b[k]}
    p = null if _.size(p) == 0
    p
  patch: (doc, p) ->
    patched = _.clone(doc)
    for k of p
      if p[k]['-'] and p[k]['+']
        patched[k] = p[k]['+']
      else if p[k]['-']
        delete patched[k]
      else if p[k]['+']
        patched[k] = p[k]['+']
    patched

class Fid
  @Differ: Differ
  @_default_differ: null

  @default_differ: () ->
    unless @_default_differ
      @_default_differ = new Differ()
    @_default_differ

  @diff: (args...) ->
    @default_differ().diff(args...)

  @patch: (args...) ->
    @default_differ().patch(args...)

window.Fid = Fid
