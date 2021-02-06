const express = require("express");
const bodyParser = require("body-parser");
var formidable = require("formidable");
var path = require("path");
var fs = require("fs-extra");
const app = express();

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.post("/login", (req, res) => {
  console.log(JSON.stringify(req.body));
  const { username, password } = req.body;
  if (username == "lek" && password == "555") {
    res.json({ result: "ok", echo: req.body });
  } else {
    res.json({ result: "nok", echo: req.body });
  }
});

app.post("/uploads/", function (req, res) {
  console.log("Upload File");
  try {
    var form = new formidable.IncomingForm();
    form.parse(req, async (err, fields, files) => {
      console.log(JSON.stringify(files));
      // --------------------
      var oldpath = files.image.path;
      var newpath = path.join(__dirname, "./uploads/" + files.image.name);
      await fs.move(oldpath, newpath);
      res.json({ result: "ok", fields, files });
      
    });
  } catch (err) {
    res.json({ result: "nok" });
  }
});

app.listen(8080, () => {
  console.log("Ready");
});
