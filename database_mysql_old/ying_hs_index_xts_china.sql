SELECT * FROM ying.hs_index_xts_china;

SELECT * FROM ying.hs_index_xts_china order by date desc, code_index;

update ying.hs_index_xts_china set date = '2015-09-30' where date = '2015-10-02'; 