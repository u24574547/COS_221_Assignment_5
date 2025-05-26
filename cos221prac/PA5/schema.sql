-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 26, 2025 at 06:42 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schema`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `user_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `num_purchases` int(11) NOT NULL DEFAULT 0 COMMENT 'setup some sort of loyalty system? e.g. 2% discount after x amount of purchases\nor just for query purposes',
  `total_spent` double NOT NULL DEFAULT 0 COMMENT 'same story ish'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`user_id`, `customer_id`, `num_purchases`, `total_spent`) VALUES
(3, 3, 0, 0),
(4, 4, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `listing`
--

CREATE TABLE `listing` (
  `listing_id` int(11) NOT NULL,
  `price` double NOT NULL,
  `currency` char(3) NOT NULL,
  `in_stock` tinyint(4) NOT NULL COMMENT 'boolean, mysql converts it to tinyint',
  `last_updated` datetime NOT NULL,
  `product_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `listing`
--

INSERT INTO `listing` (`listing_id`, `price`, `currency`, `in_stock`, `last_updated`, `product_id`, `vendor_id`) VALUES
(1, 8.61, 'USD', 1, '2025-05-24 10:32:25', 1, 11),
(2, 28.45, 'USD', 1, '2025-05-24 10:32:25', 1, 19),
(3, 8.9, 'USD', 1, '2025-05-24 10:32:25', 2, 19),
(4, 27.76, 'USD', 1, '2025-05-24 10:32:25', 2, 1),
(5, 9.53, 'USD', 1, '2025-05-24 10:32:25', 3, 20),
(6, 21.51, 'USD', 1, '2025-05-24 10:32:25', 3, 2),
(7, 13.66, 'USD', 1, '2025-05-24 10:32:25', 4, 18),
(8, 6.96, 'USD', 1, '2025-05-24 10:32:25', 4, 21),
(9, 13.8, 'USD', 1, '2025-05-24 10:32:25', 4, 20),
(10, 18.13, 'USD', 1, '2025-05-24 10:32:25', 4, 19),
(11, 29.19, 'USD', 1, '2025-05-24 10:32:25', 5, 21),
(12, 25.68, 'USD', 1, '2025-05-24 10:32:25', 5, 20),
(13, 10.86, 'USD', 1, '2025-05-24 10:32:25', 5, 19),
(14, 1984.09, 'USD', 1, '2025-05-24 10:32:25', 11, 3),
(15, 1168.07, 'USD', 1, '2025-05-24 10:32:25', 12, 3),
(16, 474.95, 'USD', 1, '2025-05-24 10:32:25', 13, 3),
(17, 1258.35, 'USD', 1, '2025-05-24 10:32:25', 14, 3),
(18, 944.08, 'USD', 1, '2025-05-24 10:32:25', 15, 3),
(19, 16.41, 'USD', 1, '2025-05-24 10:32:25', 16, 1),
(20, 14.21, 'USD', 1, '2025-05-24 10:32:25', 16, 3),
(21, 1.8, 'USD', 1, '2025-05-24 10:32:25', 16, 4),
(22, 3.38, 'USD', 1, '2025-05-24 10:32:25', 16, 12),
(23, 4.83, 'USD', 1, '2025-05-24 10:32:25', 17, 17),
(24, 5.83, 'USD', 1, '2025-05-24 10:32:25', 17, 3),
(25, 13.65, 'USD', 1, '2025-05-24 10:32:25', 17, 1),
(26, 18.17, 'USD', 1, '2025-05-24 10:32:25', 18, 17),
(27, 14.8, 'USD', 1, '2025-05-24 10:32:25', 18, 12),
(28, 18.49, 'USD', 1, '2025-05-24 10:32:25', 18, 3),
(29, 11.25, 'USD', 1, '2025-05-24 10:32:25', 19, 11),
(30, 13.81, 'USD', 1, '2025-05-24 10:32:25', 19, 1),
(31, 15.3, 'USD', 1, '2025-05-24 10:32:25', 19, 12),
(32, 4.46, 'USD', 1, '2025-05-24 10:32:25', 20, 3),
(33, 10.23, 'USD', 1, '2025-05-24 10:32:25', 20, 12),
(34, 17.75, 'USD', 1, '2025-05-24 10:32:25', 20, 1),
(35, 19.08, 'USD', 1, '2025-05-24 10:32:25', 20, 11),
(36, 14.99, 'USD', 1, '2025-05-24 10:32:25', 21, 3),
(37, 9.14, 'USD', 1, '2025-05-24 10:32:25', 21, 17),
(38, 14.59, 'USD', 1, '2025-05-24 10:32:25', 22, 3),
(39, 12.13, 'USD', 1, '2025-05-24 10:32:25', 22, 18),
(40, 15.87, 'USD', 1, '2025-05-24 10:32:25', 22, 4),
(41, 3.97, 'USD', 1, '2025-05-24 10:32:25', 22, 1),
(42, 14.02, 'USD', 1, '2025-05-24 10:32:25', 23, 3),
(43, 7.28, 'USD', 1, '2025-05-24 10:32:25', 23, 18),
(44, 12.35, 'USD', 1, '2025-05-24 10:32:25', 23, 11),
(45, 15.88, 'USD', 1, '2025-05-24 10:32:25', 24, 12),
(46, 10.78, 'USD', 1, '2025-05-24 10:32:25', 24, 4),
(47, 5.27, 'USD', 1, '2025-05-24 10:32:25', 24, 1),
(48, 11.99, 'USD', 1, '2025-05-24 10:32:25', 24, 18),
(49, 12.5, 'USD', 1, '2025-05-24 10:32:25', 25, 3),
(50, 8.04, 'USD', 1, '2025-05-24 10:32:25', 25, 1),
(51, 18.4, 'USD', 1, '2025-05-24 10:32:25', 26, 1),
(52, 14.28, 'USD', 1, '2025-05-24 10:32:25', 26, 4),
(53, 14.24, 'USD', 1, '2025-05-24 10:32:25', 27, 18),
(54, 18.63, 'USD', 1, '2025-05-24 10:32:25', 27, 11),
(55, 11.41, 'USD', 1, '2025-05-24 10:32:25', 27, 1),
(56, 19.18, 'USD', 1, '2025-05-24 10:32:25', 27, 17),
(57, 5.92, 'USD', 1, '2025-05-24 10:32:25', 28, 4),
(58, 12.05, 'USD', 1, '2025-05-24 10:32:25', 28, 11),
(59, 12.08, 'USD', 1, '2025-05-24 10:32:25', 29, 12),
(60, 5.29, 'USD', 1, '2025-05-24 10:32:25', 29, 11),
(61, 6.33, 'USD', 1, '2025-05-24 10:32:25', 30, 1),
(62, 10.36, 'USD', 1, '2025-05-24 10:32:25', 30, 4),
(63, 12.82, 'USD', 1, '2025-05-24 10:32:25', 30, 11),
(64, 15.57, 'USD', 1, '2025-05-24 10:32:25', 31, 12),
(65, 13.79, 'USD', 1, '2025-05-24 10:32:25', 31, 1),
(66, 2.28, 'USD', 1, '2025-05-24 10:32:25', 31, 3),
(67, 5.21, 'USD', 1, '2025-05-24 10:32:25', 32, 11),
(68, 5.88, 'USD', 1, '2025-05-24 10:32:25', 32, 1),
(69, 4.27, 'USD', 1, '2025-05-24 10:32:25', 33, 12),
(70, 11.73, 'USD', 1, '2025-05-24 10:32:25', 33, 18),
(71, 6.83, 'USD', 1, '2025-05-24 10:32:25', 33, 1),
(72, 8.55, 'USD', 1, '2025-05-24 10:32:25', 34, 17),
(73, 15.76, 'USD', 1, '2025-05-24 10:32:25', 34, 12),
(74, 14.11, 'USD', 1, '2025-05-24 10:32:25', 34, 1),
(75, 3.3, 'USD', 1, '2025-05-24 10:32:25', 34, 18),
(76, 10.28, 'USD', 1, '2025-05-24 10:32:25', 35, 11),
(77, 18.22, 'USD', 1, '2025-05-24 10:32:25', 35, 18),
(78, 2.27, 'USD', 1, '2025-05-24 10:32:25', 35, 1),
(79, 15.17, 'USD', 1, '2025-05-24 10:32:25', 36, 4),
(80, 2.08, 'USD', 1, '2025-05-24 10:32:25', 36, 17),
(81, 1.9, 'USD', 1, '2025-05-24 10:32:25', 36, 18),
(82, 16.86, 'USD', 1, '2025-05-24 10:32:25', 37, 17),
(83, 15.7, 'USD', 1, '2025-05-24 10:32:25', 37, 4),
(84, 15.7, 'USD', 1, '2025-05-24 10:32:25', 38, 18),
(85, 15.82, 'USD', 1, '2025-05-24 10:32:25', 38, 17),
(86, 11.99, 'USD', 1, '2025-05-24 10:32:25', 38, 3),
(87, 7.89, 'USD', 1, '2025-05-24 10:32:25', 39, 1),
(88, 19.98, 'USD', 1, '2025-05-24 10:32:25', 39, 17),
(89, 18.21, 'USD', 1, '2025-05-24 10:32:25', 39, 4),
(90, 3.87, 'USD', 1, '2025-05-24 10:32:25', 40, 3),
(91, 4.84, 'USD', 1, '2025-05-24 10:32:25', 40, 11),
(92, 11.58, 'USD', 1, '2025-05-24 10:32:25', 40, 12),
(93, 15.83, 'USD', 1, '2025-05-24 10:32:25', 41, 17),
(94, 1.32, 'USD', 1, '2025-05-24 10:32:25', 41, 11),
(95, 6.09, 'USD', 1, '2025-05-24 10:32:25', 42, 3),
(96, 4.24, 'USD', 1, '2025-05-24 10:32:25', 42, 11),
(97, 1.92, 'USD', 1, '2025-05-24 10:32:25', 42, 4),
(98, 14.91, 'USD', 1, '2025-05-24 10:32:25', 42, 18);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `brand` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  `name` varchar(45) NOT NULL,
  `category` varchar(45) DEFAULT NULL,
  `images` text NOT NULL DEFAULT '[]' COMMENT 'array of images potentially maybe?',
  `Num_Products` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `brand`, `description`, `name`, `category`, `images`, `Num_Products`) VALUES
(1, 'Essence', 'The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.', 'Essence Mascara Lash Princess', 'beauty', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/beauty\\/essence-mascara-lash-princess\\/1.webp\"]', 99),
(2, 'Glamour Beauty', 'The Eyeshadow Palette with Mirror offers a versatile range of eyeshadow shades for creating stunning eye looks. With a built-in mirror, it\'s convenient for on-the-go makeup application.', 'Eyeshadow Palette with Mirror', 'beauty', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/beauty\\/eyeshadow-palette-with-mirror\\/1.webp\"]', 34),
(3, 'Velvet Touch', 'The Powder Canister is a finely milled setting powder designed to set makeup and control shine. With a lightweight and translucent formula, it provides a smooth and matte finish.', 'Powder Canister', 'beauty', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/beauty\\/powder-canister\\/1.webp\"]', 89),
(4, 'Chic Cosmetics', 'The Red Lipstick is a classic and bold choice for adding a pop of color to your lips. With a creamy and pigmented formula, it provides a vibrant and long-lasting finish.', 'Red Lipstick', 'beauty', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/beauty\\/red-lipstick\\/1.webp\"]', 91),
(5, 'Nail Couture', 'The Red Nail Polish offers a rich and glossy red hue for vibrant and polished nails. With a quick-drying formula, it provides a salon-quality finish at home.', 'Red Nail Polish', 'beauty', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/beauty\\/red-nail-polish\\/1.webp\"]', 79),
(6, 'Calvin Klein', 'CK One by Calvin Klein is a classic unisex fragrance, known for its fresh and clean scent. It\'s a versatile fragrance suitable for everyday wear.', 'Calvin Klein CK One', 'fragrances', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/fragrances\\/calvin-klein-ck-one\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/fragrances\\/calvin-klein-ck-one\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/fragrances\\/calvin-klein-ck-one\\/3.webp\"]', 29),
(7, 'Chanel', 'Coco Noir by Chanel is an elegant and mysterious fragrance, featuring notes of grapefruit, rose, and sandalwood. Perfect for evening occasions.', 'Chanel Coco Noir Eau De', 'fragrances', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/fragrances\\/chanel-coco-noir-eau-de\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/fragrances\\/chanel-coco-noir-eau-de\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/fragrances\\/chanel-coco-noir-eau-de\\/3.webp\"]', 58),
(8, 'Dior', 'J\'adore by Dior is a luxurious and floral fragrance, known for its blend of ylang-ylang, rose, and jasmine. It embodies femininity and sophistication.', 'Dior J\'adore', 'fragrances', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/fragrances\\/dior-j\'adore\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/fragrances\\/dior-j\'adore\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/fragrances\\/dior-j\'adore\\/3.webp\"]', 98),
(9, 'Dolce & Gabbana', 'Dolce Shine by Dolce & Gabbana is a vibrant and fruity fragrance, featuring notes of mango, jasmine, and blonde woods. It\'s a joyful and youthful scent.', 'Dolce Shine Eau de', 'fragrances', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/fragrances\\/dolce-shine-eau-de\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/fragrances\\/dolce-shine-eau-de\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/fragrances\\/dolce-shine-eau-de\\/3.webp\"]', 4),
(10, 'Gucci', 'Gucci Bloom by Gucci is a floral and captivating fragrance, with notes of tuberose, jasmine, and Rangoon creeper. It\'s a modern and romantic scent.', 'Gucci Bloom Eau de', 'fragrances', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/fragrances\\/gucci-bloom-eau-de\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/fragrances\\/gucci-bloom-eau-de\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/fragrances\\/gucci-bloom-eau-de\\/3.webp\"]', 91),
(11, 'Annibale Colombo', 'The Annibale Colombo Bed is a luxurious and elegant bed frame, crafted with high-quality materials for a comfortable and stylish bedroom.', 'Annibale Colombo Bed', 'furniture', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/furniture\\/annibale-colombo-bed\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/furniture\\/annibale-colombo-bed\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/furniture\\/annibale-colombo-bed\\/3.webp\"]', 88),
(12, 'Annibale Colombo', 'The Annibale Colombo Sofa is a sophisticated and comfortable seating option, featuring exquisite design and premium upholstery for your living room.', 'Annibale Colombo Sofa', 'furniture', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/furniture\\/annibale-colombo-sofa\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/furniture\\/annibale-colombo-sofa\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/furniture\\/annibale-colombo-sofa\\/3.webp\"]', 60),
(13, 'Furniture Co.', 'The Bedside Table in African Cherry is a stylish and functional addition to your bedroom, providing convenient storage space and a touch of elegance.', 'Bedside Table African Cherry', 'furniture', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/furniture\\/bedside-table-african-cherry\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/furniture\\/bedside-table-african-cherry\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/furniture\\/bedside-table-african-cherry\\/3.webp\"]', 64),
(14, 'Knoll', 'The Knoll Saarinen Executive Conference Chair is a modern and ergonomic chair, perfect for your office or conference room with its timeless design.', 'Knoll Saarinen Executive Conference Chair', 'furniture', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/furniture\\/knoll-saarinen-executive-conference-chair\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/furniture\\/knoll-saarinen-executive-conference-chair\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/furniture\\/knoll-saarinen-executive-conference-chair\\/3.webp\"]', 26),
(15, 'Bath Trends', 'The Wooden Bathroom Sink with Mirror is a unique and stylish addition to your bathroom, featuring a wooden sink countertop and a matching mirror.', 'Wooden Bathroom Sink With Mirror', 'furniture', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/furniture\\/wooden-bathroom-sink-with-mirror\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/furniture\\/wooden-bathroom-sink-with-mirror\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/furniture\\/wooden-bathroom-sink-with-mirror\\/3.webp\"]', 7),
(16, '', 'Fresh and crisp apples, perfect for snacking or incorporating into various recipes.', 'Apple', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/apple\\/1.webp\"]', 8),
(17, '', 'High-quality beef steak, great for grilling or cooking to your preferred level of doneness.', 'Beef Steak', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/beef-steak\\/1.webp\"]', 86),
(18, '', 'Nutritious cat food formulated to meet the dietary needs of your feline friend.', 'Cat Food', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/cat-food\\/1.webp\"]', 46),
(19, '', 'Fresh and tender chicken meat, suitable for various culinary preparations.', 'Chicken Meat', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/chicken-meat\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/chicken-meat\\/2.webp\"]', 97),
(20, '', 'Versatile cooking oil suitable for frying, sautéing, and various culinary applications.', 'Cooking Oil', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/cooking-oil\\/1.webp\"]', 10),
(21, '', 'Crisp and hydrating cucumbers, ideal for salads, snacks, or as a refreshing side.', 'Cucumber', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/cucumber\\/1.webp\"]', 84),
(22, '', 'Specially formulated dog food designed to provide essential nutrients for your canine companion.', 'Dog Food', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/dog-food\\/1.webp\"]', 71),
(23, '', 'Fresh eggs, a versatile ingredient for baking, cooking, or breakfast.', 'Eggs', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/eggs\\/1.webp\"]', 9),
(24, '', 'Quality fish steak, suitable for grilling, baking, or pan-searing.', 'Fish Steak', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/fish-steak\\/1.webp\"]', 74),
(25, '', 'Fresh and vibrant green bell pepper, perfect for adding color and flavor to your dishes.', 'Green Bell Pepper', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/green-bell-pepper\\/1.webp\"]', 33),
(26, '', 'Spicy green chili pepper, ideal for adding heat to your favorite recipes.', 'Green Chili Pepper', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/green-chili-pepper\\/1.webp\"]', 3),
(27, '', 'Pure and natural honey in a convenient jar, perfect for sweetening beverages or drizzling over food.', 'Honey Jar', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/honey-jar\\/1.webp\"]', 34),
(28, '', 'Creamy and delicious ice cream, available in various flavors for a delightful treat.', 'Ice Cream', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/ice-cream\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/ice-cream\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/ice-cream\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/ice-cream\\/4.webp\"]', 27),
(29, '', 'Refreshing fruit juice, packed with vitamins and great for staying hydrated.', 'Juice', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/juice\\/1.webp\"]', 50),
(30, '', 'Nutrient-rich kiwi, perfect for snacking or adding a tropical twist to your dishes.', 'Kiwi', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/kiwi\\/1.webp\"]', 99),
(31, '', 'Zesty and tangy lemons, versatile for cooking, baking, or making refreshing beverages.', 'Lemon', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/lemon\\/1.webp\"]', 31),
(32, '', 'Fresh and nutritious milk, a staple for various recipes and daily consumption.', 'Milk', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/milk\\/1.webp\"]', 27),
(33, '', 'Sweet and juicy mulberries, perfect for snacking or adding to desserts and cereals.', 'Mulberry', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/mulberry\\/1.webp\"]', 99),
(34, '', 'Quality coffee from Nescafe, available in various blends for a rich and satisfying cup.', 'Nescafe Coffee', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/nescafe-coffee\\/1.webp\"]', 57),
(35, '', 'Versatile and starchy potatoes, great for roasting, mashing, or as a side dish.', 'Potatoes', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/potatoes\\/1.webp\"]', 13),
(36, '', 'Nutrient-packed protein powder, ideal for supplementing your diet with essential proteins.', 'Protein Powder', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/protein-powder\\/1.webp\"]', 80),
(37, '', 'Flavorful and aromatic red onions, perfect for adding depth to your savory dishes.', 'Red Onions', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/red-onions\\/1.webp\"]', 82),
(38, '', 'High-quality rice, a staple for various cuisines and a versatile base for many dishes.', 'Rice', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/rice\\/1.webp\"]', 59),
(39, '', 'Assorted soft drinks in various flavors, perfect for refreshing beverages.', 'Soft Drinks', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/soft-drinks\\/1.webp\"]', 53),
(40, '', 'Sweet and succulent strawberries, great for snacking, desserts, or blending into smoothies.', 'Strawberry', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/strawberry\\/1.webp\"]', 46),
(41, '', 'Convenient tissue paper box for everyday use, providing soft and absorbent tissues.', 'Tissue Paper Box', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/tissue-paper-box\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/tissue-paper-box\\/2.webp\"]', 86),
(42, '', 'Pure and refreshing bottled water, essential for staying hydrated throughout the day.', 'Water', 'groceries', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/groceries\\/water\\/1.webp\"]', 53),
(43, '', 'The Decoration Swing is a charming addition to your home decor. Crafted with intricate details, it adds a touch of elegance and whimsy to any room.', 'Decoration Swing', 'home-decoration', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/home-decoration\\/decoration-swing\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/home-decoration\\/decoration-swing\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/home-decoration\\/decoration-swing\\/3.webp\"]', 47),
(44, '', 'The Family Tree Photo Frame is a sentimental and stylish way to display your cherished family memories. With multiple photo slots, it tells the story of your loved ones.', 'Family Tree Photo Frame', 'home-decoration', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/home-decoration\\/family-tree-photo-frame\\/1.webp\"]', 77),
(45, '', 'The House Showpiece Plant is an artificial plant that brings a touch of nature to your home without the need for maintenance. It adds greenery and style to any space.', 'House Showpiece Plant', 'home-decoration', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/home-decoration\\/house-showpiece-plant\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/home-decoration\\/house-showpiece-plant\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/home-decoration\\/house-showpiece-plant\\/3.webp\"]', 28),
(46, '', 'The Plant Pot is a stylish container for your favorite plants. With a sleek design, it complements your indoor or outdoor garden, adding a modern touch to your plant display.', 'Plant Pot', 'home-decoration', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/home-decoration\\/plant-pot\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/home-decoration\\/plant-pot\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/home-decoration\\/plant-pot\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/home-decoration\\/plant-pot\\/4.webp\"]', 59),
(47, '', 'The Table Lamp is a functional and decorative lighting solution for your living space. With a modern design, it provides both ambient and task lighting, enhancing the atmosphere.', 'Table Lamp', 'home-decoration', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/home-decoration\\/table-lamp\\/1.webp\"]', 9),
(48, '', 'The Bamboo Spatula is a versatile kitchen tool made from eco-friendly bamboo. Ideal for flipping, stirring, and serving various dishes.', 'Bamboo Spatula', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/bamboo-spatula\\/1.webp\"]', 37),
(49, '', 'The Black Aluminium Cup is a stylish and durable cup suitable for both hot and cold beverages. Its sleek black design adds a modern touch to your drinkware collection.', 'Black Aluminium Cup', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/black-aluminium-cup\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/black-aluminium-cup\\/2.webp\"]', 75),
(50, '', 'The Black Whisk is a kitchen essential for whisking and beating ingredients. Its ergonomic handle and sleek design make it a practical and stylish tool.', 'Black Whisk', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/black-whisk\\/1.webp\"]', 73),
(51, '', 'The Boxed Blender is a powerful and compact blender perfect for smoothies, shakes, and more. Its convenient design and multiple functions make it a versatile kitchen appliance.', 'Boxed Blender', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/boxed-blender\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/boxed-blender\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/boxed-blender\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/boxed-blender\\/4.webp\"]', 9),
(52, '', 'The Carbon Steel Wok is a versatile cooking pan suitable for stir-frying, sautéing, and deep frying. Its sturdy construction ensures even heat distribution for delicious meals.', 'Carbon Steel Wok', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/carbon-steel-wok\\/1.webp\"]', 40),
(53, '', 'The Chopping Board is an essential kitchen accessory for food preparation. Made from durable material, it provides a safe and hygienic surface for cutting and chopping.', 'Chopping Board', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/chopping-board\\/1.webp\"]', 14),
(54, '', 'The Citrus Squeezer in Yellow is a handy tool for extracting juice from citrus fruits. Its vibrant color adds a cheerful touch to your kitchen gadgets.', 'Citrus Squeezer Yellow', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/citrus-squeezer-yellow\\/1.webp\"]', 22),
(55, '', 'The Egg Slicer is a convenient tool for slicing boiled eggs evenly. It\'s perfect for salads, sandwiches, and other dishes where sliced eggs are desired.', 'Egg Slicer', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/egg-slicer\\/1.webp\"]', 40),
(56, '', 'The Electric Stove provides a portable and efficient cooking solution. Ideal for small kitchens or as an additional cooking surface for various culinary needs.', 'Electric Stove', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/electric-stove\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/electric-stove\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/electric-stove\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/electric-stove\\/4.webp\"]', 21),
(57, '', 'The Fine Mesh Strainer is a versatile tool for straining liquids and sifting dry ingredients. Its fine mesh ensures efficient filtering for smooth cooking and baking.', 'Fine Mesh Strainer', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/fine-mesh-strainer\\/1.webp\"]', 85),
(58, '', 'The Fork is a classic utensil for various dining and serving purposes. Its durable and ergonomic design makes it a reliable choice for everyday use.', 'Fork', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/fork\\/1.webp\"]', 7),
(59, '', 'The Glass is a versatile and elegant drinking vessel suitable for a variety of beverages. Its clear design allows you to enjoy the colors and textures of your drinks.', 'Glass', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/glass\\/1.webp\"]', 46),
(60, '', 'The Grater in Black is a handy kitchen tool for grating cheese, vegetables, and more. Its sleek design and sharp blades make food preparation efficient and easy.', 'Grater Black', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/grater-black\\/1.webp\"]', 84),
(61, '', 'The Hand Blender is a versatile kitchen appliance for blending, pureeing, and mixing. Its compact design and powerful motor make it a convenient tool for various recipes.', 'Hand Blender', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/hand-blender\\/1.webp\"]', 84),
(62, '', 'The Ice Cube Tray is a practical accessory for making ice cubes in various shapes. Perfect for keeping your drinks cool and adding a fun element to your beverages.', 'Ice Cube Tray', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/ice-cube-tray\\/1.webp\"]', 13),
(63, '', 'The Kitchen Sieve is a versatile tool for sifting and straining dry and wet ingredients. Its fine mesh design ensures smooth results in your cooking and baking.', 'Kitchen Sieve', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/kitchen-sieve\\/1.webp\"]', 68),
(64, '', 'The Knife is an essential kitchen tool for chopping, slicing, and dicing. Its sharp blade and ergonomic handle make it a reliable choice for food preparation.', 'Knife', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/knife\\/1.webp\"]', 7),
(65, '', 'The Lunch Box is a convenient and portable container for packing and carrying your meals. With compartments for different foods, it\'s perfect for on-the-go dining.', 'Lunch Box', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/lunch-box\\/1.webp\"]', 94),
(66, '', 'The Microwave Oven is a versatile kitchen appliance for quick and efficient cooking, reheating, and defrosting. Its compact size makes it suitable for various kitchen setups.', 'Microwave Oven', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/microwave-oven\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/microwave-oven\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/microwave-oven\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/microwave-oven\\/4.webp\"]', 59),
(67, '', 'The Mug Tree Stand is a stylish and space-saving solution for organizing your mugs. Keep your favorite mugs easily accessible and neatly displayed in your kitchen.', 'Mug Tree Stand', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/mug-tree-stand\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/mug-tree-stand\\/2.webp\"]', 88),
(68, '', 'The Pan is a versatile and essential cookware item for frying, sautéing, and cooking various dishes. Its non-stick coating ensures easy food release and cleanup.', 'Pan', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/pan\\/1.webp\"]', 90),
(69, '', 'The Plate is a classic and essential dishware item for serving meals. Its durable and stylish design makes it suitable for everyday use or special occasions.', 'Plate', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/plate\\/1.webp\"]', 66),
(70, '', 'The Red Tongs are versatile kitchen tongs suitable for various cooking and serving tasks. Their vibrant color adds a pop of excitement to your kitchen utensils.', 'Red Tongs', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/red-tongs\\/1.webp\"]', 82),
(71, '', 'The Silver Pot with Glass Cap is a stylish and functional cookware item for boiling, simmering, and preparing delicious meals. Its glass cap allows you to monitor cooking progress.', 'Silver Pot With Glass Cap', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/silver-pot-with-glass-cap\\/1.webp\"]', 40),
(72, '', 'The Slotted Turner is a kitchen utensil designed for flipping and turning food items. Its slotted design allows excess liquid to drain, making it ideal for frying and sautéing.', 'Slotted Turner', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/slotted-turner\\/1.webp\"]', 88),
(73, '', 'The Spice Rack is a convenient organizer for your spices and seasonings. Keep your kitchen essentials within reach and neatly arranged with this stylish spice rack.', 'Spice Rack', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/spice-rack\\/1.webp\"]', 79),
(74, '', 'The Spoon is a versatile kitchen utensil for stirring, serving, and tasting. Its ergonomic design and durable construction make it an essential tool for every kitchen.', 'Spoon', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/spoon\\/1.webp\"]', 59),
(75, '', 'The Tray is a functional and decorative item for serving snacks, appetizers, or drinks. Its stylish design makes it a versatile accessory for entertaining guests.', 'Tray', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/tray\\/1.webp\"]', 71),
(76, '', 'The Wooden Rolling Pin is a classic kitchen tool for rolling out dough for baking. Its smooth surface and sturdy handles make it easy to achieve uniform thickness.', 'Wooden Rolling Pin', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/wooden-rolling-pin\\/1.webp\"]', 80),
(77, '', 'The Yellow Peeler is a handy tool for peeling fruits and vegetables with ease. Its bright yellow color adds a cheerful touch to your kitchen gadgets.', 'Yellow Peeler', 'kitchen-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/kitchen-accessories\\/yellow-peeler\\/1.webp\"]', 35),
(78, 'Apple', 'The MacBook Pro 14 Inch in Space Grey is a powerful and sleek laptop, featuring Apple\'s M1 Pro chip for exceptional performance and a stunning Retina display.', 'Apple MacBook Pro 14 Inch Space Grey', 'laptops', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/laptops\\/apple-macbook-pro-14-inch-space-grey\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/laptops\\/apple-macbook-pro-14-inch-space-grey\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/laptops\\/apple-macbook-pro-14-inch-space-grey\\/3.webp\"]', 24),
(79, 'Asus', 'The Asus Zenbook Pro Dual Screen Laptop is a high-performance device with dual screens, providing productivity and versatility for creative professionals.', 'Asus Zenbook Pro Dual Screen Laptop', 'laptops', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/laptops\\/asus-zenbook-pro-dual-screen-laptop\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/laptops\\/asus-zenbook-pro-dual-screen-laptop\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/laptops\\/asus-zenbook-pro-dual-screen-laptop\\/3.webp\"]', 45),
(80, 'Huawei', 'The Huawei Matebook X Pro is a slim and stylish laptop with a high-resolution touchscreen display, offering a premium experience for users on the go.', 'Huawei Matebook X Pro', 'laptops', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/laptops\\/huawei-matebook-x-pro\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/laptops\\/huawei-matebook-x-pro\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/laptops\\/huawei-matebook-x-pro\\/3.webp\"]', 75),
(81, 'Lenovo', 'The Lenovo Yoga 920 is a 2-in-1 convertible laptop with a flexible hinge, allowing you to use it as a laptop or tablet, offering versatility and portability.', 'Lenovo Yoga 920', 'laptops', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/laptops\\/lenovo-yoga-920\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/laptops\\/lenovo-yoga-920\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/laptops\\/lenovo-yoga-920\\/3.webp\"]', 40),
(82, 'Dell', 'The New DELL XPS 13 9300 Laptop is a compact and powerful device, featuring a virtually borderless InfinityEdge display and high-end performance for various tasks.', 'New DELL XPS 13 9300 Laptop', 'laptops', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/laptops\\/new-dell-xps-13-9300-laptop\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/laptops\\/new-dell-xps-13-9300-laptop\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/laptops\\/new-dell-xps-13-9300-laptop\\/3.webp\"]', 74),
(83, 'Fashion Trends', 'The Blue & Black Check Shirt is a stylish and comfortable men\'s shirt featuring a classic check pattern. Made from high-quality fabric, it\'s suitable for both casual and semi-formal occasions.', 'Blue & Black Check Shirt', 'mens-shirts', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shirts\\/blue-&-black-check-shirt\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shirts\\/blue-&-black-check-shirt\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shirts\\/blue-&-black-check-shirt\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shirts\\/blue-&-black-check-shirt\\/4.webp\"]', 38),
(84, 'Gigabyte', 'The Gigabyte Aorus Men Tshirt is a cool and casual shirt for gaming enthusiasts. With the Aorus logo and sleek design, it\'s perfect for expressing your gaming style.', 'Gigabyte Aorus Men Tshirt', 'mens-shirts', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shirts\\/gigabyte-aorus-men-tshirt\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shirts\\/gigabyte-aorus-men-tshirt\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shirts\\/gigabyte-aorus-men-tshirt\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shirts\\/gigabyte-aorus-men-tshirt\\/4.webp\"]', 90),
(85, 'Classic Wear', 'The Man Plaid Shirt is a timeless and versatile men\'s shirt with a classic plaid pattern. Its comfortable fit and casual style make it a wardrobe essential for various occasions.', 'Man Plaid Shirt', 'mens-shirts', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shirts\\/man-plaid-shirt\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shirts\\/man-plaid-shirt\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shirts\\/man-plaid-shirt\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shirts\\/man-plaid-shirt\\/4.webp\"]', 82),
(86, 'Casual Comfort', 'The Man Short Sleeve Shirt is a breezy and stylish option for warm days. With a comfortable fit and short sleeves, it\'s perfect for a laid-back yet polished look.', 'Man Short Sleeve Shirt', 'mens-shirts', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shirts\\/man-short-sleeve-shirt\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shirts\\/man-short-sleeve-shirt\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shirts\\/man-short-sleeve-shirt\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shirts\\/man-short-sleeve-shirt\\/4.webp\"]', 2),
(87, 'Urban Chic', 'The Men Check Shirt is a classic and versatile shirt featuring a stylish check pattern. Suitable for various occasions, it adds a smart and polished touch to your wardrobe.', 'Men Check Shirt', 'mens-shirts', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shirts\\/men-check-shirt\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shirts\\/men-check-shirt\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shirts\\/men-check-shirt\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shirts\\/men-check-shirt\\/4.webp\"]', 95),
(88, 'Nike', 'The Nike Air Jordan 1 in Red and Black is an iconic basketball sneaker known for its stylish design and high-performance features, making it a favorite among sneaker enthusiasts and athletes.', 'Nike Air Jordan 1 Red And Black', 'mens-shoes', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shoes\\/nike-air-jordan-1-red-and-black\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shoes\\/nike-air-jordan-1-red-and-black\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shoes\\/nike-air-jordan-1-red-and-black\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shoes\\/nike-air-jordan-1-red-and-black\\/4.webp\"]', 7),
(89, 'Nike', 'Nike Baseball Cleats are designed for maximum traction and performance on the baseball field. They provide stability and support for players during games and practices.', 'Nike Baseball Cleats', 'mens-shoes', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shoes\\/nike-baseball-cleats\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shoes\\/nike-baseball-cleats\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shoes\\/nike-baseball-cleats\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shoes\\/nike-baseball-cleats\\/4.webp\"]', 12),
(90, 'Puma', 'The Puma Future Rider Trainers offer a blend of retro style and modern comfort. Perfect for casual wear, these trainers provide a fashionable and comfortable option for everyday use.', 'Puma Future Rider Trainers', 'mens-shoes', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shoes\\/puma-future-rider-trainers\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shoes\\/puma-future-rider-trainers\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shoes\\/puma-future-rider-trainers\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shoes\\/puma-future-rider-trainers\\/4.webp\"]', 90),
(91, 'Off White', 'The Sports Sneakers in Off White and Red combine style and functionality, making them a fashionable choice for sports enthusiasts. The red and off-white color combination adds a bold and energetic touch.', 'Sports Sneakers Off White & Red', 'mens-shoes', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shoes\\/sports-sneakers-off-white-&-red\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shoes\\/sports-sneakers-off-white-&-red\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shoes\\/sports-sneakers-off-white-&-red\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shoes\\/sports-sneakers-off-white-&-red\\/4.webp\"]', 17),
(92, 'Off White', 'Another variant of the Sports Sneakers in Off White Red, featuring a unique design. These sneakers offer style and comfort for casual occasions.', 'Sports Sneakers Off White Red', 'mens-shoes', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shoes\\/sports-sneakers-off-white-red\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shoes\\/sports-sneakers-off-white-red\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shoes\\/sports-sneakers-off-white-red\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-shoes\\/sports-sneakers-off-white-red\\/4.webp\"]', 62),
(93, 'Fashion Timepieces', 'The Brown Leather Belt Watch is a stylish timepiece with a classic design. Featuring a genuine leather strap and a sleek dial, it adds a touch of sophistication to your look.', 'Brown Leather Belt Watch', 'mens-watches', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-watches\\/brown-leather-belt-watch\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-watches\\/brown-leather-belt-watch\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-watches\\/brown-leather-belt-watch\\/3.webp\"]', 32),
(94, 'Longines', 'The Longines Master Collection is an elegant and refined watch known for its precision and craftsmanship. With a timeless design, it\'s a symbol of luxury and sophistication.', 'Longines Master Collection', 'mens-watches', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-watches\\/longines-master-collection\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-watches\\/longines-master-collection\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-watches\\/longines-master-collection\\/3.webp\"]', 100),
(95, 'Rolex', 'The Rolex Cellini Date with Black Dial is a classic and prestigious watch. With a black dial and date complication, it exudes sophistication and is a symbol of Rolex\'s heritage.', 'Rolex Cellini Date Black Dial', 'mens-watches', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-watches\\/rolex-cellini-date-black-dial\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-watches\\/rolex-cellini-date-black-dial\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-watches\\/rolex-cellini-date-black-dial\\/3.webp\"]', 40),
(96, 'Rolex', 'The Rolex Cellini Moonphase is a masterpiece of horology, featuring a moon phase complication and exquisite design. It reflects Rolex\'s commitment to precision and elegance.', 'Rolex Cellini Moonphase', 'mens-watches', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-watches\\/rolex-cellini-moonphase\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-watches\\/rolex-cellini-moonphase\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-watches\\/rolex-cellini-moonphase\\/3.webp\"]', 36),
(97, 'Rolex', 'The Rolex Datejust is an iconic and versatile timepiece with a date window. Known for its timeless design and reliability, it\'s a symbol of Rolex\'s watchmaking excellence.', 'Rolex Datejust', 'mens-watches', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-watches\\/rolex-datejust\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-watches\\/rolex-datejust\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-watches\\/rolex-datejust\\/3.webp\"]', 86),
(98, 'Rolex', 'The Rolex Submariner is a legendary dive watch with a rich history. Known for its durability and water resistance, it\'s a symbol of adventure and exploration.', 'Rolex Submariner Watch', 'mens-watches', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-watches\\/rolex-submariner-watch\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-watches\\/rolex-submariner-watch\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mens-watches\\/rolex-submariner-watch\\/3.webp\"]', 55),
(99, 'Amazon', 'The Amazon Echo Plus is a smart speaker with built-in Alexa voice control. It features premium sound quality and serves as a hub for controlling smart home devices.', 'Amazon Echo Plus', 'mobile-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/amazon-echo-plus\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/amazon-echo-plus\\/2.webp\"]', 61),
(100, 'Apple', 'The Apple Airpods offer a seamless wireless audio experience. With easy pairing, high-quality sound, and Siri integration, they are perfect for on-the-go listening.', 'Apple Airpods', 'mobile-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/apple-airpods\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/apple-airpods\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/apple-airpods\\/3.webp\"]', 67),
(101, 'Apple', 'The Apple AirPods Max in Silver are premium over-ear headphones with high-fidelity audio, adaptive EQ, and active noise cancellation. Experience immersive sound in style.', 'Apple AirPods Max Silver', 'mobile-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/apple-airpods-max-silver\\/1.webp\"]', 59),
(102, 'Apple', 'The Apple AirPower Wireless Charger provides a convenient way to charge your compatible Apple devices wirelessly. Simply place your devices on the charging mat for effortless charging.', 'Apple Airpower Wireless Charger', 'mobile-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/apple-airpower-wireless-charger\\/1.webp\"]', 1),
(103, 'Apple', 'The Apple HomePod Mini in Cosmic Grey is a compact smart speaker that delivers impressive audio and integrates seamlessly with the Apple ecosystem for a smart home experience.', 'Apple HomePod Mini Cosmic Grey', 'mobile-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/apple-homepod-mini-cosmic-grey\\/1.webp\"]', 27),
(104, 'Apple', 'The Apple iPhone Charger is a high-quality charger designed for fast and efficient charging of your iPhone. Ensure your device stays powered up and ready to go.', 'Apple iPhone Charger', 'mobile-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/apple-iphone-charger\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/apple-iphone-charger\\/2.webp\"]', 31),
(105, 'Apple', 'The Apple MagSafe Battery Pack is a portable and convenient way to add extra battery life to your MagSafe-compatible iPhone. Attach it magnetically for a secure connection.', 'Apple MagSafe Battery Pack', 'mobile-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/apple-magsafe-battery-pack\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/apple-magsafe-battery-pack\\/2.webp\"]', 1),
(106, 'Apple', 'The Apple Watch Series 4 in Gold is a stylish and advanced smartwatch with features like heart rate monitoring, fitness tracking, and a beautiful Retina display.', 'Apple Watch Series 4 Gold', 'mobile-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/apple-watch-series-4-gold\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/apple-watch-series-4-gold\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/apple-watch-series-4-gold\\/3.webp\"]', 33),
(107, 'Beats', 'The Beats Flex Wireless Earphones offer a comfortable and versatile audio experience. With magnetic earbuds and up to 12 hours of battery life, they are ideal for everyday use.', 'Beats Flex Wireless Earphones', 'mobile-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/beats-flex-wireless-earphones\\/1.webp\"]', 50),
(108, 'Apple', 'The iPhone 12 Silicone Case with MagSafe in Plum is a stylish and protective case designed for the iPhone 12. It features MagSafe technology for easy attachment of accessories.', 'iPhone 12 Silicone Case with MagSafe Plum', 'mobile-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/iphone-12-silicone-case-with-magsafe-plum\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/iphone-12-silicone-case-with-magsafe-plum\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/iphone-12-silicone-case-with-magsafe-plum\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/iphone-12-silicone-case-with-magsafe-plum\\/4.webp\"]', 69),
(109, 'TechGear', 'The Monopod is a versatile camera accessory for stable and adjustable shooting. Perfect for capturing selfies, group photos, and videos with ease.', 'Monopod', 'mobile-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/monopod\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/monopod\\/2.webp\"]', 48),
(110, 'GadgetMaster', 'The Selfie Lamp with iPhone is a portable and adjustable LED light designed to enhance your selfies and video calls. Attach it to your iPhone for well-lit photos.', 'Selfie Lamp with iPhone', 'mobile-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/selfie-lamp-with-iphone\\/1.webp\"]', 58),
(111, 'SnapTech', 'The Selfie Stick Monopod is a extendable and foldable device for capturing the perfect selfie or group photo. Compatible with smartphones and cameras.', 'Selfie Stick Monopod', 'mobile-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/selfie-stick-monopod\\/1.webp\"]', 11),
(112, 'ProVision', 'The TV Studio Camera Pedestal is a professional-grade camera support system for smooth and precise camera movements in a studio setting. Ideal for broadcast and production.', 'TV Studio Camera Pedestal', 'mobile-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/mobile-accessories\\/tv-studio-camera-pedestal\\/1.webp\"]', 15),
(113, 'Generic Motors', 'The Generic Motorcycle is a versatile and reliable bike suitable for various riding preferences. With a balanced design, it provides a comfortable and efficient riding experience.', 'Generic Motorcycle', 'motorcycle', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/motorcycle\\/generic-motorcycle\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/motorcycle\\/generic-motorcycle\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/motorcycle\\/generic-motorcycle\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/motorcycle\\/generic-motorcycle\\/4.webp\"]', 34),
(114, 'Kawasaki', 'The Kawasaki Z800 is a powerful and agile sportbike known for its striking design and performance. It\'s equipped with advanced features, making it a favorite among motorcycle enthusiasts.', 'Kawasaki Z800', 'motorcycle', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/motorcycle\\/kawasaki-z800\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/motorcycle\\/kawasaki-z800\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/motorcycle\\/kawasaki-z800\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/motorcycle\\/kawasaki-z800\\/4.webp\"]', 52),
(115, 'MotoGP', 'The MotoGP CI.H1 is a high-performance motorcycle inspired by MotoGP racing technology. It offers cutting-edge features and precision engineering for an exhilarating riding experience.', 'MotoGP CI.H1', 'motorcycle', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/motorcycle\\/motogp-ci.h1\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/motorcycle\\/motogp-ci.h1\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/motorcycle\\/motogp-ci.h1\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/motorcycle\\/motogp-ci.h1\\/4.webp\"]', 10),
(116, 'ScootMaster', 'The Scooter Motorcycle is a practical and fuel-efficient bike ideal for urban commuting. It features a step-through design and user-friendly controls for easy maneuverability.', 'Scooter Motorcycle', 'motorcycle', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/motorcycle\\/scooter-motorcycle\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/motorcycle\\/scooter-motorcycle\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/motorcycle\\/scooter-motorcycle\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/motorcycle\\/scooter-motorcycle\\/4.webp\"]', 84),
(117, 'SpeedMaster', 'The Sportbike Motorcycle is designed for speed and agility, with a sleek and aerodynamic profile. It\'s suitable for riders looking for a dynamic and thrilling riding experience.', 'Sportbike Motorcycle', 'motorcycle', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/motorcycle\\/sportbike-motorcycle\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/motorcycle\\/sportbike-motorcycle\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/motorcycle\\/sportbike-motorcycle\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/motorcycle\\/sportbike-motorcycle\\/4.webp\"]', 0),
(118, 'Attitude', 'Attitude Super Leaves Hand Soap is a natural and nourishing hand soap enriched with the goodness of super leaves. It cleanses and moisturizes your hands, leaving them feeling fresh and soft.', 'Attitude Super Leaves Hand Soap', 'skin-care', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/skin-care\\/attitude-super-leaves-hand-soap\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/skin-care\\/attitude-super-leaves-hand-soap\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/skin-care\\/attitude-super-leaves-hand-soap\\/3.webp\"]', 94),
(119, 'Olay', 'Olay Ultra Moisture Shea Butter Body Wash is a luxurious body wash that hydrates and nourishes your skin with the moisturizing power of shea butter. Enjoy a rich lather and silky-smooth skin.', 'Olay Ultra Moisture Shea Butter Body Wash', 'skin-care', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/skin-care\\/olay-ultra-moisture-shea-butter-body-wash\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/skin-care\\/olay-ultra-moisture-shea-butter-body-wash\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/skin-care\\/olay-ultra-moisture-shea-butter-body-wash\\/3.webp\"]', 34),
(120, 'Vaseline', 'Vaseline Men Body and Face Lotion is a specially formulated lotion designed to provide long-lasting moisture to men\'s skin. It absorbs quickly and helps keep the skin hydrated and healthy.', 'Vaseline Men Body and Face Lotion', 'skin-care', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/skin-care\\/vaseline-men-body-and-face-lotion\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/skin-care\\/vaseline-men-body-and-face-lotion\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/skin-care\\/vaseline-men-body-and-face-lotion\\/3.webp\"]', 95),
(121, 'Apple', 'The iPhone 5s is a classic smartphone known for its compact design and advanced features during its release. While it\'s an older model, it still provides a reliable user experience.', 'iPhone 5s', 'smartphones', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/iphone-5s\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/iphone-5s\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/iphone-5s\\/3.webp\"]', 25);
INSERT INTO `products` (`product_id`, `brand`, `description`, `name`, `category`, `images`, `Num_Products`) VALUES
(122, 'Apple', 'The iPhone 6 is a stylish and capable smartphone with a larger display and improved performance. It introduced new features and design elements, making it a popular choice in its time.', 'iPhone 6', 'smartphones', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/iphone-6\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/iphone-6\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/iphone-6\\/3.webp\"]', 60),
(123, 'Apple', 'The iPhone 13 Pro is a cutting-edge smartphone with a powerful camera system, high-performance chip, and stunning display. It offers advanced features for users who demand top-notch technology.', 'iPhone 13 Pro', 'smartphones', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/iphone-13-pro\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/iphone-13-pro\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/iphone-13-pro\\/3.webp\"]', 56),
(124, 'Apple', 'The iPhone X is a flagship smartphone featuring a bezel-less OLED display, facial recognition technology (Face ID), and impressive performance. It represents a milestone in iPhone design and innovation.', 'iPhone X', 'smartphones', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/iphone-x\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/iphone-x\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/iphone-x\\/3.webp\"]', 37),
(125, 'Oppo', 'The Oppo A57 is a mid-range smartphone known for its sleek design and capable features. It offers a balance of performance and affordability, making it a popular choice.', 'Oppo A57', 'smartphones', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/oppo-a57\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/oppo-a57\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/oppo-a57\\/3.webp\"]', 19),
(126, 'Oppo', 'The Oppo F19 Pro Plus is a feature-rich smartphone with a focus on camera capabilities. It boasts advanced photography features and a powerful performance for a premium user experience.', 'Oppo F19 Pro Plus', 'smartphones', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/oppo-f19-pro-plus\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/oppo-f19-pro-plus\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/oppo-f19-pro-plus\\/3.webp\"]', 78),
(127, 'Oppo', 'The Oppo K1 series offers a range of smartphones with various features and specifications. Known for their stylish design and reliable performance, the Oppo K1 series caters to diverse user preferences.', 'Oppo K1', 'smartphones', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/oppo-k1\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/oppo-k1\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/oppo-k1\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/oppo-k1\\/4.webp\"]', 55),
(128, 'Realme', 'The Realme C35 is a budget-friendly smartphone with a focus on providing essential features for everyday use. It offers a reliable performance and user-friendly experience.', 'Realme C35', 'smartphones', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/realme-c35\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/realme-c35\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/realme-c35\\/3.webp\"]', 48),
(129, 'Realme', 'The Realme X is a mid-range smartphone known for its sleek design and impressive display. It offers a good balance of performance and camera capabilities for users seeking a quality device.', 'Realme X', 'smartphones', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/realme-x\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/realme-x\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/realme-x\\/3.webp\"]', 12),
(130, 'Realme', 'The Realme XT is a feature-rich smartphone with a focus on camera technology. It comes equipped with advanced camera sensors, delivering high-quality photos and videos for photography enthusiasts.', 'Realme XT', 'smartphones', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/realme-xt\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/realme-xt\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/realme-xt\\/3.webp\"]', 80),
(131, 'Samsung', 'The Samsung Galaxy S7 is a flagship smartphone known for its sleek design and advanced features. It features a high-resolution display, powerful camera, and robust performance.', 'Samsung Galaxy S7', 'smartphones', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/samsung-galaxy-s7\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/samsung-galaxy-s7\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/samsung-galaxy-s7\\/3.webp\"]', 67),
(132, 'Samsung', 'The Samsung Galaxy S8 is a premium smartphone with an Infinity Display, offering a stunning visual experience. It boasts advanced camera capabilities and cutting-edge technology.', 'Samsung Galaxy S8', 'smartphones', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/samsung-galaxy-s8\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/samsung-galaxy-s8\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/samsung-galaxy-s8\\/3.webp\"]', 0),
(133, 'Samsung', 'The Samsung Galaxy S10 is a flagship device featuring a dynamic AMOLED display, versatile camera system, and powerful performance. It represents innovation and excellence in smartphone technology.', 'Samsung Galaxy S10', 'smartphones', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/samsung-galaxy-s10\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/samsung-galaxy-s10\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/samsung-galaxy-s10\\/3.webp\"]', 19),
(134, 'Vivo', 'The Vivo S1 is a stylish and mid-range smartphone offering a blend of design and performance. It features a vibrant display, capable camera system, and reliable functionality.', 'Vivo S1', 'smartphones', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/vivo-s1\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/vivo-s1\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/vivo-s1\\/3.webp\"]', 50),
(135, 'Vivo', 'The Vivo V9 is a smartphone known for its sleek design and emphasis on capturing high-quality selfies. It features a notch display, dual-camera setup, and a modern design.', 'Vivo V9', 'smartphones', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/vivo-v9\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/vivo-v9\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/vivo-v9\\/3.webp\"]', 82),
(136, 'Vivo', 'The Vivo X21 is a premium smartphone with a focus on cutting-edge technology. It features an in-display fingerprint sensor, a high-resolution display, and advanced camera capabilities.', 'Vivo X21', 'smartphones', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/vivo-x21\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/vivo-x21\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/smartphones\\/vivo-x21\\/3.webp\"]', 7),
(137, '', 'The American Football is a classic ball used in American football games. It is designed for throwing and catching, making it an essential piece of equipment for the sport.', 'American Football', 'sports-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sports-accessories\\/american-football\\/1.webp\"]', 53),
(138, '', 'The Baseball Ball is a standard baseball used in baseball games. It features a durable leather cover and is designed for pitching, hitting, and fielding in the game of baseball.', 'Baseball Ball', 'sports-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sports-accessories\\/baseball-ball\\/1.webp\"]', 100),
(139, '', 'The Baseball Glove is a protective glove worn by baseball players. It is designed to catch and field the baseball, providing players with comfort and control during the game.', 'Baseball Glove', 'sports-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sports-accessories\\/baseball-glove\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sports-accessories\\/baseball-glove\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sports-accessories\\/baseball-glove\\/3.webp\"]', 22),
(140, '', 'The Basketball is a standard ball used in basketball games. It is designed for dribbling, shooting, and passing in the game of basketball, suitable for both indoor and outdoor play.', 'Basketball', 'sports-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sports-accessories\\/basketball\\/1.webp\"]', 75),
(141, '', 'The Basketball Rim is a sturdy hoop and net assembly mounted on a basketball backboard. It provides a target for shooting and scoring in the game of basketball.', 'Basketball Rim', 'sports-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sports-accessories\\/basketball-rim\\/1.webp\"]', 43),
(142, '', 'The Cricket Ball is a hard leather ball used in the sport of cricket. It is bowled and batted in the game, and its hardness and seam contribute to the dynamics of cricket play.', 'Cricket Ball', 'sports-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sports-accessories\\/cricket-ball\\/1.webp\"]', 30),
(143, '', 'The Cricket Bat is an essential piece of cricket equipment used by batsmen to hit the cricket ball. It is made of wood and comes in various sizes and designs.', 'Cricket Bat', 'sports-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sports-accessories\\/cricket-bat\\/1.webp\"]', 98),
(144, '', 'The Cricket Helmet is a protective headgear worn by cricket players, especially batsmen and wicketkeepers. It provides protection against fast bowling and bouncers.', 'Cricket Helmet', 'sports-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sports-accessories\\/cricket-helmet\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sports-accessories\\/cricket-helmet\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sports-accessories\\/cricket-helmet\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sports-accessories\\/cricket-helmet\\/4.webp\"]', 10),
(145, '', 'The Cricket Wicket is a set of three stumps and two bails, forming a wicket used in the sport of cricket. Batsmen aim to protect the wicket while scoring runs.', 'Cricket Wicket', 'sports-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sports-accessories\\/cricket-wicket\\/1.webp\"]', 25),
(146, '', 'The Feather Shuttlecock is used in the sport of badminton. It features natural feathers and is designed for high-speed play, providing stability and accuracy during matches.', 'Feather Shuttlecock', 'sports-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sports-accessories\\/feather-shuttlecock\\/1.webp\"]', 95),
(147, '', 'The Football, also known as a soccer ball, is the standard ball used in the sport of football (soccer). It is designed for kicking and passing in the game.', 'Football', 'sports-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sports-accessories\\/football\\/1.webp\"]', 96),
(148, '', 'The Golf Ball is a small ball used in the sport of golf. It features dimples on its surface, providing aerodynamic lift and distance when struck by a golf club.', 'Golf Ball', 'sports-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sports-accessories\\/golf-ball\\/1.webp\"]', 84),
(149, '', 'The Iron Golf is a type of golf club designed for various golf shots. It features a solid metal head and is used for approach shots, chipping, and other golfing techniques.', 'Iron Golf', 'sports-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sports-accessories\\/iron-golf\\/1.webp\"]', 90),
(150, '', 'The Metal Baseball Bat is a durable and lightweight baseball bat made from metal alloys. It is commonly used in baseball games for hitting and batting practice.', 'Metal Baseball Bat', 'sports-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sports-accessories\\/metal-baseball-bat\\/1.webp\"]', 16),
(151, '', 'The Tennis Ball is a standard ball used in the sport of tennis. It is designed for bouncing and hitting with tennis rackets during matches or practice sessions.', 'Tennis Ball', 'sports-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sports-accessories\\/tennis-ball\\/1.webp\"]', 28),
(152, '', 'The Tennis Racket is an essential piece of equipment used in the sport of tennis. It features a frame with strings and a grip, allowing players to hit the tennis ball.', 'Tennis Racket', 'sports-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sports-accessories\\/tennis-racket\\/1.webp\"]', 6),
(153, '', 'The Volleyball is a standard ball used in the sport of volleyball. It is designed for passing, setting, and spiking over the net during volleyball matches.', 'Volleyball', 'sports-accessories', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sports-accessories\\/volleyball\\/1.webp\"]', 0),
(154, 'Fashion Shades', 'The Black Sun Glasses are a classic and stylish choice, featuring a sleek black frame and tinted lenses. They provide both UV protection and a fashionable look.', 'Black Sun Glasses', 'sunglasses', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sunglasses\\/black-sun-glasses\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sunglasses\\/black-sun-glasses\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sunglasses\\/black-sun-glasses\\/3.webp\"]', 60),
(155, 'Fashion Shades', 'The Classic Sun Glasses offer a timeless design with a neutral frame and UV-protected lenses. These sunglasses are versatile and suitable for various occasions.', 'Classic Sun Glasses', 'sunglasses', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sunglasses\\/classic-sun-glasses\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sunglasses\\/classic-sun-glasses\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sunglasses\\/classic-sun-glasses\\/3.webp\"]', 1),
(156, 'Fashion Shades', 'The Green and Black Glasses feature a bold combination of green and black colors, adding a touch of vibrancy to your eyewear collection. They are both stylish and eye-catching.', 'Green and Black Glasses', 'sunglasses', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sunglasses\\/green-and-black-glasses\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sunglasses\\/green-and-black-glasses\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sunglasses\\/green-and-black-glasses\\/3.webp\"]', 24),
(157, 'Fashion Fun', 'The Party Glasses are designed to add flair to your party outfit. With unique shapes or colorful frames, they\'re perfect for adding a playful touch to your look during celebrations.', 'Party Glasses', 'sunglasses', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sunglasses\\/party-glasses\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sunglasses\\/party-glasses\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sunglasses\\/party-glasses\\/3.webp\"]', 86),
(158, 'Fashion Shades', 'The Sunglasses offer a classic and simple design with a focus on functionality. These sunglasses provide essential UV protection while maintaining a timeless look.', 'Sunglasses', 'sunglasses', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sunglasses\\/sunglasses\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sunglasses\\/sunglasses\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/sunglasses\\/sunglasses\\/3.webp\"]', 27),
(159, 'Apple', 'The iPad Mini 2021 in Starlight is a compact and powerful tablet from Apple. Featuring a stunning Retina display, powerful A-series chip, and a sleek design, it offers a premium tablet experience.', 'iPad Mini 2021 Starlight', 'tablets', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tablets\\/ipad-mini-2021-starlight\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tablets\\/ipad-mini-2021-starlight\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tablets\\/ipad-mini-2021-starlight\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tablets\\/ipad-mini-2021-starlight\\/4.webp\"]', 47),
(160, 'Samsung', 'The Samsung Galaxy Tab S8 Plus in Grey is a high-performance Android tablet by Samsung. With a large AMOLED display, powerful processor, and S Pen support, it\'s ideal for productivity and entertainment.', 'Samsung Galaxy Tab S8 Plus Grey', 'tablets', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tablets\\/samsung-galaxy-tab-s8-plus-grey\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tablets\\/samsung-galaxy-tab-s8-plus-grey\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tablets\\/samsung-galaxy-tab-s8-plus-grey\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tablets\\/samsung-galaxy-tab-s8-plus-grey\\/4.webp\"]', 62),
(161, 'Samsung', 'The Samsung Galaxy Tab in White is a sleek and versatile Android tablet. With a vibrant display, long-lasting battery, and a range of features, it offers a great user experience for various tasks.', 'Samsung Galaxy Tab White', 'tablets', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tablets\\/samsung-galaxy-tab-white\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tablets\\/samsung-galaxy-tab-white\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tablets\\/samsung-galaxy-tab-white\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tablets\\/samsung-galaxy-tab-white\\/4.webp\"]', 92),
(162, '', 'The Blue Frock is a charming and stylish dress for various occasions. With a vibrant blue color and a comfortable design, it adds a touch of elegance to your wardrobe.', 'Blue Frock', 'tops', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tops\\/blue-frock\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tops\\/blue-frock\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tops\\/blue-frock\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tops\\/blue-frock\\/4.webp\"]', 52),
(163, '', 'The Girl Summer Dress is a cute and breezy dress designed for warm weather. With playful patterns and lightweight fabric, it\'s perfect for keeping cool and stylish during the summer.', 'Girl Summer Dress', 'tops', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tops\\/girl-summer-dress\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tops\\/girl-summer-dress\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tops\\/girl-summer-dress\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tops\\/girl-summer-dress\\/4.webp\"]', 43),
(164, '', 'The Gray Dress is a versatile and chic option for various occasions. With a neutral gray color, it can be dressed up or down, making it a wardrobe staple for any fashion-forward individual.', 'Gray Dress', 'tops', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tops\\/gray-dress\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tops\\/gray-dress\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tops\\/gray-dress\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tops\\/gray-dress\\/4.webp\"]', 55),
(165, '', 'The Short Frock is a playful and trendy dress with a shorter length. Ideal for casual outings or special occasions, it combines style and comfort for a fashionable look.', 'Short Frock', 'tops', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tops\\/short-frock\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tops\\/short-frock\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tops\\/short-frock\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tops\\/short-frock\\/4.webp\"]', 22),
(166, '', 'The Tartan Dress features a classic tartan pattern, bringing a timeless and sophisticated touch to your wardrobe. Perfect for fall and winter, it adds a hint of traditional charm.', 'Tartan Dress', 'tops', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tops\\/tartan-dress\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tops\\/tartan-dress\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tops\\/tartan-dress\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/tops\\/tartan-dress\\/4.webp\"]', 73),
(167, 'Chrysler', 'The 300 Touring is a stylish and comfortable sedan, known for its luxurious features and smooth performance.', '300 Touring', 'vehicle', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/300-touring\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/300-touring\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/300-touring\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/300-touring\\/4.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/300-touring\\/5.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/300-touring\\/6.webp\"]', 54),
(168, 'Dodge', 'The Charger SXT RWD is a powerful and sporty rear-wheel-drive sedan, offering a blend of performance and practicality.', 'Charger SXT RWD', 'vehicle', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/charger-sxt-rwd\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/charger-sxt-rwd\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/charger-sxt-rwd\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/charger-sxt-rwd\\/4.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/charger-sxt-rwd\\/5.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/charger-sxt-rwd\\/6.webp\"]', 57),
(169, 'Dodge', 'The Dodge Hornet GT Plus is a compact and agile hatchback, perfect for urban driving with a touch of sportiness.', 'Dodge Hornet GT Plus', 'vehicle', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/dodge-hornet-gt-plus\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/dodge-hornet-gt-plus\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/dodge-hornet-gt-plus\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/dodge-hornet-gt-plus\\/4.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/dodge-hornet-gt-plus\\/5.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/dodge-hornet-gt-plus\\/6.webp\"]', 82),
(170, 'Dodge', 'The Durango SXT RWD is a spacious and versatile SUV, known for its strong performance and family-friendly features.', 'Durango SXT RWD', 'vehicle', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/durango-sxt-rwd\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/durango-sxt-rwd\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/durango-sxt-rwd\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/durango-sxt-rwd\\/4.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/durango-sxt-rwd\\/5.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/durango-sxt-rwd\\/6.webp\"]', 95),
(171, 'Chrysler', 'The Pacifica Touring is a stylish and well-equipped minivan, offering comfort and convenience for family journeys.', 'Pacifica Touring', 'vehicle', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/pacifica-touring\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/pacifica-touring\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/pacifica-touring\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/pacifica-touring\\/4.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/pacifica-touring\\/5.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/vehicle\\/pacifica-touring\\/6.webp\"]', 53),
(172, 'Fashionista', 'The Blue Women\'s Handbag is a stylish and spacious accessory for everyday use. With a vibrant blue color and multiple compartments, it combines fashion and functionality.', 'Blue Women\'s Handbag', 'womens-bags', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-bags\\/blue-women\'s-handbag\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-bags\\/blue-women\'s-handbag\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-bags\\/blue-women\'s-handbag\\/3.webp\"]', 76),
(173, 'Heshe', 'The Heshe Women\'s Leather Bag is a luxurious and high-quality leather bag for the sophisticated woman. With a timeless design and durable craftsmanship, it\'s a versatile accessory.', 'Heshe Women\'s Leather Bag', 'womens-bags', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-bags\\/heshe-women\'s-leather-bag\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-bags\\/heshe-women\'s-leather-bag\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-bags\\/heshe-women\'s-leather-bag\\/3.webp\"]', 99),
(174, 'Prada', 'The Prada Women Bag is an iconic designer bag that exudes elegance and luxury. Crafted with precision and featuring the Prada logo, it\'s a statement piece for fashion enthusiasts.', 'Prada Women Bag', 'womens-bags', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-bags\\/prada-women-bag\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-bags\\/prada-women-bag\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-bags\\/prada-women-bag\\/3.webp\"]', 75),
(175, 'Urban Chic', 'The White Faux Leather Backpack is a trendy and practical backpack for the modern woman. With a sleek white design and ample storage space, it\'s perfect for both casual and on-the-go styles.', 'White Faux Leather Backpack', 'womens-bags', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-bags\\/white-faux-leather-backpack\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-bags\\/white-faux-leather-backpack\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-bags\\/white-faux-leather-backpack\\/3.webp\"]', 39),
(176, 'Elegance Collection', 'The Women Handbag in Black is a classic and versatile accessory that complements various outfits. With a timeless black color and functional design, it\'s a must-have in every woman\'s wardrobe.', 'Women Handbag Black', 'womens-bags', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-bags\\/women-handbag-black\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-bags\\/women-handbag-black\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-bags\\/women-handbag-black\\/3.webp\"]', 11),
(177, '', 'The Black Women\'s Gown is an elegant and timeless evening gown. With a sleek black design, it\'s perfect for formal events and special occasions, exuding sophistication and style.', 'Black Women\'s Gown', 'womens-dresses', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-dresses\\/black-women\'s-gown\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-dresses\\/black-women\'s-gown\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-dresses\\/black-women\'s-gown\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-dresses\\/black-women\'s-gown\\/4.webp\"]', 25),
(178, '', 'The Corset Leather With Skirt is a bold and edgy ensemble that combines a stylish corset with a matching skirt. Ideal for fashion-forward individuals, it makes a statement at any event.', 'Corset Leather With Skirt', 'womens-dresses', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-dresses\\/corset-leather-with-skirt\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-dresses\\/corset-leather-with-skirt\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-dresses\\/corset-leather-with-skirt\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-dresses\\/corset-leather-with-skirt\\/4.webp\"]', 30),
(179, '', 'The Corset With Black Skirt is a chic and versatile outfit that pairs a fashionable corset with a classic black skirt. It offers a trendy and coordinated look for various occasions.', 'Corset With Black Skirt', 'womens-dresses', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-dresses\\/corset-with-black-skirt\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-dresses\\/corset-with-black-skirt\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-dresses\\/corset-with-black-skirt\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-dresses\\/corset-with-black-skirt\\/4.webp\"]', 33),
(180, '', 'The Dress Pea is a stylish and comfortable dress with a pea pattern. Perfect for casual outings, it adds a playful and fun element to your wardrobe, making it a great choice for day-to-day wear.', 'Dress Pea', 'womens-dresses', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-dresses\\/dress-pea\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-dresses\\/dress-pea\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-dresses\\/dress-pea\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-dresses\\/dress-pea\\/4.webp\"]', 6),
(181, '', 'The Marni Red & Black Suit is a sophisticated and fashion-forward suit ensemble. With a combination of red and black tones, it showcases a modern design for a bold and confident look.', 'Marni Red & Black Suit', 'womens-dresses', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-dresses\\/marni-red-&-black-suit\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-dresses\\/marni-red-&-black-suit\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-dresses\\/marni-red-&-black-suit\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-dresses\\/marni-red-&-black-suit\\/4.webp\"]', 62),
(182, '', 'The Green Crystal Earring is a dazzling accessory that features a vibrant green crystal. With a classic design, it adds a touch of elegance to your ensemble, perfect for formal or special occasions.', 'Green Crystal Earring', 'womens-jewellery', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-jewellery\\/green-crystal-earring\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-jewellery\\/green-crystal-earring\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-jewellery\\/green-crystal-earring\\/3.webp\"]', 54),
(183, '', 'The Green Oval Earring is a stylish and versatile accessory with a unique oval shape. Whether for casual or dressy occasions, its green hue and contemporary design make it a standout piece.', 'Green Oval Earring', 'womens-jewellery', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-jewellery\\/green-oval-earring\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-jewellery\\/green-oval-earring\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-jewellery\\/green-oval-earring\\/3.webp\"]', 73),
(184, '', 'The Tropical Earring is a fun and playful accessory inspired by tropical elements. Featuring vibrant colors and a lively design, it\'s perfect for adding a touch of summer to your look.', 'Tropical Earring', 'womens-jewellery', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-jewellery\\/tropical-earring\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-jewellery\\/tropical-earring\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-jewellery\\/tropical-earring\\/3.webp\"]', 1),
(185, 'Comfort Trends', 'The Black & Brown Slipper is a comfortable and stylish choice for casual wear. Featuring a blend of black and brown colors, it adds a touch of sophistication to your relaxation.', 'Black & Brown Slipper', 'womens-shoes', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-shoes\\/black-&-brown-slipper\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-shoes\\/black-&-brown-slipper\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-shoes\\/black-&-brown-slipper\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-shoes\\/black-&-brown-slipper\\/4.webp\"]', 3),
(186, 'Calvin Klein', 'Calvin Klein Heel Shoes are elegant and sophisticated, designed for formal occasions. With a classic design and high-quality materials, they complement your stylish ensemble.', 'Calvin Klein Heel Shoes', 'womens-shoes', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-shoes\\/calvin-klein-heel-shoes\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-shoes\\/calvin-klein-heel-shoes\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-shoes\\/calvin-klein-heel-shoes\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-shoes\\/calvin-klein-heel-shoes\\/4.webp\"]', 93),
(187, 'Fashion Diva', 'The Golden Shoes for Women are a glamorous choice for special occasions. Featuring a golden hue and stylish design, they add a touch of luxury to your outfit.', 'Golden Shoes Woman', 'womens-shoes', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-shoes\\/golden-shoes-woman\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-shoes\\/golden-shoes-woman\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-shoes\\/golden-shoes-woman\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-shoes\\/golden-shoes-woman\\/4.webp\"]', 88),
(188, 'Pampi', 'Pampi Shoes offer a blend of comfort and style for everyday use. With a versatile design, they are suitable for various casual occasions, providing a trendy and relaxed look.', 'Pampi Shoes', 'womens-shoes', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-shoes\\/pampi-shoes\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-shoes\\/pampi-shoes\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-shoes\\/pampi-shoes\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-shoes\\/pampi-shoes\\/4.webp\"]', 49),
(189, 'Fashion Express', 'The Red Shoes make a bold statement with their vibrant red color. Whether for a party or a casual outing, these shoes add a pop of color and style to your wardrobe.', 'Red Shoes', 'womens-shoes', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-shoes\\/red-shoes\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-shoes\\/red-shoes\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-shoes\\/red-shoes\\/3.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-shoes\\/red-shoes\\/4.webp\"]', 7),
(190, 'IWC', 'The IWC Ingenieur Automatic Steel watch is a durable and sophisticated timepiece. With a stainless steel case and automatic movement, it combines precision and style for watch enthusiasts.', 'IWC Ingenieur Automatic Steel', 'womens-watches', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-watches\\/iwc-ingenieur-automatic-steel\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-watches\\/iwc-ingenieur-automatic-steel\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-watches\\/iwc-ingenieur-automatic-steel\\/3.webp\"]', 90),
(191, 'Rolex', 'The Rolex Cellini Moonphase watch is a masterpiece of horology. Featuring a moon phase complication, it showcases the craftsmanship and elegance that Rolex is renowned for.', 'Rolex Cellini Moonphase', 'womens-watches', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-watches\\/rolex-cellini-moonphase\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-watches\\/rolex-cellini-moonphase\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-watches\\/rolex-cellini-moonphase\\/3.webp\"]', 52),
(192, 'Rolex', 'The Rolex Datejust Women\'s watch is an iconic timepiece designed for women. With a timeless design and a date complication, it offers both elegance and functionality.', 'Rolex Datejust Women', 'womens-watches', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-watches\\/rolex-datejust-women\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-watches\\/rolex-datejust-women\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-watches\\/rolex-datejust-women\\/3.webp\"]', 4),
(193, 'Fashion Gold', 'The Gold Women\'s Watch is a stunning accessory that combines luxury and style. Featuring a gold-plated case and a chic design, it adds a touch of glamour to any outfit.', 'Watch Gold for Women', 'womens-watches', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-watches\\/watch-gold-for-women\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-watches\\/watch-gold-for-women\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-watches\\/watch-gold-for-women\\/3.webp\"]', 0),
(194, 'Fashion Co.', 'The Women\'s Wrist Watch is a versatile and fashionable timepiece for everyday wear. With a comfortable strap and a simple yet elegant design, it complements various styles.', 'Women\'s Wrist Watch', 'womens-watches', '[\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-watches\\/women\'s-wrist-watch\\/1.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-watches\\/women\'s-wrist-watch\\/2.webp\",\"https:\\/\\/cdn.dummyjson.com\\/product-images\\/womens-watches\\/women\'s-wrist-watch\\/3.webp\"]', 12);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'can''t be unique, user can make multiple reviews',
  `rating` double NOT NULL COMMENT 'range: 1 - 10, limit to 1 decimal place',
  `date_created` datetime NOT NULL,
  `comment` varchar(255) DEFAULT NULL COMMENT 'sometimes you want to leave a review without commenting',
  `listing_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `user_id`, `rating`, `date_created`, `comment`, `listing_id`) VALUES
(1, 2, 9.2, '2025-05-26 18:02:09', 'Review #1 for “Essence Mascara Lash Princess”: really enjoyed it!', 1),
(2, 2, 2.6, '2025-05-26 18:02:09', 'Review #2 for “Essence Mascara Lash Princess”: could be better, but overall okay.', 2),
(3, 1, 8.2, '2025-05-26 18:02:09', 'Review #1 for “Eyeshadow Palette with Mirror”: really enjoyed it!', 3),
(4, 3, 3.2, '2025-05-26 18:02:09', 'Review #2 for “Eyeshadow Palette with Mirror”: could be better, but overall okay.', 4),
(5, 3, 8.9, '2025-05-26 18:02:09', 'Review #1 for “Powder Canister”: really enjoyed it!', 6),
(6, 3, 3.1, '2025-05-26 18:02:09', 'Review #2 for “Powder Canister”: could be better, but overall okay.', 5),
(7, 2, 10, '2025-05-26 18:02:09', 'Review #1 for “Red Lipstick”: really enjoyed it!', 9),
(8, 4, 2.3, '2025-05-26 18:02:09', 'Review #2 for “Red Lipstick”: could be better, but overall okay.', 7),
(9, 1, 7.6, '2025-05-26 18:02:09', 'Review #1 for “Red Nail Polish”: really enjoyed it!', 11),
(10, 3, 5.3, '2025-05-26 18:02:09', 'Review #2 for “Red Nail Polish”: could be better, but overall okay.', 12),
(11, 2, 9.6, '2025-05-26 18:02:09', 'Review #1 for “Annibale Colombo Bed”: really enjoyed it!', 14),
(12, 4, 9.7, '2025-05-26 18:02:09', 'Review #1 for “Annibale Colombo Sofa”: really enjoyed it!', 15),
(13, 3, 9.7, '2025-05-26 18:02:09', 'Review #1 for “Bedside Table African Cherry”: really enjoyed it!', 16),
(14, 2, 8.3, '2025-05-26 18:02:09', 'Review #1 for “Knoll Saarinen Executive Conference Chair”: really enjoyed it!', 17),
(15, 4, 7.3, '2025-05-26 18:02:09', 'Review #1 for “Wooden Bathroom Sink With Mirror”: really enjoyed it!', 18),
(16, 4, 9.6, '2025-05-26 18:02:09', 'Review #1 for “Apple”: really enjoyed it!', 22),
(17, 4, 2.8, '2025-05-26 18:02:09', 'Review #2 for “Apple”: could be better, but overall okay.', 19),
(18, 2, 7.6, '2025-05-26 18:02:09', 'Review #1 for “Beef Steak”: really enjoyed it!', 23),
(19, 3, 4.5, '2025-05-26 18:02:09', 'Review #2 for “Beef Steak”: could be better, but overall okay.', 25),
(20, 4, 8.3, '2025-05-26 18:02:09', 'Review #1 for “Cat Food”: really enjoyed it!', 27),
(21, 3, 3.3, '2025-05-26 18:02:09', 'Review #2 for “Cat Food”: could be better, but overall okay.', 26),
(22, 3, 9.7, '2025-05-26 18:02:09', 'Review #1 for “Chicken Meat”: really enjoyed it!', 29),
(23, 4, 2.3, '2025-05-26 18:02:09', 'Review #2 for “Chicken Meat”: could be better, but overall okay.', 31),
(24, 4, 8.8, '2025-05-26 18:02:09', 'Review #1 for “Cooking Oil”: really enjoyed it!', 34),
(25, 2, 3.4, '2025-05-26 18:02:09', 'Review #2 for “Cooking Oil”: could be better, but overall okay.', 35),
(26, 1, 7.6, '2025-05-26 18:02:09', 'Review #1 for “Cucumber”: really enjoyed it!', 36),
(27, 1, 4.3, '2025-05-26 18:02:09', 'Review #2 for “Cucumber”: could be better, but overall okay.', 37),
(28, 2, 9.5, '2025-05-26 18:02:09', 'Review #1 for “Dog Food”: really enjoyed it!', 39),
(29, 2, 5.6, '2025-05-26 18:02:09', 'Review #2 for “Dog Food”: could be better, but overall okay.', 40),
(30, 3, 9.8, '2025-05-26 18:02:09', 'Review #1 for “Eggs”: really enjoyed it!', 43),
(31, 2, 3.4, '2025-05-26 18:02:09', 'Review #2 for “Eggs”: could be better, but overall okay.', 44),
(32, 4, 8.7, '2025-05-26 18:02:09', 'Review #1 for “Fish Steak”: really enjoyed it!', 47),
(33, 4, 2.4, '2025-05-26 18:02:09', 'Review #2 for “Fish Steak”: could be better, but overall okay.', 48),
(34, 4, 9.6, '2025-05-26 18:02:09', 'Review #1 for “Green Bell Pepper”: really enjoyed it!', 50),
(35, 4, 1.9, '2025-05-26 18:02:09', 'Review #2 for “Green Bell Pepper”: could be better, but overall okay.', 49),
(36, 1, 9.8, '2025-05-26 18:02:09', 'Review #1 for “Green Chili Pepper”: really enjoyed it!', 52),
(37, 3, 4.1, '2025-05-26 18:02:09', 'Review #2 for “Green Chili Pepper”: could be better, but overall okay.', 51),
(38, 2, 9, '2025-05-26 18:02:09', 'Review #1 for “Honey Jar”: really enjoyed it!', 55),
(39, 1, 2.1, '2025-05-26 18:02:09', 'Review #2 for “Honey Jar”: could be better, but overall okay.', 54),
(40, 3, 8.5, '2025-05-26 18:02:09', 'Review #1 for “Ice Cream”: really enjoyed it!', 58),
(41, 4, 4.5, '2025-05-26 18:02:09', 'Review #2 for “Ice Cream”: could be better, but overall okay.', 57),
(42, 1, 8.7, '2025-05-26 18:02:09', 'Review #1 for “Juice”: really enjoyed it!', 59),
(43, 2, 2.1, '2025-05-26 18:02:09', 'Review #2 for “Juice”: could be better, but overall okay.', 60),
(44, 3, 8.8, '2025-05-26 18:02:09', 'Review #1 for “Kiwi”: really enjoyed it!', 62),
(45, 1, 3.3, '2025-05-26 18:02:09', 'Review #2 for “Kiwi”: could be better, but overall okay.', 61),
(46, 1, 8.8, '2025-05-26 18:02:09', 'Review #1 for “Lemon”: really enjoyed it!', 65),
(47, 1, 2.5, '2025-05-26 18:02:09', 'Review #2 for “Lemon”: could be better, but overall okay.', 66),
(48, 3, 8.9, '2025-05-26 18:02:09', 'Review #1 for “Milk”: really enjoyed it!', 68),
(49, 1, 2.8, '2025-05-26 18:02:09', 'Review #2 for “Milk”: could be better, but overall okay.', 67),
(50, 3, 8.1, '2025-05-26 18:02:09', 'Review #1 for “Mulberry”: really enjoyed it!', 71),
(51, 3, 2.7, '2025-05-26 18:02:09', 'Review #2 for “Mulberry”: could be better, but overall okay.', 70),
(52, 3, 8.8, '2025-05-26 18:02:09', 'Review #1 for “Nescafe Coffee”: really enjoyed it!', 72),
(53, 4, 2.3, '2025-05-26 18:02:09', 'Review #2 for “Nescafe Coffee”: could be better, but overall okay.', 75),
(54, 4, 8.2, '2025-05-26 18:02:09', 'Review #1 for “Potatoes”: really enjoyed it!', 76),
(55, 3, 3.6, '2025-05-26 18:02:09', 'Review #2 for “Potatoes”: could be better, but overall okay.', 77),
(56, 3, 9.4, '2025-05-26 18:02:09', 'Review #1 for “Protein Powder”: really enjoyed it!', 79),
(57, 4, 2.5, '2025-05-26 18:02:09', 'Review #2 for “Protein Powder”: could be better, but overall okay.', 80),
(58, 2, 9.6, '2025-05-26 18:02:09', 'Review #1 for “Red Onions”: really enjoyed it!', 83),
(59, 4, 2.6, '2025-05-26 18:02:09', 'Review #2 for “Red Onions”: could be better, but overall okay.', 82),
(60, 4, 8.3, '2025-05-26 18:02:09', 'Review #1 for “Rice”: really enjoyed it!', 85),
(61, 3, 1.6, '2025-05-26 18:02:09', 'Review #2 for “Rice”: could be better, but overall okay.', 84),
(62, 2, 8.1, '2025-05-26 18:02:09', 'Review #1 for “Soft Drinks”: really enjoyed it!', 87),
(63, 4, 3.2, '2025-05-26 18:02:09', 'Review #2 for “Soft Drinks”: could be better, but overall okay.', 89),
(64, 4, 9.6, '2025-05-26 18:02:09', 'Review #1 for “Strawberry”: really enjoyed it!', 92),
(65, 4, 2.2, '2025-05-26 18:02:09', 'Review #2 for “Strawberry”: could be better, but overall okay.', 90),
(66, 2, 9.6, '2025-05-26 18:02:09', 'Review #1 for “Tissue Paper Box”: really enjoyed it!', 94),
(67, 2, 3.6, '2025-05-26 18:02:09', 'Review #2 for “Tissue Paper Box”: could be better, but overall okay.', 93),
(68, 2, 9.9, '2025-05-26 18:02:09', 'Review #1 for “Water”: really enjoyed it!', 98),
(69, 4, 5, '2025-05-26 18:02:09', 'Review #2 for “Water”: could be better, but overall okay.', 96);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `api_key` char(32) NOT NULL COMMENT 'using api keys with 2^5 characters, candidate key',
  `password` varchar(255) NOT NULL COMMENT 'store hashed passwords for safety',
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `fname`, `lname`, `api_key`, `password`, `email`) VALUES
(1, 'John', 'User', 'f1c509ebc0e70ab2eb1a149da0e82370', '$2y$10$0ocvRByDEqLnKP57MLRssu6ly.0ptmt9ONe0hcQmCUS.mcy8oxL62', 'johnuser@example.com'),
(2, 'Frikkie', 'du Plessis', '526ae9614c6834e4ff56a19a2fa4321f', '$2y$10$t4smSvInr7xhUiG0AbIg.OG/Eey8LXyperaxosoKRrWzJKeLasFxK', 'fdp@afarm.com'),
(3, 'Davis', 'James', '5ad235a65c600de4ec725e5de63b8764', '$2y$10$C3dLUsdUcNnQ5CtBRyIkuOZ7D2iqxJgwocvhRQvUSF9E47oZp/01y', 'u123@gmail.com'),
(4, 'Steve', 'Dolph', '712cb3b25d6ab338b49f95ed11ccdca8', '$2y$10$cedaStxpv5WcVEMj/yFGC.8PV9yNR5h4oZtN3oEHOtQUXlkZUrZ.m', 'u1234@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `vendor_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `website_url` varchar(50) NOT NULL,
  `categories` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`vendor_id`, `name`, `website_url`, `categories`) VALUES
