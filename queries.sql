-- Dropping tables if they exist
drop table if exists video_analytics; 
drop table if exists trending_videos; 
drop table if exists channel_catalog; 
drop table if exists category_catalog; 

-- Creating "trending_videos" table
create table trending_videos(
    video_id varchar primary key not null,
    title varchar not null,
    channel_id int not null,
    category_id int not null,
    publish_time date not null,
    description varchar,
    thumbnail_link varchar not null);

-- Creating "video_analytics" table
create table video_analytics(
    video_id varchar not null,
    views int not null,
    likes int not null,
    dislikes int not null,
    comment_count int not null,
    comments_disabled boolean not null,
    ratings_disabled boolean not null,
    video_error_or_removed boolean not null,
    country_name varchar not null);

-- Creating "channel_catalog" table
CREATE TABLE channel_catalog(
    channel_id int primary key not null,
    channel_title varchar not null);

-- Creating "category_catalog" table
CREATE TABLE category_catalog(
    category_id int primary key not null,
    category_name varchar not null);
	
ALTER TABLE trending_videos 
ADD CONSTRAINT fk_trending_videos_channel_id 
FOREIGN KEY(channel_id)
REFERENCES channel_catalog (channel_id);

ALTER TABLE trending_videos
ADD CONSTRAINT fk_trending_videos_category_id 
FOREIGN KEY(category_id)
REFERENCES category_catalog (category_id);

ALTER TABLE video_analytics
ADD CONSTRAINT fk_video_analytics_video_id 
FOREIGN KEY(video_id)
REFERENCES trending_videos (video_id);

-- Checking channel catalog data loading 
select * from channel_catalog; 

-- Checking category catalog data loading 
select * from category_catalog; 

-- Checking trending_videos data loading 
select * from trending_videos;

-- Checking analytics data loading 
select * from video_analytics;