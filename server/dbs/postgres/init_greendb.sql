CREATE TABLE IF NOT EXISTS users (
    uuid CHAR(34)  UNIQUE NOT NULL PRIMARY KEY,
    object_version SMALLINT,
    data_version SMALLINT,
    creation_date TIMESTAMP,
    display_name VARCHAR(256) NOT NULL,
    password VARCHAR(256) NOT NULL,
    country CHAR(3) NOT NULL,
    phone VARCHAR(32)
);
CREATE INDEX IF NOT EXISTS idx_users_uuid ON users(uuid);

CREATE TABLE IF NOT EXISTS sessions (
    uuid CHAR(34)  UNIQUE NOT NULL PRIMARY KEY,
    object_version SMALLINT,
    data_version SMALLINT,
    creation_date TIMESTAMP,
    termination_date TIMESTAMP,
    user_uuid CHAR(34),
    device_uuid CHAR(34),
    is_new_user BOOLEAN NOT NULL,
    is_new_device BOOLEAN NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_sessions_uuid ON sessions(uuid);

CREATE TABLE IF NOT EXISTS devices (
    uuid CHAR(34)  UNIQUE NOT NULL PRIMARY KEY,
    object_version SMALLINT,
    data_version SMALLINT,
    creation_date TIMESTAMP,
    kind VARCHAR(8),
    vendor_uuid CHAR(34),
    platform VARCHAR(8),
    os_version VARCHAR(12),
    last_connection_date TIMESTAMP
);
CREATE INDEX IF NOT EXISTS idx_devices_uuid ON devices(uuid);

CREATE TABLE IF NOT EXISTS greenhouses (
    uuid CHAR(34)  UNIQUE NOT NULL PRIMARY KEY,
    object_version SMALLINT,
    data_version SMALLINT,
    creation_date TIMESTAMP,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    display_name VARCHAR(256),
    description TEXT
);
CREATE INDEX IF NOT EXISTS idx_greenhouses_uuid ON greenhouses(uuid);

CREATE TABLE IF NOT EXISTS plants (
    uuid CHAR(34)  UNIQUE NOT NULL PRIMARY KEY,
    object_version SMALLINT,
    data_version SMALLINT, 
    creation_date TIMESTAMP,
    modificaiton_date TIMESTAMP,
    scientific_name VARCHAR(256),
    common_name VARCHAR(256),
    flavor_name VARCHAR(256),
    family VARCHAR(256)
); 
CREATE INDEX IF NOT EXISTS idx_plants_uuid ON plants(uuid);

CREATE TABLE IF NOT EXISTS recordpoints(
    uuid CHAR(34)  UNIQUE NOT NULL PRIMARY KEY,
    object_version SMALLINT,
    data_version SMALLINT,
    creation_date TIMESTAMP,
    unit VARCHAR(24),
    value VARCHAR(36), 
    description TEXT,
    sensor_uuid CHAR(34),
    media_uuid CHAR(34)
);
CREATE INDEX IF NOT EXISTS idx_recordpoints_uuid ON recordpoints(uuid);
 

CREATE TABLE IF NOT EXISTS media(
    uuid CHAR(34)  UNIQUE NOT NULL PRIMARY KEY,
    object_version SMALLINT,
    data_version SMALLINT,
    path  VARCHAR(512),
    hash_name VARCHAR(256)
);
CREATE INDEX IF NOT EXISTS idx_media_uuid ON media(uuid);

CREATE TABLE IF NOT EXISTS sensors(
    uuid CHAR(34)  UNIQUE NOT NULL PRIMARY KEY,
    object_version SMALLINT,
    data_version SMALLINT,
    precision DOUBLE PRECISION,
    sensor_type VARCHAR(24),
    unit VARCHAR(24),
    model VARCHAR(256)
);
CREATE INDEX IF NOT EXISTS idx_sensors_uuid ON sensors(uuid);
