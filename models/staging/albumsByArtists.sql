{{ config(materialized='table') }}

WITH source_artist AS (

SELECT * FROM {{ source("chinook","artists") }}

),
source_albums AS (

SELECT * FROM {{ source("chinook","albums") }}

),
data_join AS (

SELECT source_artist."ArtistId", source_artist."Name", source_albums."AlbumId", source_albums."Title"
FROM source_artist
JOIN source_albums 
ON source_artist."ArtistId" = source_albums."ArtistId"

)

SELECT * FROM data_join