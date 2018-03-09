encode(Map obj) {
  var str = '';

  for (var i in obj.keys) {
    if (str.length > 0) str += '&';
    str += Uri.encodeComponent('$i') + '=' + Uri.encodeComponent('${obj[i]}');
  }

  return str;
}

/**
 * Parses a simple querystring into an object
 *
 * @param {String} qs
 * @api private
 */
decode(qs){
  var qry = {};
  var pairs = qs.split('&');
  for (var i = 0, l = pairs.length; i < l; i++) {
    var pair = pairs[i].split('=');
    qry[Uri.decodeComponent(pair[0])] = Uri.decodeComponent(pair[1]);
  }
  return qry;
}