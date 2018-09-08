
-- 客户基本信息表
drop table if exists kapp_khjbxx;
create table kapp_khjbxx (
   zhjlx  varchar (14) null comment '证件类型',	
   kehuhao  varchar (14) null comment '客户号',	
   kehuzhanghao  varchar (20) null comment '客户账号'	
) 
;
	alter table kapp_khjbxx add constraint pk_kapp_khjbxx primary key (kehuhao,kehuzhanghao);
