# GDELTFlow: A Scalable Batch Data Pipeline 🚀

## 📌 Overview
**GDELTFlow** is a **batch data processing pipeline** that ingests global news event data from **GDELT**, processes it using **Apache Spark on Dataproc**, and loads it into **BigQuery** for further analysis. The pipeline is orchestrated using **Kestra**, ensuring automation and scalability.

## 🏗️ Architecture
```
GDELT Source → Cloud Storage (Raw) → Spark on Dataproc → Cloud Storage (Processed) → BigQuery → dbt
```

### **Tech Stack**
✅ [Kestra](https://kestra.io/) - Workflow Orchestration  
✅ [Apache Spark](https://spark.apache.org/) - Data Processing  
✅ [Google Cloud Storage (GCS)](https://cloud.google.com/storage/) - Data Lake  
✅ [Google Dataproc](https://cloud.google.com/dataproc/) - Managed Spark Cluster
✅ [Google BigQuery](https://cloud.google.com/bigquery/) - Data Warehouse  
✅ [dbt](https://www.getdbt.com/) - Data Transformations

---

## ⚙️ Pipeline Workflow

1️⃣ **Kestra fetches & stores daily GDELT data** in Google Cloud Storage.  
2️⃣ **Spark on Dataproc cleans & transforms the data**, including:
   - Removing duplicates & handling missing values
   - Applying regex-based text cleaning on URLs & event descriptions
   - Partitioning by **date** and clustering by **event type**.

3️⃣ **Kestra loads processed data into BigQuery**.

4️⃣ **dbt performs final transformations** for analysis.

---

## 🛠️ Setup & Deployment
### **1️⃣ Clone the Repository**
```bash
git clone https://github.com/yourusername/GDELTFlow.git
cd GDELTFlow
```

### **2️⃣ Deploy Kestra Workflow**
Modify `kestra_gdelt_pipeline.yaml` with your GCS bucket & BQ dataset.
```bash
kestra deployment apply kestra_gdelt_pipeline.yaml
```

### **3️⃣ Run Spark Job on Dataproc**
Submit Spark job for data processing:
```bash
gcloud dataproc jobs submit pyspark spark_jobs/gdelt_processing.py \
    --cluster=your-cluster-name --region=your-region \
    --properties=spark.executor.cores=4,spark.executor.memory=8g
```

### **4️⃣ Load Data into BigQuery**
```bash
bq load --source_format=PARQUET your_project.dataset.gdelt_events \
    gs://your-bucket/processed/gdelt/*.parquet
```

### **5️⃣ Run dbt Transformations**
```bash
dbt run
```

---

## 📊 Example Queries
Find top 10 most reported global events:
```sql
SELECT EventCode, COUNT(*) as event_count 
FROM `your_project.dataset.gdelt_events`
GROUP BY EventCode 
ORDER BY event_count DESC
LIMIT 10;
```

Find sentiment trends by country:
```sql
SELECT SQLDATE, ActionGeo_CountryCode, AVG(AvgTone) as avg_sentiment 
FROM `your_project.dataset.gdelt_events`
WHERE SQLDATE >= '2024-01-01'
GROUP BY SQLDATE, ActionGeo_CountryCode
ORDER BY SQLDATE DESC;
```

---

## 🚀 Future Improvements
🔹 Add **real-time streaming** with Kafka + Spark Streaming  
🔹 Implement **machine learning models** for event classification  
🔹 Optimize Spark jobs using **Delta Lake**

---

## 🏆 Contributors
- **[Khushal_Kharade](https://github.com/khushal2911)** - Data Enthusiast

Feel free to fork and contribute! ✨
