class CreateSampleData < ActiveRecord::Migration
  def change

    sql = <<-SQL
    -- Create Tables
    CREATE TABLE artists
    (
        id SERIAL PRIMARY KEY,
        name VARCHAR(120)
    );

    CREATE TABLE albums
    (
        id SERIAL PRIMARY KEY,
        title VARCHAR(160)  NOT NULL,
        artist_id INTEGER  NOT NULL,
        FOREIGN KEY (artist_id) REFERENCES artists (id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
    );

    CREATE TABLE employees
    (
        id SERIAL PRIMARY KEY,
        last_name VARCHAR(20)  NOT NULL,
        first_name VARCHAR(20)  NOT NULL,
        title VARCHAR(30),
        reports_to INTEGER,
        birth_date TIMESTAMP,
        hire_date TIMESTAMP,
        address VARCHAR(70),
        city VARCHAR(40),
        state VARCHAR(40),
        country VARCHAR(40),
        postal_code VARCHAR(10),
        phone VARCHAR(24),
        fax VARCHAR(24),
        email VARCHAR(60),
        FOREIGN KEY (reports_to) REFERENCES employees (id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
    );

    CREATE TABLE customers
    (
        id SERIAL PRIMARY KEY,
        first_name VARCHAR(40)  NOT NULL,
        last_name VARCHAR(20)  NOT NULL,
        company VARCHAR(80),
        address VARCHAR(70),
        city VARCHAR(40),
        state VARCHAR(40),
        country VARCHAR(40),
        postal_code VARCHAR(10),
        phone VARCHAR(24),
        fax VARCHAR(24),
        email VARCHAR(60)  NOT NULL,
        support_rep_id INTEGER,
        FOREIGN KEY (support_rep_id) REFERENCES employees (id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
    );

    CREATE TABLE genres
    (
        id SERIAL PRIMARY KEY,
        name VARCHAR(120)
    );

    CREATE TABLE invoices
    (
        id SERIAL PRIMARY KEY,
        customer_id INTEGER  NOT NULL,
        invoice_date TIMESTAMP  NOT NULL,
        billing_address VARCHAR(70),
        billing_city VARCHAR(40),
        billing_state VARCHAR(40),
        billing_country VARCHAR(40),
        billing_postal_code VARCHAR(10),
        total NUMERIC(10,2)  NOT NULL,
        FOREIGN KEY (customer_id) REFERENCES customers (id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
    );

    CREATE TABLE media_types
    (
        id SERIAL PRIMARY KEY,
        name VARCHAR(120)
    );

    CREATE TABLE tracks
    (
        id SERIAL PRIMARY KEY,
        name VARCHAR(200)  NOT NULL,
        album_id INTEGER,
        media_type_id INTEGER  NOT NULL,
        genre_id INTEGER,
        composer VARCHAR(220),
        milliseconds INTEGER  NOT NULL,
        bytes INTEGER,
        unit_price NUMERIC(10,2)  NOT NULL,
        FOREIGN KEY (album_id) REFERENCES albums (id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
        FOREIGN KEY (genre_id) REFERENCES genres (id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
        FOREIGN KEY (media_type_id) REFERENCES media_types (id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
    );

    CREATE TABLE invoice_lines
    (
        id SERIAL PRIMARY KEY,
        invoice_id INTEGER  NOT NULL,
        track_id INTEGER  NOT NULL,
        unit_price NUMERIC(10,2)  NOT NULL,
        quantity INTEGER  NOT NULL,
        FOREIGN KEY (invoice_id) REFERENCES invoices (id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
        FOREIGN KEY (track_id) REFERENCES tracks (id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
    );

    CREATE TABLE playlists
    (
        id SERIAL PRIMARY KEY,
        name VARCHAR(120)
    );

    CREATE TABLE playlist_tracks
    (
        playlist_id INTEGER  NOT NULL,
        track_id INTEGER  NOT NULL,
        CONSTRAINT PK_PlaylistTrack PRIMARY KEY  (playlist_id, track_id),
        FOREIGN KEY (playlist_id) REFERENCES playlists (id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
        FOREIGN KEY (track_id) REFERENCES tracks (id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
    );


    -- Create Primary Key Unique Indexes

    CREATE UNIQUE INDEX index_album_on_id ON albums(id);

    CREATE UNIQUE INDEX index_artist_on_id ON artists(id);

    CREATE UNIQUE INDEX index_customer_on_id ON customers(id);

    CREATE UNIQUE INDEX index_employee_on_id ON employees(id);

    CREATE UNIQUE INDEX index_genre_on_id ON genres(id);

    CREATE UNIQUE INDEX index_invoice_on_id ON invoices(id);

    CREATE UNIQUE INDEX index_invoice_line_on_id ON invoice_lines(id);

    CREATE UNIQUE INDEX index_media_type_on_id ON media_types(id);

    CREATE UNIQUE INDEX index_playlist_on_id ON playlists(id);

    CREATE UNIQUE INDEX index_playlist_track_on_id ON playlist_tracks(playlist_id, track_id);

    CREATE UNIQUE INDEX index_track_on_id ON tracks(id);


    -- Create Foreign Keys

    CREATE INDEX index_album_on_artist_id ON albums (artist_id);

    CREATE INDEX index_customers_on_support_rep_id ON customers (support_rep_id);

    CREATE INDEX index_employees_on_reports_to ON employees (reports_to);

    CREATE INDEX index_invoices_on_customer_id ON invoices (customer_id);

    CREATE INDEX index_invoice_lines_on_invoice_id ON invoice_lines (invoice_id);

    CREATE INDEX index_invoice_lines_on_track_id ON invoice_lines (track_id);

    CREATE INDEX index_playlist_tracks_on_track_id ON playlist_tracks (track_id);

    CREATE INDEX index_tracks_on_album_id ON tracks (album_id);

    CREATE INDEX index_track_on_genre_id ON tracks (genre_id);

    CREATE INDEX index_track_on_media_type_id ON tracks (media_type_id);
    SQL

    execute(sql)
  end
end
