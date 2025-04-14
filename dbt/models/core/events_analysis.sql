{{
    config(
        materialized='table'
    )
}}

with analysis_table as
( 
    select * from {{ ref("fact_events") }}
)
select
    GLOBALEVENTID,
    Event_Date,
    EventCode_type,
    EventRootCode_type,
    CountryCode,
    Source_Domain,
    sum(NumArticles) as Num_of_Articles,
    sum(NumMentions) as Num_of_Mentions,
    sum(NumSources) as Num_of_Sources,
    avg(AvgTone) as Average_Tone,
    avg(GoldsteinScale) as Avg_Goldstein_Stability
from analysis_table
group by 1,2,3,4,5,6