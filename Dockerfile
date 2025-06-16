# 1. Base image để build frontend
FROM node:18.20.2-alpine AS builder

# 2. Tạo thư mục app và copy mã nguồn vào
WORKDIR /app
COPY . .

# 3. Cài đặt và build frontend
RUN npm install
RUN npm run build

# 4. Dùng image nginx để serve web tĩnh
FROM nginx:alpine

# 5. Xóa default nginx config nếu cần
RUN rm -rf /usr/share/nginx/html/*

# 6. Copy build thành quả vào nginx
COPY --from=builder /app/dist /usr/share/nginx/html
# Nếu là React:
# COPY --from=builder /app/build /usr/share/nginx/html

# 7. Expose cổng 80
EXPOSE 80

# 8. Khởi chạy nginx
CMD ["nginx", "-g", "daemon off;"]
