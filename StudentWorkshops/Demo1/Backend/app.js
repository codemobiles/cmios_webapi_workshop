const express = require('express')
const app = express()

app.post("/login", (req, res)=>{
    res.json({result: 'ok'})
})

app.listen(8080, ()=>{
    console.log("Ready")
})