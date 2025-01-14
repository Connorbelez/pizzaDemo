//run ts build 
const { exec } = require('child_process');
exec('tsc');

//move the db folder to the dist folder 
exec('mv src/db dist/db');
