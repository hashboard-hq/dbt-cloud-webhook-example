select
  oa.attribution_id,
  oa.order_id,
  o.timestamp as order_timestamp,
  oa.touchpoint_id,
  oa.attribution_share,
  oa.attribution_timestamp,
  oa.attribution_model,
  tp.campaign as campaign_id
from {{ ref( "marketing_attribution_data") }} as oa
  left join {{ ref("marketing_touchpoints_data") }} as tp
    on tp.touchpoint_id = oa.touchpoint_id
  left join {{ ref("orders") }} as o
    on o.id = oa.order_id
