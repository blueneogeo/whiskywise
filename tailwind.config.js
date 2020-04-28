const defaultTheme = require("tailwindcss/defaultTheme");
module.exports = {
  separator: "_",
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter", ...defaultTheme.fontFamily.sans],
      },
    },
  },
  variants: {},
  plugins: [require("@tailwindcss/ui")],
};
