-- 1) Get all invoices where the unit_price on the invoice_line is greater than $0.99.
SELECT *
FROM invoice i --'i' is short hand for 'invoice' 
JOIN invoice_line il ON il.invoice_id = i.invoice_id
WHERE il.unit_price > 0.99;

--2)Get the invoice_date, customer first_name and last_name, and total from all invoices.
SELECT invoice_date, first_name, last_name, total
FROM invoice i
JOIN customer ON i.customer_id= customer.customer_id;

--3)Get the customer first_name and last_name and the support rep's first_name and last_name from all customers.

SELECT cust.first_name, cust.last_name, emp.first_name, emp.last_name
FROM employee emp
JOIN customer cust ON emp.employee_id= cust.support_rep_id;

--4)Get the album title and the artist name from all albums.
SELECT alb.title, art.name
FROM album alb
JOIN artist art ON alb.artist_id = art.artist_id;

--5) Get all playlist_track track_ids where the playlist name is Music.
SELECT playlist_track_id
FROM playlist_track pt
JOIN playlist pl ON pt.playlist_id = pl.playlist_id
WHERE pl.name = 'Music' ;

--6)Get all track names for playlist_id 5.
-- SELECT name
-- FROM playlist
-- WHERE playlist_id = 5 ;

SELECT trk.name
FROM playlist_track plt
JOIN track trk ON plt.track_id= trk.track_id
WHERE plt.playlist_id = 5 ;

--7)Get all track names and the playlist names that those track names are on ( 2 joins ).
SELECT t.name, p.name --get all the track names and playlist names
FROM track t --from the track table
JOIN playlist_track pt ON t.track_id = pt.track_id -- and join those track names with the playlist track name using id's
JOIN playlist p ON pt.playlist_id = p.playlist_id; -- also check the playlist table for track names and playlist names as well.
-- so we basically have to search all the tables for related data (track and playlist names) by identifying ALL tables (not just two) that would contain that sort of information.
-- 2 joins means there are three tables that we need.

--8) Get all track names and album titles that are the genre Alternative & Punk ( 2 joins ).
SELECT trk.name, alb.title
FROM track trk
JOIN album alb ON alb.album_id = trk.album_id
JOIN genre gn ON gn.genre_id = trk.genre_id
WHERE gn.name = 'Alternative & Punk';

--Nested Data

--1) Get all invoices where the unit_price on the invoice_line is greater than $0.99.
SELECT *
FROM invoice 
WHERE invoice_id IN (SELECT invoice_id 
                  FROM invoice_line 
                  WHERE unit_price > 0.99);

--2) Get all playlist tracks where the playlist name is Music.
SELECT *
FROM playlist_track pltrkSELECT *
FROM playlist_track pltrk
WHERE playlist_id IN (SELECT playlist_id
                  FROM playlist 
                  WHERE name = 'Music');
