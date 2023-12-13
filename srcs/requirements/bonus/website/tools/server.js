var https = require('https');
const fs = require('fs');

const options = {
    key: fs.readFileSync('/etc/node/ssl/inception.key'),
    cert: fs.readFileSync('/etc/node/ssl/inception.crt')
};

const server = https.createServer(options, (req, res) => {
    res.writeHead(200, { 'Content-Type': 'text/html' });
    const htmlContent = fs.readFileSync('/var/www/html/site.html', 'utf-8');
    res.end(htmlContent);
});

const PORT = 1111;
const HOST = '0.0.0.0';

server.listen(PORT, HOST, () => {
    console.log(`Server running at https://${HOST}:${PORT}/`);
});