#   ----------build Stage----------------------
FROM node:18-alpine as builder
WORKDIR /app
COPY package* ./
RUN npm install
COPY . .
RUN npm run build
#   ----------Run Stage----------------------
FROM node:18-alpine
WORKDIR /app

# ✅ Copy only required files
COPY --from=builder /app .
ENTRYPOINT ["npm", "start"]





