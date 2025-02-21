-- Create the 'users' table if it doesn't exist
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    age INT NOT NULL
);

-- Insert dummy data into the 'users' table
INSERT INTO users (name, email, age) VALUES
    ('Arun', 'arun@example.com', 25),
    ('Priya', 'priya@example.com', 30),
    ('Vikram', 'vikram@example.com', 22),
    ('Lakshmi', 'lakshmi@example.com', 28);

-- Verify the data
SELECT * FROM users;
