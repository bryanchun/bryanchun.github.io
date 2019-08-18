/**
 * Exports
 * - load_yaml : (path, callback) -> ()
 */

// Tutorial at https://codepen.io/KryptoniteDove/post/load-json-file-locally-using-pure-javascript
function load_yaml(path, callback) {   
  var xobj = new XMLHttpRequest();
      xobj.overrideMimeType("application/yaml")
  xobj.open('GET', path, true); // Replace 'my_data' with the path to your file
  xobj.onreadystatechange = function () {
        if (xobj.readyState == 4 && xobj.status == "200") {
          // Required use of an anonymous callback as .open will NOT return a value but simply returns undefined in asynchronous mode
          callback(xobj.responseText)
          return xobj.responseText
        }
  }
  xobj.send(null)
}