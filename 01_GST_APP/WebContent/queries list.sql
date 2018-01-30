Invoice LIST PAGE VIEW 
 
invoice-list.jsp
  
CREATE VIEW V_INV_LIST_PENDING_SHW
Select
    i.id as invoiceNo, id.id as idDetails, i.invoice_print_date, i.subtotal, i.clientid as clntId, i.grossamount, i.challn_no,
    i.cgst_amnt, i.sgst_amnt, i.igst_amnt, i.print_status, i.outward_status,
    i.updatedTime, id.invoiceId, id.printed,
    cm.id, cm.client_id, cm.company_name, i.clientId
from
  Invoice i LEFT OUTER JOIN invoicedetails id
  ON i.id = id.invoiceId, client_master cm
where
  i.clientid = cm.id and
  i.invoice_print_date >= DATE_ADD(now(), INTERVAL -1 QUARTER)
GROUP BY i.id

================================================================================

Payment history page view

salespayhistory.jsp

CREATE VIEW SALES_PAY_HISTORY
AS
SELECT
  pd.idsales_pay_details, pd.client_code, pd.payment_mode, pd.cheque_no, pd.pay_made_date,
  pd.PaymentAmount, pd.invoiceId, pd.balance_amnt, pd.createdTime, pd.deletestatus,
  cm.id as uid, cm.client_id, cm.company_name
  FROM sales_pay_details pd, client_master cm
where
  pd.client_code = cm.id and
  pd.createdTime >= DATE_ADD(now(), INTERVAL -1 QUARTER);