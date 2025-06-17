-- 游戏市场分析数据库
-- 创建数据库
CREATE DATABASE IF NOT EXISTS game_market CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE game_market;

-- 游戏基本信息表
CREATE TABLE IF NOT EXISTS game_info (
    game_id INT PRIMARY KEY AUTO_INCREMENT,
    game_name VARCHAR(100) NOT NULL COMMENT '游戏名称',
    game_type VARCHAR(50) NOT NULL COMMENT '游戏类型（角色扮演/射击/策略等）',
    publisher VARCHAR(50) NOT NULL COMMENT '发行商名称',
    release_date DATE COMMENT '发行日期',
    platform VARCHAR(30) COMMENT '支持平台（PC/手机/主机等）',
    INDEX idx_game_type (game_type),
    INDEX idx_publisher (publisher)
);

-- 市场收入表
CREATE TABLE IF NOT EXISTS market_revenue (
    id INT PRIMARY KEY AUTO_INCREMENT,
    game_id INT NOT NULL COMMENT '关联游戏ID',
    revenue DECIMAL(15, 2) NOT NULL COMMENT '收入金额（美元）',
    date DATE NOT NULL COMMENT '收入日期',
    region VARCHAR(50) NOT NULL COMMENT '收入地区（全球/中国/北美等）',
    FOREIGN KEY (game_id) REFERENCES game_info(game_id),
    INDEX idx_date (date),
    INDEX idx_region (region)
);

-- 用户画像表
CREATE TABLE IF NOT EXISTS user_profile (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    age INT COMMENT '年龄',
    gender VARCHAR(10) COMMENT '性别',
    region VARCHAR(50) COMMENT '地区',
    favorite_type VARCHAR(50) COMMENT '偏好游戏类型',
    spending_level VARCHAR(20) COMMENT '消费等级（低/中/高）',
    INDEX idx_age (age),
    INDEX idx_gender (gender),
    INDEX idx_favorite_type (favorite_type)
);

-- 游戏评分表（新增）
CREATE TABLE IF NOT EXISTS game_rating (
    id INT PRIMARY KEY AUTO_INCREMENT,
    game_id INT NOT NULL COMMENT '关联游戏ID',
    platform VARCHAR(20) NOT NULL COMMENT '评分平台',
    score DECIMAL(3, 1) NOT NULL COMMENT '评分（0-10分）',
    votes INT NOT NULL COMMENT '投票数',
    review_date DATE NOT NULL COMMENT '评分日期',
    FOREIGN KEY (game_id) REFERENCES game_info(game_id),
    INDEX idx_score (score),
    INDEX idx_review_date (review_date)
);

-- 插入示例数据
INSERT INTO game_info (game_name, game_type, publisher, release_date, platform) VALUES
('原神', '角色扮演', '米哈游', '2020-09-28', 'PC/手机/主机'),
('英雄联盟', 'MOBA', 'Riot Games', '2009-10-27', 'PC'),
('王者荣耀', 'MOBA', '腾讯游戏', '2015-11-26', '手机'),
('塞尔达传说：王国之泪', '冒险', '任天堂', '2023-05-12', '主机'),
('使命召唤：现代战争2', '射击', '动视暴雪', '2022-10-28', 'PC/主机'),
('赛博朋克2077', '角色扮演', 'CD Projekt Red', '2020-12-10', 'PC/主机');

INSERT INTO market_revenue (game_id, revenue, date, region) VALUES
(1, 250000000.00, '2024-01-31', '全球'),
(1, 80000000.00, '2024-01-31', '中国'),
(2, 120000000.00, '2024-01-31', '全球'),
(3, 180000000.00, '2024-01-31', '全球'),
(4, 320000000.00, '2024-01-31', '全球'),
(5, 150000000.00, '2024-01-31', '全球'),
(6, 90000000.00, '2024-01-31', '全球');

INSERT INTO user_profile (age, gender, region, favorite_type, spending_level) VALUES
(22, '男', '中国', '角色扮演', '高'),
(28, '男', '美国', '射击', '中'),
(34, '女', '日本', '冒险', '高'),
(19, '女', '中国', '模拟', '低'),
(25, '男', '德国', '策略', '中'),
(31, '男', '中国', 'MOBA', '高');

INSERT INTO game_rating (game_id, platform, score, votes, review_date) VALUES
(1, 'PC', 8.5, 12543, '2024-01-31'),
(1, '手机', 8.2, 24156, '2024-01-31'),
(2, 'PC', 8.8, 45678, '2024-01-31'),
(3, '手机', 8.0, 32451, '2024-01-31'),
(4, '主机', 9.7, 8765, '2024-01-31'),
(5, '主机', 8.4, 15678, '2024-01-31'),
(6, 'PC', 8.1, 12345, '2024-01-31');    