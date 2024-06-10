FROM laiyuan0000/vps-ssh

RUN mkdir -p /home/www-data
RUN --mount=type=secret,id=ZIP_URL --mount=type=secret,id=ZIP_PASS \
  apt update -qq && apt install -qq p7zip-full wget && \
  ZIP_URL="$(cat /run/secrets/ZIP_URL)" wget "$ZIP_URL" -O sec.7z && \
  ZIP_PASS="$(cat /run/secrets/ZIP_PASS)" 7z x sec.7z -o/home/www-data/ -p"$ZIP_PASS" && rm sec.7z
