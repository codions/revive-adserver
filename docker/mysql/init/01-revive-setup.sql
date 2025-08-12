-- Revive Adserver MySQL initialization script
-- This script optimizes MySQL settings for Revive Adserver

-- Set character set and collation for proper UTF-8 support
SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Create database with proper character set if it doesn't exist
CREATE DATABASE IF NOT EXISTS revive CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Grant privileges for better compatibility
GRANT ALL PRIVILEGES ON revive.* TO 'revive'@'%';
FLUSH PRIVILEGES;

-- Optimize MySQL settings for Revive Adserver (MySQL 8.0 compatible)
SET GLOBAL sql_mode = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- Note: innodb_large_prefix, innodb_file_format are deprecated in MySQL 8.0
-- innodb_file_per_table is ON by default in MySQL 8.0