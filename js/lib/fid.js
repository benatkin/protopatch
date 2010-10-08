(function() {
  var Fid;
  var __hasProp = Object.prototype.hasOwnProperty;
  Fid = function() {};
  Fid.diff = function(doc1, doc2) {
    var _diff, _i, _ref, k, keys;
    _diff = {};
    keys = {};
    _ref = doc1;
    for (k in _ref) {
      if (!__hasProp.call(_ref, k)) continue;
      _i = _ref[k];
      keys[k] = 1;
    }
    _ref = doc2;
    for (k in _ref) {
      if (!__hasProp.call(_ref, k)) continue;
      _i = _ref[k];
      keys[k] = 1;
    }
    _ref = keys;
    for (k in _ref) {
      if (!__hasProp.call(_ref, k)) continue;
      _i = _ref[k];
      if (doc1[k] && doc2[k]) {
        if (doc1[k] !== doc2[k]) {
          _diff[k] = {
            '<': doc1[k],
            '>': doc2[k]
          };
        }
      } else if (doc1[k]) {
        _diff[k] = {
          '<': doc1[k]
        };
      } else if (doc2[k]) {
        _diff[k] = {
          '>': doc2[k]
        };
      }
    }
    if (_.size(_diff) === 0) {
      _diff = null;
    }
    return _diff;
  };
  Fid.patch = function(doc, _patch) {
    var _i, _ref, k, patched;
    patched = {};
    _ref = doc;
    for (k in _ref) {
      if (!__hasProp.call(_ref, k)) continue;
      _i = _ref[k];
      patched[k] = doc[k];
    }
    _ref = _patch;
    for (k in _ref) {
      if (!__hasProp.call(_ref, k)) continue;
      _i = _ref[k];
      if (_patch[k]['<'] && _patch[k]['>']) {
        patched[k] = _patch[k]['>'];
      } else if (_patch[k]['<']) {
        delete patched[k];
      } else if (_patch[k]['>']) {
        patched[k] = _patch[k]['>'];
      }
    }
    return patched;
  };
  window.Fid = Fid;
}).call(this);
