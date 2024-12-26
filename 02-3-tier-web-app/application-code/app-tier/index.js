const transactionService = require('./TransactionService');
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const fetch = require('node-fetch');

const app = express();
const port = 4000;

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors());



// ================================ Health Status =====================================//
app.get('/health', (req, res) => {
    res.json("This is the health check");
});
// ====================================================================================//


// ===================================== GET ALL ======================================//
app.get('/transaction', (req, res) => {
    try {
        console.log("\nMethod : GET All");
        var transactionList = [];
        transactionService.getAllTransactions(function (results) {
            for (const row of results) {
                transactionList.push({ "id": row.id, "amount": row.amount, "description": row.description });
            }
            console.log(transactionList);
            res.statusCode = 200;
            res.json({ "result": transactionList });
        });
    } catch (err) {
        res.json({ message: "could not get all transactions", error: err.message });
    }
});
// ====================================================================================//


// ===================================== GET ==========================================//
app.get('/transaction/id', (req, res) => {

    try {
        console.log("\nMethod : GET");

        transactionService.getTransactionById(req.body.id, function (result) {
            res.statusCode = 200;
            res.json({ "id": result[0].id, "amount": result[0].amount, "desc": result[0].desc });
        });

    } catch (err) {
        res.json({ message: "error retrieving transaction", error: err.message });
    }
});
// ====================================================================================//


// ====================================== POST ========================================//
app.post('/transaction', (req, res) => {
    var response = "";
    try {
        console.log("\nMethod : POST");
        // console.log(req.body);

        var success = transactionService.addTransaction(req.body.amount, req.body.description);
        if (success = 200) res.json({ message: 'Added Transaction successfully' });
    } catch (err) {
        res.json({ message: 'Something Went Wrong !!!', error: err.message });
    }
});
// ====================================================================================//


// ===================================== UPDATE =======================================//
app.put('/transaction/id', (req, res) => {
    var response = "";

    try {
        console.log("\nMethod : PUT");
        var success = transactionService.updateTransationById(req.body.id, req.body.amount, req.body.description);
        if (success = 200) res.json({ message: `Updated Transaction successfully at ID: ${req.body.id}` });
    } catch (err) {
        res.json({ message: 'Something Went Wrong !!!', error: err.message });
    }
});
// ====================================================================================//


// ==================================== DELETE ALL ====================================//
app.delete('/transaction', (req, res) => {
    try {
        console.log("\nMethod : DELETE ALL");

        transactionService.deleteAllTransactions(function (result) {
            res.statusCode = 200;
            res.json({ message: "Deleted All Transactions Successfully" })
        })
    } catch (err) {
        res.json({ message: "Deleting All Transactions Failed !!!", error: err.message });
    }
});
// ====================================================================================//


// ====================================== DELETE ======================================//
app.delete('/transaction/id', (req, res) => {
    try {
        console.log("\nMethod : DELETE");

        transactionService.deleteTransactionById(req.body.id, function (result) {
            res.statusCode = 200;
            res.json({ message: `Transaction with ID: ${req.body.id} deleted` });
        })
    } catch (err) {
        res.json({ message: "error deleting transaction", error: err.message });
    }
});
// ====================================================================================//


app.listen(port, () => {
    console.log(`AB3 backend app listening at http://localhost:${port}`)
})