-- auto-generated definition
create table st_smart_wechat_unbundl_hm
(
  chg_sn         varchar(64)  not null
  comment '�����ˮ��',
  USER_ID        bigint       null
  comment '�û���ʶ',
  PHONE_NO       varchar(11)  null
  comment '�绰����',
  USER_STATE     varchar(10)  null
  comment '�û�״̬���ʱ��',
  STATE_CHG_TIME datetime     null,
  CHG_ORG_ID     varchar(512) null
  comment '�����֯������ʶ',
  SEND_FLAG      int          null
  comment '���ͱ��',
  STAT_MONTH     varchar(6)   null
  comment 'ͳ����',
  STAT_DATE      varchar(8)   null
  comment 'ͳ����',
  STAT_HOUR      varchar(10)  null
  comment 'ͳ��Сʱ',
  constraint ST_SMART_WECHAT_UNBUNDL_HM_chg_sn_uindex
  unique (chg_sn)
)
  comment '���΢�Ž���û�Сʱ��';

alter table st_smart_wechat_unbundl_hm
  add primary key (chg_sn);

