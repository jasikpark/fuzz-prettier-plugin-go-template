const prettier = require("prettier");
const GoTemplatePlugin = require("prettier-plugin-go-template");

module.exports = function fuzz(buf) {
  try {
    const input = String.fromCodePoint(...buf);
    console.debug(GoTemplatePlugin);

    prettier.format(input, {
      parser: "go-template",
      plugins: [GoTemplatePlugin],
    });
  } catch (e) {
    if (e instanceof Error && [""].includes(e.message)) {
      // known error, we don't throw
    } else {
      throw e;
    }
  }
};
