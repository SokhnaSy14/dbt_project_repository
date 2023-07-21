{{ config(materialized='view') }}

with source_data as (
   select * from(
    select albums."AlbumId", "Title", count(tracks."TrackId") as tracks_count from {{source("chinook","albums")}}
    join {{source("chinook","tracks")}}
    on albums."AlbumId"=tracks."AlbumId"
    group by albums."AlbumId", "Title" )tab

    order by tracks_count

) 


select * from source_data