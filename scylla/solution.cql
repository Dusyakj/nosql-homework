CREATE KEYSPACE IF NOT EXISTS posts_ks
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

USE posts_ks;

CREATE TABLE IF NOT EXISTS posts_by_user (
    user_id int,
    created_at timestamp,
    post_id int,
    username text,
    content text,
    PRIMARY KEY ((user_id), created_at, post_id)
) WITH CLUSTERING ORDER BY (created_at DESC, post_id DESC);

SELECT post_id, content, created_at
FROM posts_by_user
WHERE user_id = ?;

SELECT post_id, content, created_at, username
FROM posts_by_user
WHERE user_id = ?
LIMIT 1;

SELECT post_id, content, created_at
FROM posts_by_user
WHERE user_id = ? AND created_at > ?;

CREATE TABLE IF NOT EXISTS posts_by_topic_day (
    topic_id int,
    post_date date,
    created_at timestamp,
    post_id int,
    user_id int,
    username text,
    PRIMARY KEY ((topic_id, post_date), created_at, post_id)
) WITH CLUSTERING ORDER BY (created_at DESC, post_id DESC);

SELECT user_id, username, post_id, created_at
FROM posts_by_topic_day
WHERE topic_id = ? AND post_date = ?;
