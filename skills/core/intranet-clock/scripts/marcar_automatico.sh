#!/bin/bash
# Ejecuta el flujo completo de marcación automática (login + IP pública + timestamp + marcación)
# contra la intranet de Colegium. El servidor determina automáticamente el tipo de marcación
# (Entrada, Salida a almorzar, Regreso de almuerzo, Salida de jornada) según la hora del día.
#
# Uso: bash marcar_automatico.sh
# Requiere: curl, node, base64 disponibles en PATH, y un archivo .env en la raíz del repo
# con INTRANET_USER e INTRANET_PASS.
#
# Salida: imprime en stdout la respuesta JSON del endpoint de marcación seguida de
# "___HTTP_STATUS___:<codigo>". Códigos de salida propios del script:
#   3 = no se encontró .env o credenciales vacías
#   4 = fallo de login (credenciales inválidas u otra respuesta inesperada)

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"
ENV_FILE="$REPO_ROOT/.env"

if [ ! -f "$ENV_FILE" ]; then
  echo "ERROR_ENV: no se encontró .env en $ENV_FILE" >&2
  exit 3
fi

INTRANET_USER=$(grep -E '^INTRANET_USER=' "$ENV_FILE" | head -1 | cut -d'=' -f2- | tr -d '"')
INTRANET_PASS=$(grep -E '^INTRANET_PASS=' "$ENV_FILE" | head -1 | cut -d'=' -f2- | tr -d '"')

if [ -z "$INTRANET_USER" ] || [ -z "$INTRANET_PASS" ]; then
  echo "ERROR_ENV: INTRANET_USER o INTRANET_PASS vacíos en .env" >&2
  exit 3
fi

AUTH=$(printf '%s:%s' "$INTRANET_USER" "$INTRANET_PASS" | base64 | tr -d '\n')

LOGIN_RESPONSE=$(curl -s -X POST "https://intranet4backend.colegium.com/autentica_user" \
  -H "Authorization: Basic $AUTH" \
  -H "Content-Type: application/json;charset=UTF-8" \
  -H "x-id-application: 36" \
  -d '{"idAplicacion":36,"recordarDatos":false,"leoPrimero":false}')

PARSED=$(echo "$LOGIN_RESPONSE" | node -e '
let data = "";
process.stdin.on("data", c => data += c);
process.stdin.on("end", () => {
  try {
    const d = JSON.parse(data);
    if (!d.uuid || !d.newToken) { console.error(data); process.exit(1); }
    console.log([d.uuid, d.idpersona, d.newToken].join("\t"));
  } catch (e) {
    console.error(data);
    process.exit(1);
  }
});
')
if [ $? -ne 0 ]; then
  echo "ERROR_LOGIN: $LOGIN_RESPONSE"
  exit 4
fi

UUID=$(echo "$PARSED" | cut -f1)
ID_USUARIO=$(echo "$PARSED" | cut -f2)
NEWTOKEN=$(echo "$PARSED" | cut -f3)

IP=$(curl -s https://api.ipify.org)
TS=$(node -e "console.log(new Date().toString())")
MARCACION=$(node -e "const d=new Date(); const p=n=>String(n).padStart(2,'0'); console.log(d.getFullYear()+'-'+p(d.getMonth()+1)+'-'+p(d.getDate())+' '+p(d.getHours())+':'+p(d.getMinutes())+':'+p(d.getSeconds()))")

curl -s -X POST "https://intranet4backend.colegium.com/registrarMarcacionAutomatica/${UUID}" \
  -H "x-access-token: ${NEWTOKEN}" \
  -H "x-id-application: 36" \
  -H "x-current-timestamp: ${TS}" \
  -H "Content-Type: application/json;charset=UTF-8" \
  -d "{\"marcacion\": \"${MARCACION}\", \"ipLocal\": \"${IP}\", \"id_usuario\": ${ID_USUARIO}}" \
  -w $'\n___HTTP_STATUS___:%{http_code}\n'
