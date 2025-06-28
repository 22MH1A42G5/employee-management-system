# Use ECR Public Node.js base image
FROM public.ecr.aws/docker/library/node:18

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 80

CMD ["npx", "serve", "-s", "build"]