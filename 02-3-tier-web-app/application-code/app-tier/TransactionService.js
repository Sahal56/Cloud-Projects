const dbcreds = require('./db_data/DbConfig');
const mysql = require('mysql2');

const con = mysql.createConnection({
    host: dbcreds.DB_HOST,
    user: dbcreds.DB_USER,
    password: dbcreds.DB_PWD,
    database: dbcreds.DB_DATABASE
});

function getAllTransactions(callback) {
    const mysql = "SELECT * FROM transactions";
    console.log("\nService : Getting All Transactions ...\n");
    con.query(mysql, function (err, result) {
        if (err) throw err;
        return (callback(result));
    });
}

function getTransactionById(id, callback) {
    var mysql = `SELECT * FROM transactions WHERE id = ${id}`;
    con.query(mysql, function (err, result) {
        if (err) throw err;
        console.log(`\nService : Retrieving Transaction with id : ${id}\n`);
        return (callback(result));
    })
}

function addTransaction(amount, description) {
    var mysql = `INSERT INTO \`transactions\` (\`amount\`, \`description\`) VALUES ('${amount}','${description}')`;
    con.query(mysql, function (err, result) {
        if (err) throw err;
        console.log(`\nService : Transaction Added at ID : ${result.insertId}`);
    })
    return 200;
}

function updateTransationById(id, amount, description) {
    const query = "UPDATE `transactions` SET `amount` = ?, `description` = ? WHERE id = ?";
    const values = [amount, description, id];

    con.query(query, values, function (err, result) {
        if (err) throw err;
        console.log(`\nService: Item updated at ID : ${id}`);
    })
    return 200;
}

function deleteAllTransactions(callback) {
    var mysql = "DELETE FROM transactions";
    con.query(mysql, function (err, result) {
        if (err) throw err;
        console.log(`\nService : Deleting All Transactions ...`);
        return (callback(result));
    })
}

function deleteTransactionById(id, callback) {
    var mysql = `DELETE FROM transactions WHERE id = ${id}`;
    con.query(mysql, function (err, result) {
        if (err) throw err;
        console.log(`\nService : Deleting transaction at ID : ${id}`);
        return (callback(result));
    })
}

module.exports = { getAllTransactions, getTransactionById, addTransaction, updateTransationById, deleteAllTransactions, deleteTransactionById }