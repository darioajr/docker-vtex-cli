FROM node:lts

COPY vtex_login.sh /root/vtex_login.sh

RUN chmod +x /root/vtex_login.sh

RUN ln -s /root/vtex_login.sh /bin/vtex_login

RUN apt update

RUN apt install -y jq

RUN yarn global add vtex