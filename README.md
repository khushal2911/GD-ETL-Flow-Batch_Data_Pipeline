# GDELTFlow: A Scalable Batch Data Pipeline 🚀

## 📌 Overview
**GDELTFlow** is a **batch data processing pipeline** that ingests global news event data from **GDELT**, and uploads it into **GCS** then loads into **BigQuery** for further transformation using dbt. The pipeline is orchestrated using **Kestra**, ensuring automation and scalability.

## 🏗️ Architecture
```
GDELT Source → Google Cloud Storage (Raw) → BigQuery → dbt → BigQuery
```

### **Tech Stack**
✅ [Kestra](https://kestra.io/) - Workflow Orchestration  
✅ [Google Cloud Storage (GCS)](https://cloud.google.com/storage/) - Data Lake 
✅ [Google BigQuery](https://cloud.google.com/bigquery/) - Data Warehouse  
✅ [dbt](https://www.getdbt.com/) - Data Transformations

---

## ⚙️ Pipeline Workflow

1️⃣ **Kestra fetches & stores daily GDELT data** in Google Cloud Storage.  
2️⃣ **Kestra creates dataset tables into BigQuery**.
3️⃣ **dbt performs various transformations** including:
   - Removing duplicates & handling missing values
   - Applying regex-based text cleaning on URLs & event descriptions
   - Partitioning by **date** and clustering by **event type**.
4️⃣ **transformed tables are saved back into BigQuery dataset**

---

## 🛠️ Setup & Deployment
### **1️⃣ Clone the Repository**
```bash
git clone https://github.com/khushal2911/GD-ETL-FLOW-BATCH_DATA_PIPELINE.git
```

### **2️⃣ Deploy Kestra Workflow**
Modify `data_insert_to_BigQuery.yaml` with your GCS bucket & BQ dataset.
```bash
kestra deployment apply kestra_gdelt_pipeline.yaml
```

### **3️⃣ Run dbt Transformations**
```bash
dbt run
```

### **4️⃣ Load Data into BigQuery**
```bash
bq load --source_format=PARQUET newslakehouse.newslakehouse_dataset.gdelt_evevents \
    gs://your-bucket/processed/gdelt/*.parquet
```

---

## 📊 Example Queries
Find top 10 most reported global events:
```sql
SELECT EventCode, COUNT(*) as event_count 
FROM `newslakehouse.newslakehouse_dataset.gdelt_events`
GROUP BY EventCode 
ORDER BY event_count DESC
LIMIT 10;
```

Find sentiment trends by country:
```sql
SELECT SQLDATE, ActionGeo_CountryCode, AVG(AvgTone) as avg_sentiment 
FROM `newslakehouse.newslakehouse_dataset.gdelt_events`
WHERE SQLDATE >= '2024-04-01'
GROUP BY SQLDATE, ActionGeo_CountryCode
ORDER BY SQLDATE DESC;
```

---

## 🚀 Future Improvements
🔹 Add Spark **Dataproc clusters** for preprocessing before loading into BigQuery
🔹 Add **real-time streaming** with Kafka + Spark Streaming  
🔹 Implement **machine learning models** for event classification  
🔹 Optimize Spark jobs using **Delta Lake**

---

## 🏆 Contributors
- **[Khushal_Kharade](https://github.com/khushal2911)** - Data Enthusiast

Feel free to fork and contribute! ✨
