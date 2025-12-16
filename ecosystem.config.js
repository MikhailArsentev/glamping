module.exports = {
  apps: [
    {
      name: 'glamping',
      port: 3000,
      exec_mode: 'cluster',
      instances: 'max',
      script: './.output/server/index.mjs',
      env_production: {
        NODE_ENV: 'production',
        PORT: 3000,
        HOST: '0.0.0.0'
      },
      error_file: './logs/err.log',
      out_file: './logs/out.log',
      log_file: './logs/combined.log',
      time: true,
      max_memory_restart: '1G',
      autorestart: true,
      watch: false,
      merge_logs: true,
      kill_timeout: 5000
    }
  ]
}

