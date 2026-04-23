CREATE TABLE campaigns (
    campaign_id INT PRIMARY KEY,
    campaign_name VARCHAR(100),
    channel VARCHAR(50),
    budget DECIMAL(10,2)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE leads (
    lead_id INT PRIMARY KEY,
    customer_id INT,
    campaign_id INT,
    lead_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    lead_id INT,
    amount DECIMAL(10,2),
    sale_date DATE,
    FOREIGN KEY (lead_id) REFERENCES leads(lead_id)
);