(1, 'Amazon', 'https://www.amazon.com', 'electronics,clothing,home,beauty,groceries'),
(2, 'eBay', 'https://www.ebay.com', 'electronics,clothing,home,beauty,collectibles'),
(3, 'Walmart', 'https://www.walmart.com', 'groceries,home,clothing,beauty,furniture'),
(4, 'Target', 'https://www.target.com', 'clothing,home,beauty,groceries,kids'),
(5, 'Alibaba', 'https://www.alibaba.com', 'electronics,clothing,home,business'),
(6, 'AliExpress', 'https://www.aliexpress.com', 'electronics,clothing,jewelry,home'),
(7, 'Etsy', 'https://www.etsy.com', 'crafts,home,clothing,jewelry'),
(8, 'Best Buy', 'https://www.bestbuy.com', 'electronics,home-theater,appliances'),
(9, 'Newegg', 'https://www.newegg.com', 'electronics,computer-components,accessories'),
(10, 'Flipkart', 'https://www.flipkart.com', 'electronics,clothing,home,books'),
(11, 'Takealot', 'https://www.takealot.com', 'electronics,clothing,home,beauty,groceries'),
(12, 'Makro', 'https://www.makro.co.za', 'groceries,home,beauty,electronics'),
(13, 'Bidorbuy', 'https://www.bidorbuy.co.za', 'electronics,clothing,collectibles'),
(14, 'Incredible Connections', 'https://www.incredible.co.za', 'computers,computer-components,accessories'),
(15, 'Computer Mania', 'https://www.computermania.co.za', 'computers,computer-components,accessories'),
(16, 'HiFi Corp', 'https://www.hificorp.co.za', 'electronics,home-audio,TVs'),
(17, 'Pick n Pay', 'https://www.pnp.co.za', 'groceries,home,health'),
(18, 'Checkers', 'https://www.checkers.co.za', 'groceries,home,beauty'),
(19, 'Woolworths', 'https://www.woolworths.co.za', 'clothing,home,beauty,food'),
(20, 'Dis-Chem', 'https://www.dischem.co.za', 'health,beauty,wellness'),
(21, 'Clicks', 'https://www.clicks.co.za', 'health,beauty,wellness'),
(22, 'Mr Price', 'https://www.mrprice.com', 'clothing,home,accessories'),
(23, 'Sportsmans Warehouse', 'https://www.sportsmanswarehouse.co.za', 'sport,outdoor,fitness'),
(24, 'Yuppiechef', 'https://www.yuppiechef.com', 'kitchen,home,appliances');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `Wish_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Listing_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`user_id`,`admin_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `customer_id_UNIQUE` (`customer_id`);

--
-- Indexes for table `listing`
--
ALTER TABLE `listing`
  ADD PRIMARY KEY (`listing_id`),
  ADD KEY `fk_product` (`product_id`),
  ADD KEY `fk_vendor` (`vendor_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `fk_user_id` (`user_id`),
  ADD KEY `fk_listings` (`listing_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `api_key_UNIQUE` (`api_key`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`vendor_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`Wish_ID`),
  ADD KEY `fk_users` (`User_ID`),
  ADD KEY `fk_listing` (`Listing_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `Wish_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `listing`
--
ALTER TABLE `listing`
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vendor` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `fk_listings` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`listing_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `fk_listing` FOREIGN KEY (`Listing_ID`) REFERENCES `listing` (`listing_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_users` FOREIGN KEY (`User_ID`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
