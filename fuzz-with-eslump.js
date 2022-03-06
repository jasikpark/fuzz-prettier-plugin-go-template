"use strict";

const prettier = require("prettier");
const testGenerator = require("./generator");
const random = require("eslump/src/random");
const { GoTemplatePlugin } = require("prettier-plugin-go-template");

function generate(code, { options }) {
  return prettier.format(code, {
    parser: "go-template",
    plugins: [GoTemplatePlugin],
    ...options,
  });
}

function generateRandomOptions({ sourceType }) {
  return {};
  //   return {
  //     arrowParens: random.item(["avoid", "always"]),
  //     bracketSpacing: random.bool(),
  //     endOfLine: random.item(["auto", "lf", "crlf", "cr"]),
  //     htmlWhitespaceSensitivity: random.item(["css", "strict", "ignore"]),
  //     jsxBracketSameLine: random.bool(),
  //     jsxSingleQuote: random.bool(),
  //     printWidth: random.int(200),
  //     proseWrap: random.item(["always", "never", "preserve"]),
  //     semi: random.bool(),
  //     singleQuote: random.bool(),
  //     tabWidth: random.int(12),
  //     trailingComma: random.item(["none", "es5", "all"]),
  //     useTabs: random.bool(),
  //     goTemplateBracketSpacing: random.bool(),
  //   };
  // }
}

module.exports = testGenerator(generate, generateRandomOptions);
