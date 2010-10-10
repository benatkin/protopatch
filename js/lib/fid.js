(function() {
  var Fid;
  var __hasProp = Object.prototype.hasOwnProperty;
  Fid = function() {};
  Fid.diff = function(a, b) {
    var _i, _ref, k, keys, p;
    p = {};
    keys = {};
    _ref = a;
    for (k in _ref) {
      if (!__hasProp.call(_ref, k)) continue;
      _i = _ref[k];
      keys[k] = 1;
    }
    _ref = b;
    for (k in _ref) {
      if (!__hasProp.call(_ref, k)) continue;
      _i = _ref[k];
      keys[k] = 1;
    }
    _ref = keys;
    for (k in _ref) {
      if (!__hasProp.call(_ref, k)) continue;
      _i = _ref[k];
      if (a[k] && b[k]) {
        if (a[k] !== b[k]) {
          p[k] = {
            '-': a[k],
            '+': b[k]
          };
        }
      } else if (a[k]) {
        p[k] = {
          '-': a[k]
        };
      } else if (b[k]) {
        p[k] = {
          '+': b[k]
        };
      }
    }
    if (_.size(p) === 0) {
      p = null;
    }
    return p;
  };
  Fid.patch = function(doc, p) {
    var _i, _ref, k, patched;
    patched = _.clone(doc);
    _ref = p;
    for (k in _ref) {
      if (!__hasProp.call(_ref, k)) continue;
      _i = _ref[k];
      if (p[k]['-'] && p[k]['+']) {
        patched[k] = p[k]['+'];
      } else if (p[k]['-']) {
        delete patched[k];
      } else if (p[k]['+']) {
        patched[k] = p[k]['+'];
      }
    }
    return patched;
  };
  window.Fid = Fid;
}).call(this);
