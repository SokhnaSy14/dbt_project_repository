with source_data as(
    select "Name", "AlbumId", "MediaTypeId", "Composer" as composer from {{source("chinook","tracks")}}
),

final as (select * from source_data where Upper(composer) like '%SMITH%' and 
"MediaTypeId" between 1 and 10)

select * from final