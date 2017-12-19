const libxmljs = require('libxmljs');
const ProgressBar = require('progress');
const fs = require('fs');
const path = require('path');

const INTERVAL = 16;

const dirPath = path.resolve(__dirname, '..', 'data', 'pages');
const filenames = fs.readdirSync(dirPath).filter(x => !x.startsWith('.'));

const len = filenames.length;

const bar = new ProgressBar(':current/:total :percent [:bar] :elapseds/:etas :rateit/s', {
    total: len
});

filenames.forEach((filename, i) => {
    const filePath = path.resolve(dirPath, filename);
    const content = fs.readFileSync(filePath, 'utf-8');
    const doc = libxmljs.parseHtml(content);

    const node = doc.get('//h1');
    if (node) {
        console.log(node.text());
    }

    bar.tick();
    if (!((i + 1) % INTERVAL) || i + 1 === len) {
        bar.render();
    }
});
