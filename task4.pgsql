--Создайте функцию, которая принимает на вход идентификатор сотрудника и новое имя, 
--а затем обновляет имя в таблице employees

CREATE OR REPLACE FUNCTION update_employee_name(employee_id INT, new_name VARCHAR) RETURNS VOID AS $$
    UPDATE employees
    SET first_name = new_name
    WHERE employee_id = employee_id;
$$ LANGUAGE SQL;



SELECT update_employee_name(1, 'Arman');
