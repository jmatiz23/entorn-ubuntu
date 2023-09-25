import os

username = os.getenv('USER')

home = f"/home/{username}"
workspaces = f"/home/{username}/workspaces"

c.ServerApp.token = ""

c.ServerApp.password = ""

jettyport = os.getenv('jettyport')
if not jettyport:
  jettyport = 8009

jenkinsport = os.getenv('jenkinsport')
if not jenkinsport:
  jenkinsport = 8011

portainerport = os.getenv('portainerport')
if not portainerport:
  portainerport = 9000

sonarport = os.getenv('sonarport')
if not sonarport:
  sonarport = 9090

c.ServerProxy.servers = {
    'code': {
      'command': ['/usr/bin/code-server', '--user-data-dir', '.config/Code/', '--extensions-dir', '.vscode/extensions/', '--bind-addr', '0.0.0.0:{port}', '--auth',  'none', '--disable-telemetry', '--disable-update-check', workspaces],
      'environment': {},
      'absolute_url': False,
      'timeout': 60,
      'launcher_entry': {
              'title': 'VS Code',
              'icon_path': '/resources/icons/vscode.svg'
      }
    },
    'jetty': {
      'command': [f'{home}/.local/bin/jetty-start','{port}'],
      'port': int(f'{jettyport}'),
      'timeout': 120,
      'launcher_entry': {
              'enabled': True,
              'icon_path': '/resources/icons/jetty.svg',
              'title': 'Jetty',
      },
    },   
    'pgadmin': {
      'command': [f'{home}/.local/bin/pg-start','{port}'],
      'timeout': 180,
      'port': 5050,
      'absolute_url': False,
      'launcher_entry': {
              'title': 'Pgadmin',
              'icon_path': '/resources/icons/postgres.svg'
      }
    },
}
