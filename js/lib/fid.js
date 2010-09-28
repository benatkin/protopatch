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
    return _diff;
  };
  Fid.patch = function(doc1, doc2) {
    return {};
  };
  window.Fid = Fid;
}).call(this);
