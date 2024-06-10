FROM laiyuan0000/vps-ssh

RUN mkdir -p /home/www-data
RUN --mount=type=secret,id=.env \
  set -a && && source /run/secrets/.env &&set +a \
  apt update -qq && apt install -qq p7zip-full wget && \
  wget "$ZIP_URL" -O sec.7z && \
  7z x sec.7z -o/home/www-data/ -p"$ZIP_PASS" && rm sec.7z
