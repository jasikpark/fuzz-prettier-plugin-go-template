module.exports.fuzz = function fuzz(buf) {
  const prettier = require("prettier");
  const GoTemplatePlugin = require("prettier-plugin-go-template");
  try {
    const input = String.fromCodePoint(...buf);

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
