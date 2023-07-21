with source_data as (
select * from {{source("chinook", "tracks")}}
    
),

final as (
    select  "TrackId", "Name", "AlbumId", "MediaTypeId", "GenreId", "Milliseconds", "Bytes" FROM source_data
    where "Milliseconds" between 180000 and 240000
    and "Bytes" >  6600000
    
)

select * from final