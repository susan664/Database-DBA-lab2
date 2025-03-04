-- Qn.1 to find the total number of invoices in the invoices table.
SELECT COUNT(*) AS total_invoices
FROM invoices;
-- Qn.2 a query to determine the total amount of all invoices.
SELECT SUM(invoice_total) AS total_invoice_amount
FROM invoices;
-- Qn.3 to find the average invoice total for all invoices.
SELECT AVG(invoice_total) AS average_invoice_total
FROM invoices;
-- Qn.4 to find the highest and lowest invoice totals from the invoices table.
SELECT MAX(invoice_total) AS highest_invoice_total,
       MIN(invoice_total) AS lowest_invoice_total
FROM invoices;
-- Qn.5  a query to find the total amount paid (payment_total) by each vendor and displaying vendor id and total amount paid
SELECT vendor_id,
       SUM(payment_total) AS total_amount_paid
FROM invoices
GROUP BY vendor_id
ORDER BY total_amount_paid DESC;
-- Qn.6 to list the total number of invoices and the total invoice amount grouped by vendor id and display the vendor id,number of invoices, total invoice amount.
 SELECT vendor_id,
       COUNT(*) AS invoice_count,
       SUM(invoice_total) AS total_invoice_amount
FROM invoices
GROUP BY vendor_id
ORDER BY total_invoice_amount DESC;
-- Qn.7 to find the total line item amount for each general ledger account and display account number along with the total line item amount.
SELECT 
    account_number, 
    SUM(line_item_amount) AS total_line_item_amount
FROM invoice_line_items
GROUP BY account_number
ORDER BY total_line_item_amount DESC;
-- Qn.8 a query using the ROLLUP extension in GROUP BY to display the total invoice amount for each vendor, including a grand total.
SELECT 
    vendor_id, 
    SUM(invoice_total) AS total_invoice_amount
FROM invoices
GROUP BY vendor_id WITH ROLLUP
ORDER BY vendor_id ASC;
-- Ap shcema is used for this asignment.