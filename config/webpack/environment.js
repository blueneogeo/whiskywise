const { environment } = require("@rails/webpacker");
const typescript = require("./loaders/typescript");
const pug_to_jsx = require("./loaders/pug-to-jsx");

environment.loaders.prepend("pug", pug_to_jsx);
environment.loaders.prepend("typescript", typescript);
module.exports = environment;
