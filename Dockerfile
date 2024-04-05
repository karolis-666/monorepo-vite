FROM node:21.7.2 as deps
ARG BUILD_CONTEXT
WORKDIR /base
COPY package.json ./
COPY yarn.lock ./
COPY ./app-admin/package.json /app-admin/
RUN yarn install --immutable

FROM node:21.7.2 as builder
WORKDIR /base
COPY --from=deps /base/node_modules ./node_modules
COPY . .
RUN ls
RUN echo "Contents of package.json:" && cat /base/package.json
RUN yarn admin:build
# RUN yarn workspace app-admin build (FOR SOME REASON LIKE THIS DOES NOT WORK EVEN, BUT COMMAND IS THE SAME)

CMD ["yarn", "test"]