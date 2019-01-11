-- auto-generated definition
create table st_smart_wechat_unbundl_hm
(
  chg_sn         varchar(64)  not null
  comment '变更流水号',
  USER_ID        bigint       null
  comment '用户标识',
  PHONE_NO       varchar(11)  null
  comment '电话号码',
  USER_STATE     varchar(10)  null
  comment '用户状态变更时间',
  STATE_CHG_TIME datetime     null,
  CHG_ORG_ID     varchar(512) null
  comment '变更组织机构标识',
  SEND_FLAG      int          null
  comment '发送标记',
  STAT_MONTH     varchar(6)   null
  comment '统计月',
  STAT_DATE      varchar(8)   null
  comment '统计日',
  STAT_HOUR      varchar(10)  null
  comment '统计小时',
  constraint ST_SMART_WECHAT_UNBUNDL_HM_chg_sn_uindex
  unique (chg_sn)
)
  comment '灵鉴微信解绑用户小时表';

alter table st_smart_wechat_unbundl_hm
  add primary key (chg_sn);

