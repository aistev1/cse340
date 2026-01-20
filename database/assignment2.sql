--creating
INSERT INTO account (
  account_firstname,
  account_lastname,
  account_email,
  account_password
)
VALUES (
  'Tony',
  'Stark',
  'tony@starkent.com',
  'Iam1ronM@n'
);

--updating account
UPDATE account
SET account_type = 'Admin'
WHERE account_id = (
  SELECT account_id
  FROM account
  WHERE account_email = 'tony@starkent.com'
);

--deleting
DELETE FROM account
WHERE account_id = (
  SELECT account_id
  FROM account
  WHERE account_email = 'tony@starkent.com'
);

--updating GM Hummer description
UPDATE inventory
SET inv_description = REPLACE(
  inv_description,
  'small interiors',
  'a huge interior'
)
WHERE inv_make = 'GM'
AND inv_model = 'Hummer';

--inner joining for sport
SELECT i.inv_make,
    i.inv_model,
    c.classification_name
FROM inventory i
    INNER JOIN classification c ON i.classification_id = c.classification_id
WHERE c.classification_name = 'Sport';
--image paths for vehicles
UPDATE inventory
SET inv_image = REPLACE(inv_image, '/images/', '/images/vehicles/'),
    inv_thumbnail = REPLACE(inv_thumbnail, '/images/', '/images/vehicles/');