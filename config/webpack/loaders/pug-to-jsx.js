module.exports = {
  test: /\.pug?(\.erb)?$/,
  use: ["babel-loader", "pug-as-jsx-loader"],
};
