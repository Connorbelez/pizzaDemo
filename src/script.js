let json = require('./data.json');

// console.log(json);
let id = 0 

function jsonCrawler(json) {
  //go to the deepest level
  for (let key in json) {
    if (typeof json[key] === 'object') {
      //Check to see if it's an array
      if (Array.isArray(json[key])) {
        for (let i = 0; i < json[key].length; i++) {
          jsonCrawler(json[key][i])
        }
      } else{
        jsonCrawler(json[key])
      }
    }
  }

  //add id to the deepest level
  json.id = id++
}

function jsonBuilder(json) {
  jsonCrawler(json)
  console.log(json)
  return json 
}

jsonBuilder(json)
