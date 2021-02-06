const express = require('express')
const bodyParser = require('body-parser')
var formidable = require('formidable');
var path = require('path');
var fs = require("fs-");

const app = express()

app.use(bodyParser.urlencoded({extended: false}))
app.use(bodyParser.json())

app.post("/login", (req, res)=>{
    console.log(JSON.stringify(req.body))
    const {username, password} = req.body
    if (username == 'lek' && password == '555'){
        res.json({result: 'ok', echo: req.body})
    }else{
        res.json({result: 'nok', echo: req.body})
    }    
})



app.post('/uploads/', function (req, res) {
    console.log("Upload File");

    try {
        var form = new formidable.IncomingForm();
        form.parse(req, function (err, fields, files) {

            console.log(JSON.stringify(files));
            var oldpath = files.userfile.path;
            var newpath = path.join(__dirname, "./upload/" + files.userfile.name);
            
            fs.rename(oldpath, newpath, function (err) {
                if (err) throw err;

              var username = fields.username;
              var password =fields.password;
              console.log("username: " + username);
              console.log("password: " + password);
              res.end("Upload Successfully");

            });            
        });
    } catch (err) {
        console.log("err : " + err);
    }
});


app.listen(8080, ()=>{
    console.log("Ready")
})