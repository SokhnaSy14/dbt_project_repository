{{ config(materialized='view') }}

with source_data as (
    select albums."AlbumId", count(tracks."TrackId") as "numTracks" from {{source("chinook","albums")}}
    join {{source("chinook","tracks")}}
    on albums."AlbumId"=tracks."AlbumId"
    group by albums."AlbumId"
),

final as (
    select * from source_data where "numTracks" >= 11 and "numTracks" <= 20
    order by "AlbumId"

)

select * from final