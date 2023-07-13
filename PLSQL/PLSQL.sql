create or replace function calc_aluguel(saida date, volta date, aluguel number)
return number
is total number(7,2);
begin   
    total := (saida - volta) * aluguel;
    return total;
end;

create sequence idAluguel start with 1 increment by 1; 

SET SERVEROUTPUT ON;

select * from filme;
select * from empregado;
select * from loja;
select * from cliente;
select * from aluguel;

declare
    saida date := to_date('&data saida', 'DD-MM-YYYY');
    volta date := to_date('&data volta', 'DD-MM-YYYY');
    id_empregado number(3) := &idEmpregado;
    id_cliente number(4) := &idCliente;
    v_quantidade number(3);
    v_total_aluguel number(7,2);
    v_id_video number(5) := &idVideo;
    v_aluguel number(5,2);
    date_ex exception;
    falta exception;
begin   
    select precoaluguel, qntestoque into v_aluguel, v_quantidade from filme where videoid = V_ID_VIDEO;
    if( saida > volta) then
        raise date_ex;
    end if;
    if( v_quantidade = 0) then
        raise falta;
    end if;
    v_total_aluguel := calc_aluguel(saida, volta, v_aluguel);
    DBMS_OUTPUT.PUT_LINE(v_aluguel);
    insert into aluguel values(saida,volta,v_total_aluguel, idAluguel.nextval, ID_CLIENTE, v_ID_VIDEO, ID_EMPREGADO);
    update filme set qntestoque = v_quantidade - 1 where videoid = v_id_video;
    exception
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE('não foi possivel achar algum id inserido');
    when date_ex then
        DBMS_OUTPUT.PUT_LINE('a data da volta deve ser maior que a data da saida');
    when falta then
        DBMS_OUTPUT.PUT_LINE('O produto em questão está em falta');
end;