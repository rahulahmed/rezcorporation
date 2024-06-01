SELECT MSISDN, OTP FROM SW_TBL_JSONRX_REGISTRATION WHERE MSISDN =8801945057430    ---OTP---

 
SELECT * FROM SW_TBL_JSONRX_REGISTRATION WHERE MSISDN = 8801778318062    ---version check----


SELECT * FROM SW_TBL_PROFILE_MERCHANT WHERE MSISDN = 8801303421621

select * from data_sync_log where MSISDN = 8801710372898    --data migration--

--delete FROM data_sync_log WHERE MSISDN =8801771885304--      -----caution delete command-----

to check wallet balance

select * FROM SW_TBL_WALLET WHERE Wallet_MSISDN =8801732903688    ---wallet balance---

SELECT * FROM SW_TBL_TRANSACTION_DETAILS where Dest_Wallet_ID= 8801975150390

select * from SW_TBL_TRANSACTION_DETAILS WHERE Source_Wallet_ID =8801945057430 AND Dest_Wallet_ID= 8801714972491

SELECT * FROM sheba.topup_orders WHERE status = 'Attempted' AND DATE(created_at) = '2024-05-13

SELECT * FROM sw_tbl_transaction_details WHERE Source_Wallet_ID=8801824846964 and keyword='SUBC'

select * from TopupHistory
select * from SW_TBL_PROFILE_MERCHANT
