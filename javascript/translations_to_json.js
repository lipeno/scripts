/*
 * Converting Google Spreadsheet to JSON language data.
 */

var public_spreadsheet_url = 'https://docs.google.com/spreadsheet/pub?key=' + 'YOUR_SPREADSHEET_KEY';

var fs = require('fs'),
  request = require('request'),
  async = require('async');

// Define the url to your spreadsheet, note: spreadsheet has to be published to be accessible

var key;
if (/key=/.test(public_spreadsheet_url)) {
  key = public_spreadsheet_url.match("key=(.*?)&")[1];
}
var sheet_url = [];
var json_url = "https://spreadsheets.google.com/feeds/worksheets/" + key + "/public/basic?alt=json-in-script";

request(json_url, function(error, response, body) {
  if (!error && response.statusCode === 200) {
    var data = JSON.parse((body.substring(0, body.length - 2)).substring(28));
    for (var i = 0, numberOfSheets = data.feed.entry.length; i < numberOfSheets; i++) {
      var sheet_id = data.feed.entry[i].link[3].href.substr(data.feed.entry[i].link[3].href.length - 3, 3);
      sheet_url.push("https://spreadsheets.google.com/feeds/list/" + key + "/" + sheet_id + "/public/values?alt=json-in-script");
    }
    // Get the data for each sheet in the spreadsheet, which represents each language
    async.forEach(sheet_url, function(item, callback) {
      request(item, function(error, response, body) {
        var data = JSON.parse((body.substring(0, body.length - 2)).substring(28));
        var rows = data.feed.entry ? data.feed.entry : [];
        var language;
        if (data.feed.title.$t) {
          language = data.feed.title.$t;
        }
        else {
          callback('Error');
        }
        var translationData = {};
        translationData[""] = {
          "domain"      : "jolicloud",
          "lang"        : language,
          "plural_forms": "nplurals=2; plural=(n != 1);"
        };
        for (var j = 0, numberOfRows = rows.length; j < numberOfRows; j++) {
          translationData[rows[j].gsx$english.$t] = [null, rows[j].gsx$translated.$t];
        }
        var jsonObject = {};
        jsonObject.jolicloud = translationData;
        // Write the data to filesystem
        var outputFilename = 'LANGUAGES_FOLDER' + language + '.json';
        fs.writeFile(outputFilename, JSON.stringify(jsonObject, null, 4), function(err) {
          if (err) {
            console.log('Error with: ' + outputFilename + ',' + err);
          } else {
            console.log(language + " JSON saved to " + outputFilename);
          }
        });
      });
    }, function(err) {
      console.log('Error occurred: ' + err);
    });
  }
});