/**
 Get data about users from intercom
 */

var url = "SET THE URL TO INTERCOM API ENDPOINT FOR USER RETRIVAL";

// to prevent slow loading, Max number of pages to retrieve
var maxPages = 100;
console.log('The limit is set for retrieving a maximum of ' + maxPages + ' pages');
var per_page = '500';
// data is in this format
var csvOutput = 'User id,Date of signup,Last seen,Total number of sessions,City,Country,Browser,Browser version,Operating System\n';
var next_page = 1;
var total = 0;
var filename = "usersDataOutput.csv";

var useragent = require('useragent');
var nodemailer = require("nodemailer");


var options = {
  uri:url + '?per_page=' + per_page + '&page=' + next_page
};

try {
  makeRequest(options);
}
catch
  (err) {
  console.log(err);
}

function sendEmail(inputString){

  var transport = nodemailer.createTransport("SMTP", {
    service: 'Gmail', // use well known service
    auth: {
      user: "USERNAME",
      pass: "PASSWORD"
    }
  });

  console.log('SMTP Configured');
  var currentDate = new Date();


// Message object
  var message = {

    // sender info
    from: 'EMAIL',

    // Comma separated list of recipients
    to: 'EMAIL',

    // Subject of the message
    subject: 'Intercom.io usage data report', //

    headers: {
      'X-Laziness-level': 1000
    },

    // plaintext body
    text: 'Hello, This is the intercom.io report about usage data generated today at ' + currentDate + '. Please see the file attached: ' + filename + '.',

    // An array of attachments
    attachments:[

      // String attachment
      {
        fileName: filename,
        contents: inputString,
        contentType: 'text/csv' // optional, would be detected from the filename
      }
    ]
  };

  console.log('Sending Mail');
  transport.sendMail(message, function(error){
    if(error){
      console.log('Error occured');
      console.log(error.message);
      return;
    }
    console.log('Message sent successfully!');

    // if you don't want to use this transport object anymore, uncomment following line
    transport.close(); // close the connection pool
  });

}


function makeRequest(options) {
  var request = require('request');

  request(options, function (error, response, body) {
    if (error) {
      console.log(error);
    }
    if (!error && response.statusCode === 200) {
      var jsonData = JSON.parse(body);
      var users = jsonData.users;
      next_page = jsonData.next_page;
      var current_page = jsonData.page;
      total = jsonData.total_pages;
      console.log('Now processing page ' + current_page + ' of totally ' + total + ' where on each page there are ' + per_page + ' users.');

      for (var i = 1; i < users.length; i++) {

        var created_at = new Date(users[i].created_at * 1000).toString();
        var last_impression_at = new Date(users[i].last_impression_at * 1000).toString();

        csvOutput += users[i].user_id + ',' + created_at + ',' + last_impression_at + ',' + users[i].session_count;
        if (users[i].location_data) {
          if (users[i].location_data.city_name) {
            csvOutput += ',' + users[i].location_data.city_name;
          }
          else {
            csvOutput += ',' + '';
          }
          if (users[i].location_data.country_name) {
            csvOutput += ',' + users[i].location_data.country_name;
          }
          else {
            csvOutput += ',' + '';
          }
        }
        else {
          csvOutput += ',' + '' + ',' + '';
        }

//        Getting browser, browser version and OS https://github.com/3rd-Eden/useragent
        var agent = useragent.parse(users[i].last_seen_user_agent);
        var agentJSON = JSON.parse(agent.toJSON());
        var agentBrowserName = agentJSON.family;
//        var agentBrowserVersion = agent.major + agent.minor;
        var agentBrowserVersion = agentJSON.major;
        var agentOs = agentJSON.os;

        csvOutput += ',' + agentBrowserName + ',' + agentBrowserVersion + ',' + agentOs;
        csvOutput += '\n';
      }
      // paging , if next_page is not null
      if (next_page) {
        if ((next_page <= total) && (next_page <= maxPages)) {
          options = {
            uri:url + '?per_page=' + per_page + '&page=' + next_page
          };
          makeRequest(options);
        }
      }
      else {
        sendEmail(csvOutput);
      }
    }
  });
}