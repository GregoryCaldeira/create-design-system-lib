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

const configsJson = fs.readFileSync('template.json');
const configs = JSON.parse(configsJson);

const package = JSON.stringify({ ...projectInfo, ...configs }, null, 2);

fs.writeFileSync('package.json', package);
