const defaultTheme = require("tailwindcss/defaultTheme");
module.exports = {
  separator: "_",
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter", ...defaultTheme.fontFamily.sans],
      },
      width: {
        "1of2": "50%",
      },
    },
  },
  variants: {},
  plugins: [require("@tailwindcss/ui")],
};
