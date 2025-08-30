# Data Movement Pipeline using Azure Data Factory & Azure DevOps 🚀  

## 📌 Project Statement  
The goal of this project is to design and implement a **data movement pipeline** using **Azure Data Factory (ADF)** to transfer data from a simulated on-premises **Azure SQL Database** to **Azure Synapse Analytics**.  
The pipeline automates ETL processes and integrates with **Azure DevOps** for version control and CI/CD deployment, showcasing real-world cloud data engineering practices.  

---

## 🎯 Project Overview & Objectives  

### Overview  
Structured data from an **Azure SQL Database** (acting as an on-prem source) is ingested into **Azure Synapse Analytics** using ADF pipelines.  
- **Azure Data Factory** orchestrates the data flow.  
- **Azure DevOps** provides Git-based version control and CI/CD pipeline automation.  

### Objectives  
- Provision Azure resources for a **scalable and secure pipeline**.  
- Build ADF pipeline to **extract, transform, and load (ETL)** data into ADLS Gen2 and Synapse.  
- Validate correctness of **data transfer via queries**.  
- Integrate ADF with **Azure DevOps** for versioning & collaboration.  
- Initiate **CI/CD pipeline** for automated deployment (partial due to access limits).  

---

## 📝 Prerequisites  
- Azure Subscription with access to ADF, Synapse, SQL Database, and Storage.  
- Azure DevOps account (project & repo setup).  
- Basic knowledge: **ETL concepts, Git, SQL, Azure portal navigation**.  
- Tools: **Azure Synapse Studio, SQL Server Management Studio (SSMS)**.  

---

## 🔧 Azure Resources Used  
- **Resource Group** – Centralized management (rg-hexaver-adf-synapse-dev).  
- **Azure Data Lake Storage Gen2** – Raw & curated containers for structured data.  
- **Azure Synapse Analytics** – Cloud warehouse for transformed data.  
- **Azure SQL Database** – Simulated on-premises data source.  
- **Azure Data Factory** – Pipeline orchestration.  
- **Azure DevOps** – Version control & CI/CD integration.  

> **Note:** Project was deployed using a **college Azure account** due to expired personal subscription.  

---

## ⚙️ Implementation Steps  

1. **Create Resource Group** – Logical container for all project resources.  
2. **Provision ADLS Gen2** – Enabled hierarchical namespace, created `raw` & `curated` containers.  
3. **Deploy Synapse Workspace** – Integrated with ADLS Gen2 for analytics.  
4. **Set up Azure SQL Database** – Created tables with primary keys and realistic sample data.  
5. **Configure ADF** – Designed modular pipeline with parameterization, error handling & logging.  
6. **Integrate with Azure DevOps** – Linked ADF repo to Git for version control.  
7. **Create Linked Services** – Established secure connections (SQL DB → ADLS Gen2).  
8. **Create Datasets** – Defined SQL source & Parquet sink in ADLS Gen2.  
9. **Build Pipeline** – Copy Data activity with incremental loads & error handling.  
10. **Debug & Validate** – Verified data flow & schema mapping in ADLS folders.  
11. **Verification via Synapse Studio** – Used `OPENROWSET` queries to validate data accuracy.  

---

## 📈 Verification & Output  
- Data successfully moved from **Azure SQL DB → ADLS Gen2 → Synapse Analytics**.  
- Output validated for **accuracy, completeness, and formatting**.  
- All artifacts published to **adf_publish folder** in Azure DevOps repo.  
- Demonstrated **robust ETL orchestration** and proper error handling.  

---

## 🔄 CI/CD Pipeline Setup  
- Configured **Azure DevOps service connection** for automated deployment.  
- Created **Release Pipeline** for continuous integration & deployment.  
- Deployment pending due to private DevOps org parallelism restrictions.  
- Future enhancements: **approval gates, rollback mechanisms, monitoring hooks**.  

---

## ✅ Conclusion & Learnings  
This project delivered a **fully functional data movement pipeline** using ADF & Synapse with DevOps integration.  

### Key Learnings  
- Importance of **modular pipeline design** for reusability.  
- Role of **logging & monitoring** in production ETL.  
- Schema & type mismatch handling between SQL & Synapse.  
- Effective **Git-based version control** in ADF.  
- Challenges faced: connection management, DevOps org limitations.  

👉 The solution reflects **enterprise-level data engineering practices** and serves as a foundation for **scalable cloud ETL pipelines**.  
