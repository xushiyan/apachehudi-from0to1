create table hudi_mor_example (
  id int,
  name string,
  price double,
  ts bigint
) using hudi
tblproperties (
  type = 'mor',
  primaryKey = 'id',
  preCombineField = 'ts'
) location '/tmp/hudi_mor_example';

set hoodie.spark.sql.insert.into.operation=UPSERT;
insert into hudi_mor_example select 1, 'foo', 10, 1000;
insert into hudi_mor_example select 1, 'foo', 20, 2000;
insert into hudi_mor_example select 1, 'foo', 30, 3000;
