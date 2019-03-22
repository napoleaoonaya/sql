create database onaya;

use onaya;

create table produtos(
	n_id bigint not null auto_increment,
    c_nomeproduto varchar(255) not null,
    n_precoproduto decimal(10,2),
    primary key(n_id)
)engine = InnoDB charset=latin1;


create table vendedor(
		n_id bigint not null auto_increment,
        c_nomevendedor varchar(255) not null,
        n_vendedor_produto bigint not null,
        primary key(n_id),
        constraint foreign key(n_vendedor_produto) references produtos (n_id)
)engine = InnoDB charset=latin1;

insert into produtos (c_nomeproduto,n_precoproduto) values ("Bike Caloi",1200);
insert into produtos (c_nomeproduto,n_precoproduto) values ("Bike Caloi",1200);
insert into produtos (c_nomeproduto,n_precoproduto) values ("Bike Caloi",1200);
insert into produtos (c_nomeproduto,n_precoproduto) values ("Smart tv",1600);
insert into produtos (c_nomeproduto,n_precoproduto) values ("Geladeira Brastemp",1200);
insert into produtos (c_nomeproduto,n_precoproduto) values ("PlayStation 4",2200);
insert into produtos (c_nomeproduto,n_precoproduto) values ("Cama Box",3200);
insert into produtos (c_nomeproduto,n_precoproduto) values ("Guarda Roupa Colônial",4200);
insert into produtos (c_nomeproduto,n_precoproduto) values ("Fogão Elétrico",1800);
insert into produtos (c_nomeproduto,n_precoproduto) values ("Ar Condicionado",1100);
insert into produtos (c_nomeproduto,n_precoproduto) values ("Freezer",2200);
insert into produtos (c_nomeproduto,n_precoproduto) values ("Mesa de Vidro",800);
insert into produtos (c_nomeproduto,n_precoproduto) values ("Máquina de Costura",1100);
insert into produtos (c_nomeproduto,n_precoproduto) values ("XBox One",2300);
insert into produtos (c_nomeproduto,n_precoproduto) values ("Computador",2700);
insert into produtos (c_nomeproduto,n_precoproduto) values ("Notebook",3200);
insert into produtos (c_nomeproduto,n_precoproduto) values ("Lego",200);

insert into vendedor (c_nomevendedor,n_vendedor_produto) values("napoleão",1);
insert into vendedor (c_nomevendedor,n_vendedor_produto) values("atila",2);
insert into vendedor (c_nomevendedor,n_vendedor_produto) values("daniel",3);

select *from produtos;

-- distinct não mostra valores repetidos --
select distinct c_nomeproduto from produtos;

-- order by ordenação --
select *from produtos order by c_nomeproduto;

select distinct c_nomeproduto from produtos where n_id < 5 order by c_nomeproduto;

select *from produtos;

select c_nomeproduto, count(*) as Quantidade from produtos group by c_nomeproduto;

select c_nomeproduto, count(*) as Quantidade from produtos group by c_nomeproduto having count(c_nomeproduto) > 1;


-- ver o diretorio aonde tem permissão de salvar --
show variables like 'secure_file_priv';

-- /var/lib/mysql-files/ --


-- export com select em csv ou txt --
select 'id','nome','preço' union all select n_id,c_nomeproduto,n_precoproduto from produtos
	into outfile '/var/lib/mysql-files/produtos.csv'
    character set utf8
    fields terminated by ','
    enclosed by '"'
    escaped by ','
    lines terminated by '\r\n';
    
select 'nome','qtde' union all select c_nomeproduto, count(*) from produtos group by c_nomeproduto
	into outfile '/var/lib/mysql-files/produtos2.csv'
    character set utf8
    fields terminated by ','
    enclosed by '"'
    escaped by ','
    lines terminated by '\r\n';
    
select 'nome','qtde' union all select c_nomeproduto, count(*) from produtos
	group by c_nomeproduto
    having count(c_nomeproduto) > 1
	into outfile '/var/lib/mysql-files/produtos3.csv'
    character set utf8
    fields terminated by ','
    enclosed by '"'
    escaped by ','
    lines terminated by '\r\n';    

select 'nome','preco' union all select c_nomeproduto,n_precoproduto from produtos 
	where n_precoproduto > 1000 
	into outfile '/var/lib/mysql-files/produtos4.csv'
    character set utf8
    fields terminated by ','
    enclosed by '"'
    escaped by ','
    lines terminated by '\r\n';

select 'nome','preco','vendedor' union all select c_nomeproduto,n_precoproduto,c_nomevendedor from produtos as p  
	inner join vendedor as v 
	where p.n_id = v.n_id and n_precoproduto > 1000 
	into outfile '/var/lib/mysql-files/produtos5.csv'
    character set utf8
    fields terminated by ','
    enclosed by '"'
    escaped by ','
    lines terminated by '\r\n';    
    
    
    
