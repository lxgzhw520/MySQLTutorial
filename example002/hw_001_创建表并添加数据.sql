show tables;

create table userinfo
(
    id       int primary key auto_increment,
    username varchar(24) not null,
    password varchar(68) not null
);
select *
from userinfo;
insert into userinfo(username, password) value ('lxgzhw', 'lxgzhw');