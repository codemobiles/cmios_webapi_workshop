const express = require('express')
const bodyParser = require('body-parser')
const app = express()

app.use(bodyParser.urlencoded({extended: false}))
app.use(bodyParser.json())

app.post("/login", (req, res)=>{
    console.log(JSON.stringify(req.body))
    res.json({result: 'ok', echo: req.body})
})

app.listen(8080, ()=>{
    console.log("Ready")
})