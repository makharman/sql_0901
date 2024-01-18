--Создать функцию, которая принимает на вход имя сотрудника и возвращает всю информацию о нем из таблицы employees

CREATE OR REPLACE FUNCTION employee_info(employee_name VARCHAR)
RETURNS TABLE (
    employee_id INT,
    first_name VARCHAR,
    last_name VARCHAR,
    birth_date DATE,
    city VARCHAR
)
AS $$
    SELECT
        employee_id,
        first_name,
        last_name,
        birth_date,
        city
    FROM employees
    WHERE first_name = employee_name OR last_name = employee_name;

$$ LANGUAGE SQL;


SELECT * FROM employee_info('Nancy');
