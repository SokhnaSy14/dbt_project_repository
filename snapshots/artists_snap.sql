{% snapshot artists_snap %}

    {{
        config(
          target_schema='snapshots',
          strategy='check',
          unique_key='ArtistId',
          check_cols= 'all',
        )
    }}

    select * from {{ source('chinook', 'artists') }}

{% endsnapshot %}