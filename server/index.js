//importing package
const express = require('express');
const mongoose = require('mongoose');
//importing other files
const authRouter = require('./routes/auth');
const DB = "mongodb+srv://pratieksonare:yrrouTh37gvRirwJ@amazonclone.geq4plz.mongodb.net/";
//Init
const PORT = 3000;

//middleware:
const app = express(); 
app.use(express.json());  
app.use(authRouter);  

//Connections:
mongoose
    .connect(DB)
    .then(() => {
    console.log("Connection successful");
})
    .catch((e) => {
        console.log(e);
});


//API
//CRUD

app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected at port ${PORT}`);
})