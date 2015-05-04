var cjsxify = require("cjsxify");

module.exports = {
  process: function(src, path) {
    if (cjsxify.isCjsx(path)) {
      var result;

      cjsxify.compile(path, src, function(error, js) {
        if (error) {
          throw new Error("Can't parse " + path);
        } else {
          result = js;
        }
      });

      return result;
    }

    return src;
  }
};
