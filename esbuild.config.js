// esbuild.config.js
require('esbuild').build({
    entryPoints: ['app/javascript/application.js'], // seu ponto de entrada principal
    bundle: true,
    outdir: 'app/assets/builds', // diretório de saída para os arquivos compilados
    sourcemap: true,
    minify: false, // defina como true em produção
    watch: process.argv.includes('--watch'),
  }).catch(() => process.exit(1));