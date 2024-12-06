  CREATE TABLE children_demo (
      child_id INT PRIMARY KEY,
      name VARCHAR(100),
      age INT
  );
  CREATE TABLE wish_lists_demo (
      list_id INT PRIMARY KEY,
      child_id INT,
      wishes NVARCHAR(MAX),
      submitted_date DATE
  );
  CREATE TABLE toy_catalogue_demo (
      toy_id INT PRIMARY KEY,
      toy_name VARCHAR(100),
      category VARCHAR(50),
      difficulty_to_make INT
  );

    INSERT INTO children_demo VALUES
  (1, 'Tommy', 8),
  (2, 'Sally', 7),
  (3, 'Bobby', 9);

  INSERT INTO wish_lists_demo VALUES
  (1, 1, '{"first_choice": "bike", "second_choice": "blocks", "colors": ["red", "blue"]}', '2024-11-01'),
  (2, 2, '{"first_choice": "doll", "second_choice": "books", "colors": ["pink", "purple"]}', '2024-11-02'),
  (3, 3, '{"first_choice": "blocks", "second_choice": "bike", "colors": ["green"]}', '2024-11-03');

  INSERT INTO toy_catalogue_demo VALUES
  (1, 'bike', 'outdoor', 3),
  (2, 'blocks', 'educational', 1),
  (3, 'doll', 'indoor', 2),
  (4, 'books', 'educational', 1);