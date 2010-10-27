(function() {
  var Patcher, ProtoPatch;
  var __hasProp = Object.prototype.hasOwnProperty, __slice = Array.prototype.slice;
  Patcher = function() {};
  Patcher.prototype.patch = function(a, p) {
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
  Patcher.prototype.diff = function(a, b) {
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
  ProtoPatch = function() {};
  ProtoPatch.Patcher = Patcher;
  ProtoPatch._default_patcher = null;
  ProtoPatch.default_patcher = function() {
    return this._default_patcher || (this._default_patcher = new Patcher());
  };
  ProtoPatch.patch = function() {
    var _ref, args;
    args = __slice.call(arguments, 0);
    return (_ref = this.default_patcher()).patch.apply(_ref, args);
  };
  ProtoPatch.diff = function() {
    var _ref, args;
    args = __slice.call(arguments, 0);
    return (_ref = this.default_patcher()).diff.apply(_ref, args);
  };
  window.ProtoPatch = ProtoPatch;
}).call(this);
