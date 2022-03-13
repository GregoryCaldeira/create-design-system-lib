#!/usr/bin/env node
const fs = require('fs');
const projectName = process.argv.slice(2)[0];

const projectInfo = {
  name: projectName,
  version: '1.0.0',
  description: '',
  main: 'index.js',
  scripts: {},
};

let data = JSON.stringify(teste, null, 2);
fs.writeFileSync('package.json', data);
