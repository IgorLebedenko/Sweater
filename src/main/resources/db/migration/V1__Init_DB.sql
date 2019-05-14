create sequence hibernate_sequence start 1 increment 1;

create table messages (
    id int8 not null,
    filename varchar(255),
    tag varchar(255),
    text varchar(2048) not null,
    user_id int8,
    primary key (id)
);

create table users (
    id int8 not null,
    activation_code varchar(255),
    active boolean not null,
    email varchar(255),
    password varchar(255) not null,
    username varchar(255) not null,
    primary key (id)
);

create table users_roles (
    user_id int8 not null,
    roles varchar(255)
);

alter table if exists messages
    add constraint messages_users_fk
    foreign key (user_id) references users;

alter table if exists users_roles
    add constraint users_roles_users_fk
    foreign key (user_id) references users;