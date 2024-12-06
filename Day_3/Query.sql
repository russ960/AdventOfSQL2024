CREATE TABLE #GuestCounts (id INT, Guest_Count INT)
INSERT INTO #GuestCounts SELECT id, 
COALESCE(menu_data.value('(/northpole_database/*/event_metadata/dinner_details/guest_registry/total_count)[1]', 'INT'), 
menu_data.value('(/christmas_feast/organizational_details/attendance_record/total_guests)[1]', 'INT'), 
menu_data.value('(/polar_celebration/*/participant_metrics/attendance_details/headcount/total_present)[1]', 'INT'),'') AS Guest_Count
FROM christmas_menus

CREATE TABLE #fooditems (id int)

INSERT INTO #fooditems SELECT c.value('.', 'INT') as value  
FROM christmas_menus cm
CROSS APPLY menu_data.nodes('/christmas_feast/organizational_details/menu_registry/course_details/dish_entry/food_item_id') t(c)
WHERE cm.id IN (SELECT id FROM #GuestCounts WHERE Guest_Count > 78);

INSERT INTO #fooditems SELECT c.value('.', 'INT') as value  
FROM christmas_menus  cm
CROSS APPLY menu_data.nodes('/northpole_database/annual_celebration/event_metadata/menu_items/food_category/food_category/dish/food_item_id') t(c)
WHERE cm.id IN (SELECT id FROM #GuestCounts WHERE Guest_Count > 78);

INSERT INTO #fooditems SELECT c.value('.', 'INT') as value  
FROM christmas_menus  cm
CROSS APPLY menu_data.nodes('/polar_celebration/event_administration/culinary_records/menu_analysis/item_performance/food_item_id') t(c)
WHERE cm.id IN (SELECT id FROM #GuestCounts WHERE Guest_Count > 78);

SELECT menu_data.query('/polar_celebration/event_administration/culinary_records/menu_analysis/item_performance/food_item_id')
FROM christmas_menus 

SELECT id, COUNT(*) itemcount FROM #fooditems GROUP BY id  ORDER BY itemcount DESC 
