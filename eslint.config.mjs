// eslint.config.mjs
import globals from "globals";
import js from "@eslint/js";
import jest from "eslint-plugin-jest";

export default [
  // Configuração para arquivos JavaScript gerais
  {
    files: ["**/*.js"],
    languageOptions: {
      globals: {
        ...globals.node,
      },
    },
    rules: {
      ...js.configs.recommended.rules,
    },
  },
  // Configuração específica para arquivos de teste
  {
    ...jest.configs['flat/recommended'],
    files: ["**/__tests__/**/*.js", "**/*.test.js"],
    rules: {
      ...jest.configs['flat/recommended'].rules,
    }
  }
];