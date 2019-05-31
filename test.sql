路径
cd /data/cif/omp-cif/log/cifBat/busi/20190201/lskhif

-- 查询同步联社的记录数
select count(*) from cif_union_record;

-- 查询未同步联社的记录数
select count(*) from cif_cust_base where lskhid is null or lskhid = '';

-- 查询同步联社失败的sql
select count(*) from cif_union_record where status <> '1';

-- 查询同步联社失败的原因sql
select distinct(erorcd) from cif_union_record;