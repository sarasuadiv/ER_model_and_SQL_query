select a.model, a.brand_name, b.group_name, c.purchase_date, c.car_plate, c.km, d.color_name,
e.company_name, e.policy_number
from practica_sarasuadi_vargas.brands as a
join practica_sarasuadi_vargas.brand_groups as b on a.id_group = b.id_group
join practica_sarasuadi_vargas.vehicles as c on a.id_vehicle = c.id_vehicle
join practica_sarasuadi_vargas.colors as d on c.id_color = d.id_color
join practica_sarasuadi_vargas.insurances as e on c.id_insurance = e.id_insurance