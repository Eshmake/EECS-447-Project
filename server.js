//server.js

const http = require('http');
const url = require('url');
const { exec } = require('child_process');
const fs = require('fs');

const PORT = 3000;

// 🔐 CHANGE THESE
const DB_HOST = 'mysql.eecs.ku.edu';
const DB_USER = '447s26_s701a908';
const DB_PASS = '2JfU2NVf6RHr';
const DB_NAME = '447s26_s701a908';

// Helper to run SQL
function runQuery(sql, res) {
    const command = `mysql -h ${DB_HOST} -u ${DB_USER} -p${DB_PASS} ${DB_NAME} -e "${sql.replace(/\n/g, ' ')}"`;

    exec(command, (error, stdout, stderr) => {
        if (error) {
            res.writeHead(500);
            return res.end(stderr);
        }

        const data = parseMySQL(stdout);

        res.writeHead(200, { 'Content-Type': 'application/json' });
        res.end(JSON.stringify(data));
    });
}

// Convert MySQL CLI output → JSON
function parseMySQL(output) {
    const lines = output.trim().split('\n');
    if (lines.length < 2) return [];

    const headers = lines[0].split('\t');

    return lines.slice(1).map(line => {
        const values = line.split('\t');
        let obj = {};
        headers.forEach((h, i) => obj[h] = values[i]);
        return obj;
    });
}

