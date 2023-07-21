with source_data as (

    select * from  tracks
),

final as (
    SELECT *
    FROM source_data
)

select * from final


