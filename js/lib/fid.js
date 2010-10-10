(function() {
  var Differ, Fid;
  var __hasProp = Object.prototype.hasOwnProperty, __slice = Array.prototype.slice;
  Differ = function() {};
  Differ.prototype.diff = function(a, b) {
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
  Differ.prototype.patch = function(a, p) {
    var _i, _ref, b, k;
    b = _.clone(a);
    if (p === null) {
      return b;
    }
    _ref = p;
    for (k in _ref) {
      if (!__hasProp.call(_ref, k)) continue;
      _i = _ref[k];
      if (p[k]['-'] && p[k]['+']) {
        b[k] = p[k]['+'];
      } else if (p[k]['-']) {
        delete b[k];
      } else if (p[k]['+']) {
        b[k] = p[k]['+'];
      }
    }
    return b;
  };
  Fid = function() {};
  Fid.Differ = Differ;
  Fid._default_differ = null;
  Fid.default_differ = function() {
    if (!(this._default_differ)) {
      this._default_differ = new Differ();
    }
    return this._default_differ;
  };
  Fid.diff = function() {
    var _ref, args;
    args = __slice.call(arguments, 0);
    return (_ref = this.default_differ()).diff.apply(_ref, args);
  };
  Fid.patch = function() {
    var _ref, args;
    args = __slice.call(arguments, 0);
    return (_ref = this.default_differ()).patch.apply(_ref, args);
  };
  window.Fid = Fid;
}).call(this);
