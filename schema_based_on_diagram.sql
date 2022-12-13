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
    treatment_id int REFERENCES treatments (id)
    PRIMARY KEY(medical_histories_id, treatment_id)
);

CREATE TABLE invoice_items (
    id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    unit_price decimal,
    quantity int,
    total_price decimal,
    invoice_id int REFERENCES invoices (id),
    treatment_id int REFERENCES treatments (id)
);

CREATE INDEX medical_patient_asc ON medical_histories(patient_id);
CREATE INDEX invoices_medical_asc ON invoices(medical_history_id);
CREATE INDEX medical_histories_asc ON medical_histories_treatment(medical_histories_id);
CREATE INDEX medical_tratment_asc ON medical_histories_treatment(treatment_id);
CREATE INDEX invoice_id_asc ON invoice_items(invoice_id);
CREATE INDEX invoice_treatment_asc ON invoice_items(treatment_id);