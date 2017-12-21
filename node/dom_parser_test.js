const DomParser = require('dom-parser');
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

const parser = new DomParser();

let err_cnt = 0;

filenames.forEach((filename, i) => {
    try {

        const filePath = path.resolve(dirPath, filenames[i]);
        const content = fs.readFileSync(filePath, 'utf-8');
        const doc = parser.parseFromString(content);

        const nodes = doc.getElementsByTagName('h1');
        // const nodes = doc.getElementsByTagName('option');
        // if (nodes.length) {
        //     console.log(nodes[0].textContent);
        // }
    } catch (e) {
        err_cnt += 1;
    }


    bar.tick();
    if (!((i + 1) % INTERVAL) || i + 1 === len) {
        bar.render();
    }
});

console.log(`err_cnt: ${err_cnt}`);
