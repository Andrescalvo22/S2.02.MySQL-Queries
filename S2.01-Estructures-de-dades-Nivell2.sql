CREATE DATABASE youtube;
USE youtube;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    birthdate DATE NOT NULL,
    sex ENUM('Male', 'Female', 'Other') NOT NULL,
    country VARCHAR(20) NOT NULL,
    postal_code VARCHAR(10) NOT NULL
);

CREATE TABLE videos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(50) NOT NULL,
    description VARCHAR(150) NOT NULL,
    size BIGINT NOT NULL,
    archive_name VARCHAR(50) NOT NULL,
    duration INT NOT NULL,
    thumbnail VARCHAR(250) NOT NULL,
    views INT NOT NULL,
    publish_date DATETIME NOT NULL,
    status ENUM('public', 'private', 'hidden'),
    FOREIGN KEY (user_id)
        REFERENCES users (id)
);

CREATE TABLE tags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE video_tags (
    video_id INT,
    tag_id INT,
    PRIMARY KEY (video_id , tag_id),
    FOREIGN KEY (video_id)
        REFERENCES videos (id),
    FOREIGN KEY (tag_id)
        REFERENCES tags (id)
);

CREATE TABLE channels (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(150) NOT NULL,
    creation_date DATE NOT NULL,
    FOREIGN KEY (user_id)
        REFERENCES users (id)
);

CREATE TABLE subscriptions (
    user_id INT,
    channel_id INT,
    subscription_date DATE NOT NULL,
    PRIMARY KEY (user_id , channel_id),
    FOREIGN KEY (user_id)
        REFERENCES users (id),
    FOREIGN KEY (channel_id)
        REFERENCES channels (id)
);

CREATE TABLE playlist (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(150) NOT NULL,
    creation_date DATE NOT NULL,
    status ENUM('public', 'private'),
    FOREIGN KEY (user_id)
        REFERENCES users (id)
);

CREATE TABLE playlist_video (
    playlist_id INT,
    video_id INT,
    PRIMARY KEY (playlist_id , video_id),
    FOREIGN KEY (playlist_id)
        REFERENCES playlist (id),
    FOREIGN KEY (video_id)
        REFERENCES videos (id)
);

CREATE TABLE likes_dislikes (
    user_id INT,
    video_id INT,
    like_dislike_date DATETIME NOT NULL,
    type ENUM('like', 'dislike') NOT NULL,
    PRIMARY KEY (user_id , video_id),
    FOREIGN KEY (user_id)
        REFERENCES users (id),
    FOREIGN KEY (video_id)
        REFERENCES videos (id)
);

CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    video_id INT,
    text VARCHAR(150) NOT NULL,
    comment_date DATETIME NOT NULL,
    FOREIGN KEY (user_id)
        REFERENCES users (id),
    FOREIGN KEY (video_id)
        REFERENCES videos (id)
);

CREATE TABLE like_dislike_comments (
    user_id INT,
    comment_id INT,
    like_dislike_date DATETIME NOT NULL,
    type ENUM('like', 'dislike'),
    PRIMARY KEY (user_id , comment_id),
    FOREIGN KEY (user_id)
        REFERENCES users (id),
    FOREIGN KEY (comment_id)
        REFERENCES comments (id)
);





