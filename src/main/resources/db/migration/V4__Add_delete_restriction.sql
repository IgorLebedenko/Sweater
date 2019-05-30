alter table if exists messages
    drop constraint messages_users_fk;

alter table if exists messages
    add constraint messages_users_fk
    foreign key (user_id) references users on delete cascade;

alter table if exists users_roles
    drop constraint users_roles_users_fk;

alter table if exists users_roles
    add constraint users_roles_users_fk
    foreign key (user_id) references users on delete cascade;