// Server
const server = http.createServer((req, res) => {

    // CORS for external/remote access
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

    const parsedUrl = url.parse(req.url, true);


    // Serve static files
    if (req.method === 'GET' && parsedUrl.pathname.includes('.')) {
        const filePath = '.' + parsedUrl.pathname;

        fs.readFile(filePath, (err, data) => {
            if (err) {
                console.log("File error:", filePath);  // 👈 DEBUG
                res.writeHead(404);
                return res.end("File not found");
            }

            const ext = filePath.split('.').pop();

            let contentType = 'text/plain';
            if (ext === 'js') contentType = 'application/javascript';
            if (ext === 'css') contentType = 'text/css';
            if (ext === 'html') contentType = 'text/html';
            if (ext === 'jpg' || ext === 'jpeg') contentType = 'image/jpeg';
            if (ext === 'png') contentType = 'image/png';
            if (ext === 'ico') contentType = 'image/x-icon';

            res.writeHead(200, { 'Content-Type': contentType });
            res.end(data);
        });

        return;
    }

    // Serve frontend entry
    if (req.method === 'GET' && parsedUrl.pathname === '/') {
        fs.readFile('login.html', (err, data) => {
            if (err) {
                res.writeHead(500);
                return res.end("Error loading login.html");
            }
            res.writeHead(200, { 'Content-Type': 'text/html' });
            res.end(data);
        });
        return;
    }

    // -----------------------------
    // QUERY 1: Events by Region
    // -----------------------------
    if (req.method === 'GET' && parsedUrl.pathname === '/events') {
        const region = parsedUrl.query.region;
        const safeRegion = region.replace(/'/g, "''");

        const sql = `
        SELECT Name, StartDate
        FROM Robotics_Event
        WHERE Region = '${safeRegion}'
        `;

        return runQuery(sql, res);
    }

    // -----------------------------
    // QUERY 2: Teams at Event
    // -----------------------------
    if (req.method === 'GET' && parsedUrl.pathname === '/teamsAtEvent') {
        const eventCode = parsedUrl.query.eventCode;
        const safeCode = eventCode.replace(/'/g, "''");

        const sql = `
        SELECT Robotics_Team.TeamID, Name, Organization
        FROM Robotics_Team
        JOIN Competes_At ON Robotics_Team.TeamID = Competes_At.TeamID
        WHERE EventCode = '${safeCode}'
        `;

        return runQuery(sql, res);
    }

    // -----------------------------
    // QUERY 3: Team Size
    // -----------------------------
    if (req.method === 'GET' && parsedUrl.pathname === '/teamSize') {
        const teamId = parseInt(parsedUrl.query.teamId);

        if (!teamId) {
            res.writeHead(400);
            return res.end('Missing teamId');
        }

        const sql = `
        SELECT COUNT(UserID) AS TeamSize
        FROM Member_Registry
        WHERE TeamID = ${teamId}
        `;

        return runQuery(sql, res);
    }

    // -----------------------------
    // QUERY 4: Teams by Region
    // -----------------------------
    if (req.method === 'GET' && parsedUrl.pathname === '/teamsByRegion') {
        const region = parsedUrl.query.region;
        const safeRegion = region.replace(/'/g, "''");

        const sql = `
        SELECT TeamID, Name, Organization
        FROM Robotics_Team
        WHERE Region = '${safeRegion}'
        `;

        return runQuery(sql, res);
    }

    // -----------------------------
    // QUERY 5: Events for a Team
    // -----------------------------
    if (req.method === 'GET' && parsedUrl.pathname === '/teamEvents') {
        const teamId = parseInt(parsedUrl.query.teamId);

        if (!teamId) {
            res.writeHead(400);
            return res.end('Missing teamId');
        }

        const sql = `
        SELECT Robotics_Event.Name, StartDate
        FROM Robotics_Event
        JOIN Competes_At ON Robotics_Event.EventCode = Competes_At.EventCode
        WHERE TeamID = ${teamId}
        `;

        return runQuery(sql, res);
    }

    // -----------------------------
    // QUERY 6: Average Score
    // -----------------------------
    if (req.method === 'GET' && parsedUrl.pathname === '/avgScore') {
        const eventCode = parsedUrl.query.eventCode;
        const safeCode = eventCode.replace(/'/g, "''");

        const sql = `
        SELECT AVG(ProgrammingScore + DrivingScore) AS AverageScore
        FROM Robotics_Team
        JOIN Competes_At ON Robotics_Team.TeamID = Competes_At.TeamID
        WHERE EventCode = ${safeCode};
        `;

        return runQuery(sql, res);
    }


    // -----------------------------
    // QUERY 7: Login 
    // -----------------------------
    if (req.method === 'POST' && parsedUrl.pathname === '/login') {
    let body = '';

    req.on('data', chunk => body += chunk);
    req.on('end', () => {
        const { username, password } = JSON.parse(body);

        const u = username.replace(/'/g, "''");
        const p = password.replace(/'/g, "''");

        const sql = `
        SELECT UserID, TeamID
        FROM Member_Registry
        WHERE UserID = '${u}' AND Password = '${p}'
        `;

        return runQuery(sql, res);
    });
    return;

    }   


    // -----------------------------
    // QUERY 8: Create Account
    // -----------------------------
    if (req.method === 'POST' && parsedUrl.pathname === '/createAccount') {
    let body = '';

    req.on('data', chunk => body += chunk);
    req.on('end', () => {
        const { username, password, team } = JSON.parse(body);

        const u = username.replace(/'/g, "''");
        const p = password.replace(/'/g, "''");

        const sql = `
        INSERT INTO Member_Registry (UserID, TeamID, Password)
        SELECT '${u}', '${team}', '${p}'
        WHERE NOT EXISTS (
            SELECT 1 FROM Member_Registry WHERE UserID = '${u}'
        )
        `;

        return runQuery(sql, res);
    });

    return;
    }   


    // -----------------------------
    // QUERY 9: Dashboard Navbar
    // -----------------------------
    if (req.method === 'GET' && parsedUrl.pathname === '/dashboard') {
        const userId = parsedUrl.query.userId;

        const sql = `
        SELECT UserID, TeamID
        FROM Member_Registry
        WHERE UserID = '${userId}'
        `;

        return runQuery(sql, res);
    }   


    // -----------------------------
    // QUERY 10: Profile Init
    // -----------------------------
    if (req.method === 'GET' && parsedUrl.pathname === '/profile') {
        const userId = parsedUrl.query.userId;

        const sql = `
        SELECT UserID, TeamID, Password
        FROM Member_Registry
        WHERE UserID = '${userId}'
        `;

        return runQuery(sql, res);
    }


    // -----------------------------
    // QUERY 11: Profile Update
    // -----------------------------
    if (req.method === 'POST' && parsedUrl.pathname === '/updateProfile') {
    let body = '';

    req.on('data', chunk => body += chunk);
    req.on('end', () => {
        const { userId, password, team } = JSON.parse(body);

        const p = password.replace(/'/g, "''");

        const sql = `
        UPDATE Member_Registry
        SET TeamID = '${team}', Password = '${p}'
        WHERE UserID = '${userId}'
        `;

        return runQuery(sql, res);
    });

    return;
    }


    


    // Default
    res.writeHead(404);
    res.end('Route not found');
});

// Start server
server.listen(PORT, '0.0.0.0', () => {
    console.log(`Server running at http://localhost:${PORT}`);
});