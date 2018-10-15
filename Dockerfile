FROM python:3.7

WORKDIR /usr/src/app
#COPY ./clipboard_common_lib ./clipboard_common_lib
#COPY ./clipboard_site ./clipboard_site
#RUN chmod +x ./clipboard_common_lib/install-common-libs.sh
#RUN ["bash", "./clipboard_common_lib/install-common-libs.sh"]

#WORKDIR /usr/src/app/clipboard_site
#RUN pip3 install -r requirements.txt
#RUN chmod +x startup.sh
#ENTRYPOINT ["sh", "startup.sh"]

# Node
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs && node --version

COPY . .
RUN npm install
RUN npm run build
EXPOSE 3000
CMD ["npm", "start"]