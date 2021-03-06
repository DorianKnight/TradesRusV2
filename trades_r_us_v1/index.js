const express = require('express');
const app = express();
const mysql = require('mysql');
const PORT = 8000;

var bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended: false}))
app.use(bodyParser.json())


//app.use(express.json())

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'tradesrus'
})

db.connect(err => {
    if(err) {
        throw err
    }
    console.log('MySQL Connected')
})

// 

app.get('/tilers', (req, res) => {
    req.body
    let sql = 'SELECT * FROM alltrades WHERE trade = "tiling"'
    let query = db.query(sql, (err, result) => {
        if(err){
            throw err
        }
        console.log(result)
        res.send(result)
        

        
    })
    
})

app.get('/roofers', (req, res) => {
    let sql = 'SELECT * FROM alltrades WHERE trade = "roofing"'
    let query = db.query(sql, (err, result) => {
        if(err){
            throw err
        }
        console.log(result)
        res.send(result)
        

        
    })
    
})

app.get('/welders', (req, res) => {
    let sql = 'SELECT * FROM alltrades WHERE trade = "welding"'
    let query = db.query(sql, (err, result) => {
        if(err){
            throw err
        }
        console.log(result)
        res.send(result)
        

        
    })
    
})

app.get('/floorers', (req, res) => {
    let sql = 'SELECT * FROM alltrades WHERE trade = "flooring"'
    let query = db.query(sql, (err, result) => {
        if(err){
            throw err
        }
        console.log(result)
        res.send(result)
        

        
    })
    
})

app.get('/plumbers', (req, res) => {
    let sql = 'SELECT * FROM alltrades WHERE trade = "plumbing"'
    let query = db.query(sql, (err, result) => {
        if(err){
            throw err
        }
        console.log(result)
        res.send(result)
        

        
    })
    
})

//Add new account to database
app.post('/addaccount', (req, res) => {
    console.log(req.body);
    var email = req.body[0].email;
    var password = req.body[0].password;
    let post = {email: email, password: password};
    //let post = {email: ${}}
    //(id, email, password) VALUES (NULL, 123, 456)
    let sql = `INSERT INTO profiles SET ?`;
    //let sql = 'INSERT INTO alltrades SET ?'
    let query = db.query(sql, post, err => {
        if(err) {
            throw err
        }
        res.send ('Account added')
    })
    
    
    console.log(req.body[0].email);
    console.log(req.body[0].password);
})


//Request password hash of email
app.post('/login', (req, res) => {
    console.log(req.body);
    email = String(req.body[0].email);
    //console.log(email)
    //let sql = "SELECT * FROM profiles WHERE email = 'Jacob@gmail.com'";
    let sql = "SELECT * FROM profiles WHERE email = '"+email+"'";
    let query = db.query(sql, (err, result) => {
    if(err){
        throw err
    }
    console.log(result)
    res.send(result)
    //console.log(`${email}`);
    })
})

app.listen(
    PORT, () => console.log(`it\'s alive on http://localhost:${PORT}`)
)




//Create Database
// app.get('/createdb', (req, res) => {
//     let sql = 'CREATE DATABASE tradesrus';
//     db.query(sql, (err) => {
//         if(err){
//             throw err;
//         }
//         res.send("Database Created")
//     })
// })

// //Create Table

// app.get('/createtradetable', (req, res) => {
//     let sql = 'CREATE TABLE alltrades(id int AUTO_INCREMENT, trade VARCHAR(255), company_name VARCHAR(255), PRIMARY KEY(id))'
//     db.query(sql, err => {
//         if(err){
//             throw err
//         }
//         res.send('Trade table created')
//     })
// })

// //Insert trade

// app.get('/plumbing', (req, res) => {
//     let post = {trade: 'Plumbing', company_name: 'Mr.Rooters'}
//     let sql = 'INSERT INTO alltrades SET ?'
//     let query = db.query(sql, post, err => {
//         if(err) {
//             throw err
//         }
//         res.send ('plumber added')
//     })
// })

// app.get('/tiling', (req, res) => {
//     let post = {trade: 'Tiling', company_name: 'The Crooked Tile'}
//     let sql = 'INSERT INTO alltrades SET ?'
//     let query = db.query(sql, post, err => {
//         if(err) {
//             throw err
//         }
//         res.send ('tiler added')
//     })
// })

// app.get('/roofing', (req, res) => {
//     let post = {trade: 'Roofing', company_name: 'Get it done roofing'}
//     let sql = 'INSERT INTO alltrades SET ?'
//     let query = db.query(sql, post, err => {
//         if(err) {
//             throw err
//         }
//         res.send ('roofer added')
//     })
// })


// //get number of entries
// let numofRows = db.query('SELECT COUNT(id) FROM trade', (err,answer) => {
//     if(err){
//         throw err
//     }
//     console.log(Object.keys(answer[0]))
//     console.log(answer)
//     console.log(answer[0]['COUNT(id)'])
//     //let parsed = JSON.parse(answer)
//     //console.log(obj.COUNT(id))
// })