SELECT SPLIT_PART(UNNEST(email_addresses),'@',2) as email_address, count(*) as emailcount 
FROM contact_list 
GROUP BY email_address 
ORDER BY emailcount DESC