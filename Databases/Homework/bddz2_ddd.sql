
1) ƒл€ каждого сотрудника вывести год его трудоустройства, а также количество проработанных лет, округленных до года

SELECT last_name, start_date, trunc(months_between(sysdate, start_date)/12) "Months of work"
FROM S_EMP;

2) ќпределите день недели ¬ашего дн€ рождени€

SELECT to_char(to_date('23.05.1996', 'dd.mm.yyyy'), 'Day') "Day of birth"
FROM DUAL;

3) »спользу€ функцию текущей даты и свою дату рождени€, определите количество лет, мес€цев и дней ¬ашего возраста (19 лет, 7 мес., 23 дн€)

SELECT 
trunc((sysdate-to_date('23.05.1996', 'dd.mm.yyyy'))/365) Years,

trunc((((sysdate-to_date('23.05.1996', 'dd.mm.yyyy'))/365 - trunc((sysdate-to_date('23.05.1996', 'dd.mm.yyyy'))/365))*365)/31) Months,

trunc(((((sysdate-to_date('23.05.1996', 'dd.mm.yyyy'))/365 - trunc((sysdate-to_date('23.05.1996', 'dd.mm.yyyy'))/365))*365)/31 - trunc((((sysdate-to_date('23.05.1996', 'dd.mm.yyyy'))/365 - trunc((sysdate-to_date('23.05.1996', 'dd.mm.yyyy'))/365))*365)/31))*31) Days
FROM DUAL;
