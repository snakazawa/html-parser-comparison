const {JSDOM} = require('jsdom');
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

(async () => {
    for (let i = 0; i < len; ++i) {
        const filePath = path.resolve(dirPath, filenames[i]);
        const dom = await JSDOM.fromFile(filePath);

        // const {window: {document: doc}} = dom;
        // const nodes = doc.getElementsByTagName('h1');
        // if (nodes.length) {
        //     console.log(nodes[0].textContent);
        // }

        bar.tick();
        if (!((i + 1) % INTERVAL) || i + 1 === len) {
            bar.render();
        }
    }
})();
