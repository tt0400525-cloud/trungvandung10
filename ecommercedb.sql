-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 09, 2026 lúc 03:09 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ecommercedb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'Laptop'),
(2, 'Phone'),
(3, 'Tablet'),
(4, 'Headphone'),
(5, 'Mouse'),
(6, 'Keyboard'),
(7, 'Monitor'),
(8, 'Camera'),
(9, 'Speaker'),
(10, 'Watch');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fullname` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`customer_id`, `user_id`, `fullname`, `phone`, `address`) VALUES
(1, 2, 'Nguyen Van A', '0901234567', 'Hanoi'),
(2, 3, 'Tran Thi B', '0907654321', 'HCM'),
(3, 4, 'Le Van C', '0912345678', 'Da Nang'),
(4, 5, 'Pham Minh D', '0922345678', 'Can Tho'),
(5, 6, 'Hoang Thi E', '0932345678', 'Hue'),
(6, 7, 'Vu Van F', '0942345678', 'Hai Phong'),
(7, 8, 'Do Thi G', '0952345678', 'Nam Dinh'),
(8, 9, 'Bui Van H', '0962345678', 'Nghe An'),
(9, 10, 'Ly Thi I', '0972345678', 'Quang Ninh'),
(10, 1, 'Admin Shop', '0999999999', 'Hanoi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetails`
--

CREATE TABLE `orderdetails` (
  `detail_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price_at_purchase` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orderdetails`
--

INSERT INTO `orderdetails` (`detail_id`, `order_id`, `product_id`, `quantity`, `price_at_purchase`) VALUES
(1, 1, 1, 1, 30000000.00),
(2, 2, 3, 1, 22000000.00),
(3, 4, 1, 1, 30000000.00),
(4, 4, 3, 1, 20000000.00),
(5, 5, 5, 1, 18000000.00),
(6, 6, 7, 1, 2500000.00),
(7, 7, 8, 1, 1800000.00),
(8, 8, 9, 1, 12000000.00),
(9, 9, 10, 1, 9000000.00),
(10, 10, 4, 1, 21000000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','confirmed','shipping','delivered','cancelled') DEFAULT 'pending',
  `total_amount` decimal(15,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `status`, `total_amount`) VALUES
(1, 1, '2025-03-10 03:00:00', 'delivered', 30000000.00),
(2, 2, '2025-03-15 07:00:00', 'delivered', 22000000.00),
(4, 1, '2025-03-25 09:00:00', 'delivered', 50000000.00),
(5, 4, '2025-04-01 01:00:00', 'confirmed', 18000000.00),
(6, 5, '2025-04-02 04:00:00', 'shipping', 2500000.00),
(7, 6, '2025-04-03 08:00:00', 'delivered', 1800000.00),
(8, 7, '2025-04-04 05:00:00', 'pending', 12000000.00),
(9, 8, '2025-04-05 03:00:00', 'delivered', 9000000.00),
(10, 9, '2025-04-06 07:00:00', 'delivered', 21000000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_name` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(15,2) NOT NULL,
  `stock_quantity` int(11) DEFAULT 0,
  `image_url` varchar(255) DEFAULT NULL,
  `status` enum('show','hide') DEFAULT 'show'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `product_name`, `description`, `price`, `stock_quantity`, `image_url`, `status`) VALUES
(1, 1, 'Macbook M2', NULL, 30000000.00, 4, NULL, 'show'),
(2, 1, 'Dell XPS 13', NULL, 25000000.00, 12, NULL, 'show'),
(3, 2, 'iPhone 15', NULL, 22000000.00, 20, NULL, 'show'),
(4, 2, 'Samsung S24', NULL, 21000000.00, 8, NULL, 'show'),
(5, 3, 'iPad Pro', NULL, 18000000.00, 15, NULL, 'show'),
(6, 4, 'Airpods Pro', NULL, 5000000.00, 30, NULL, 'show'),
(7, 5, 'Logitech MX Master 3', NULL, 2500000.00, 7, NULL, 'show'),
(8, 6, 'Keychron K2', NULL, 1800000.00, 4, NULL, 'show'),
(9, 7, 'LG UltraFine 4K', NULL, 12000000.00, 3, NULL, 'show'),
(10, 10, 'Apple Watch S9', NULL, 9000000.00, 10, NULL, 'show');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','customer') DEFAULT 'customer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'admin1', 'admin@shop.com', '123', 'admin', '2026-04-09 01:06:00'),
(2, 'user1', 'customer1@gmail.com', '123', 'customer', '2026-04-09 01:06:00'),
(3, 'user2', 'customer2@gmail.com', '123', 'customer', '2026-04-09 01:06:00'),
(4, 'user3', 'customer3@gmail.com', '123', 'customer', '2026-04-09 01:06:00'),
(5, 'user4', 'customer4@gmail.com', '123', 'customer', '2026-04-09 01:06:00'),
(6, 'user5', 'customer5@gmail.com', '123', 'customer', '2026-04-09 01:06:00'),
(7, 'user6', 'customer6@gmail.com', '123', 'customer', '2026-04-09 01:06:00'),
(8, 'user7', 'customer7@gmail.com', '123', 'customer', '2026-04-09 01:06:00'),
(9, 'user8', 'customer8@gmail.com', '123', 'customer', '2026-04-09 01:06:00'),
(10, 'user9', 'customer9@gmail.com', '123', 'customer', '2026-04-09 01:06:00');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
