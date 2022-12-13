CREATE TABLE patients (
    id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name varchar,
    date_of_birth date
);

CREATE TABLE medical_histories (
    id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    admitted_at timestamp,
    patient_id int REFERENCES patients (id),
    status varchar
);

CREATE TABLE invoices (
    id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int UNIQUE REFERENCES medical_histories (id)
);

CREATE TABLE treatments (
    id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    type varchar,
    name varchar
);

CREATE TABLE medical_histories_treatment (
    medical_histories_id int REFERENCES medical_histories (id),
    treatment_id int REFERENCES treatments (id),
    date timestamp,
    PRIMARY KEY(medical_histories_id, treatment_id, date)
);

CREATE TABLE invoice_items (
    id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    unit_price decimal,
    quantity int,
    total_price decimal,
    invoice_id int REFERENCES invoices (id),
    treatment_id int REFERENCES treatments (id)
);

