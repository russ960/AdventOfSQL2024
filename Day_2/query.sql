SELECT * INTO #results FROM (
SELECT id, value, CHAR(value) AS letter FROM letters_a 
WHERE value BETWEEN ASCII('a') AND ASCII('z') 
OR value BETWEEN ASCII('A') AND ASCII('Z')
OR value IN (
ASCII(' '),
ASCII('!'),
ASCII('"'),
ASCII(''''),
ASCII('('),
ASCII(')'),
ASCII(','),
ASCII('-'),
ASCII('.'),
ASCII(':'),
ASCII(';'),
ASCII('?')
)
UNION
SELECT id, value, CHAR(value) AS letter FROM letters_b
WHERE value BETWEEN ASCII('a') AND ASCII('z') 
OR value BETWEEN ASCII('A') AND ASCII('Z')
OR value IN (
ASCII(' '),
ASCII('!'),
ASCII('"'),
ASCII(''''),
ASCII('('),
ASCII(')'),
ASCII(','),
ASCII('-'),
ASCII('.'),
ASCII(':'),
ASCII(';'),
ASCII('?')
)) a


DECLARE @Message VARCHAR(MAX)
SELECT @Message = COALESCE(@Message,'') + letter FROM #results
SELECT @Message