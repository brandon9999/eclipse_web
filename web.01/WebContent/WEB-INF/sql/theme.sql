create table THEME_MESSAGE (
    THEME_MESSAGE_ID INTEGER NOT NULL PRIMARY KEY,
    GROUP_ID         INTEGER NOT NULL,
    ORDER_NO         INTEGER NOT NULL,
    LEVELS         INTEGER NOT NULL,
    PARENT_ID        INTEGER NOT NULL,
    REGISTER         TIMESTAMP   NOT NULL,
    NAME             VARCHAR(20) NOT NULL,
    EMAIL            VARCHAR(80) NOT NULL,
    IMAGE            VARCHAR(40) NOT NULL,
    PASSWORD         VARCHAR(20),
    TITLE            VARCHAR(100) NOT NULL
);

create index THEME_MESSAGE_INDEX 
on THEME_MESSAGE(GROUP_ID DESC, ORDER_NO ASC);

create table THEME_CONTENT (
    THEME_MESSAGE_ID INTEGER    NOT NULL PRIMARY KEY,
    CONTENT          LONG VARCHAR NOT NULL
);

create table ID_SEQUENCE (
    TABLE_NAME VARCHAR(60) NOT NULL PRIMARY KEY,
    MESSAGE_ID INTEGER NOT NULL
);

