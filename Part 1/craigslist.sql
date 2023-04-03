-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY NOT NULL,
    username VARCHAR(15) NOT NULL,
    preferred_region_id INT REFERENCES regions(id) NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    text VARCHAR(500) NOT NULL,
    user_id INT REFERENCES users(id) NOT NULL,
    location TEXT NOT NULL,
    region_id INT REFERENCES regions(id) NOT NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE categories_posts (
    post_id INT REFERENCES posts(id),
    category_id INT REFERENCES categories(id)
);

INSERT INTO regions (name)
VALUES
    ('Atlanta, Georgia, USA'), 
    ('London, England, UK'),
    ('Tokyo, Japan');

INSERT INTO users (username, preferred_region_id)
VALUES 
    ('FrostyBee', 1),
    ('NeonSpiral', 2),
    ('CosmicTurtle', 3);

INSERT INTO posts (
    title, 
    text, 
    user_id, 
    location, 
    region_id
)
VALUES
    ('Modern Loveseat in Excellent Condition', 'Modern Loveseat in Excellent Condition: This beautiful loveseat is the perfect addition to any modern living room. It features a sleek, minimalist design with clean lines and plush cushions for maximum comfort. The neutral gray fabric is both stylish and versatile, making it easy to match with any decor. This loveseat has been lightly used and is in excellent condition, with no stains or tears. Dont miss out on this great opportunity to upgrade your living space!', 3, '33.7490° N, 84.3880° W', 1),
    ('Brand New iPhone 13 Pro for Sale', 'Brand New iPhone 13 Pro for Sale: Get the latest and greatest iPhone with this brand new iPhone 13 Pro! This top-of-the-line device is packed with features like a stunning OLED display, triple-lens camera system, and 5G connectivity. With 128GB of storage, youll have plenty of space to store all your photos, videos, and apps. This phone is unlocked and can be used with any carrier. It comes in the original box with all accessories included. Dont wait - grab this amazing deal today!', 2,  '51.5074° N, 0.1278° W ', 2),
    ('Spacious 1BR Apartment with Stunning Views', 'Enjoy breathtaking views from this spacious 1BR apartment! Located on the 20th floor, this unit offers panoramic views of the city skyline and the surrounding mountains. The open floor plan features a large living room, dining area, and modern kitchen with stainless steel appliances. The bedroom is bright and airy, with plenty of closet space. The building amenities include a fitness center, pool, and 24-hour concierge service. This is the perfect place to call home in the heart of the city.',  1,  '35.6895° N, 139.6917° E',  1);

INSERT INTO categories (name)
VALUES
    ('Furniture'),
    ('Electronics'),
    ('Clothing & Accessories'),
    ('Home & Garden'),
    ('Sports & Outdoors'),
    ('Toys & Games'),
    ('Books & Magazines'),
    ('Jewelry & Watches'),
    ('Musical Instruments'),
    ('Tools & Equipment');

INSERT INTO categories_posts (post_id, category_id)
VALUES 
    (1, 1),
    (1, 4),
    (2, 2),
    (3, 4);