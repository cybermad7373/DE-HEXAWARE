# Real-Time Cryptocurrency Analytics Dashboard 🚀  

## 📌 Project Overview  
This project implements a **real-time cryptocurrency analytics dashboard** using **Azure Databricks** and **PySpark**.  
It connects to the **Binance API** to ingest live streaming crypto market data (price, volume, trades), processes it in real-time, and visualizes insights through an **interactive, auto-updating dashboard**.  

The solution is designed for **traders, analysts, and researchers** who need timely insights into cryptocurrency price fluctuations, market trends, and trading signals.  

---

## 🎯 Project Objectives  
- **Real-Time Data Ingestion**: Stream live crypto data from Binance API.  
- **Streaming Data Processing**: Use PySpark Structured Streaming to compute metrics (moving averages, RSI, volatility).  
- **Analytics & Insights**: Generate key indicators like price change %, top gainers/losers, and sentiment.  
- **Visualization Layer**: Build interactive dashboards with candlesticks, volume charts, and market sentiment analysis.  
- **Azure Databricks Demonstration**: Show scalable real-time analytics on Azure cloud.  
- **Optimization & Reliability**: Implement checkpointing, autoscaling, and efficient cluster usage.  

---

## 🏗️ Architecture  
**Data Flow:**  
1. **Binance API** → Data ingestion into Databricks  
2. **PySpark Structured Streaming** → Real-time transformations  
3. **Delta Lake Storage** → Persistent data storage with schema enforcement  
4. **Visualization Layer** → Matplotlib / Plotly dashboards  
5. **Azure Monitor** → System performance & health tracking  

---

## 📊 Data Schema  
**Raw Binance API Response Example:**  
```json
{
  "symbol": "BTCUSDT",
  "price": "50123.45",
  "volume": "12345.678",
  "priceChange": "125.67",
  "priceChangePercent": "0.25",
  "highPrice": "50200.00",
  "lowPrice": "49900.50",
  "quoteVolume": "619382049.89",
  "timestamp": 1633034400000
}

## 📊 Processed Schema in Delta Lake  

| Column Name        | Data Type  | Description                                   |
|--------------------|------------|-----------------------------------------------|
| symbol             | STRING     | Cryptocurrency trading pair (e.g., BTCUSDT)   |
| price              | DOUBLE     | Latest market price                           |
| volume             | DOUBLE     | Trading volume                                |
| priceChange        | DOUBLE     | Absolute price change                         |
| priceChangePercent | DOUBLE     | Percentage price change                       |
| highPrice          | DOUBLE     | Daily highest price                           |
| lowPrice           | DOUBLE     | Daily lowest price                            |
| quoteVolume        | DOUBLE     | Quoted trading volume in USDT                 |
| event_time         | TIMESTAMP  | Event time from Binance API                   |
| processing_time    | TIMESTAMP  | Time when record was processed in Databricks  |
| date               | DATE       | Date of transaction                           |
| hour               | INT        | Hour of transaction                           |


---

## 🔧 Azure Resources Used  
- **Azure Databricks** – Core platform for ingestion, processing, and analytics  
- **Azure Storage (Delta Lake)** – Persistent storage with ACID transactions  
- **Azure Monitor** – Monitoring pipelines and cluster performance  
- **Azure Key Vault (optional)** – Secure storage for API keys & credentials  

---

## 🛠️ Tools & Libraries  
- **Databricks** (PySpark, Spark SQL, Delta Lake)  
- **Binance API** (real-time market data)  
- **Python** (requests, pandas, matplotlib, plotly)  

---

## ⚙️ Setup & Execution  

### Prerequisites  
- Azure Subscription  
- Binance API access (free/public keys available)  
- Databricks cluster setup  

### Steps  
1. **Set up Azure Resources**  
   - Create **Resource Group, Event Hub, Storage, and Databricks Workspace**.  

2. **Databricks Cluster Setup**  
   - Runtime: `13.3 LTS ML`  
   - Install required libraries: `matplotlib`, `pandas`, `requests`.  

3. **Notebook Development**  
   - Create notebook → Fetch Binance API data → Process with PySpark.  

4. **Dashboard Execution**  
   ```python
   run_dashboard(update_interval=5)  # updates every 5s

5. **Customization**

    - Modify `symbols` list to track more cryptocurrencies.
    - Change update interval for faster/slower refresh.

---

## 📈 Outputs  
- **Real-Time Dashboard** – Live charts for price, volume, sentiment, ranges.  
- **Delta Lake Storage** – Persistent structured data for historical queries.  
- **Console Analytics** – Text-based market trend summaries.  

---

## 🚀 Optimization Strategies  
- **Cluster Optimization**: Auto-scaling, spot instances.  
- **Data Processing**: Incremental updates, Delta caching.  
- **API Optimization**: Connection pooling, retry logic.  
- **Visualization**: Incremental updates instead of full redraws.  
- **Cost Efficiency**: Auto-termination for idle clusters.  

---

## ✅ Conclusion  
This project demonstrates a **scalable, cloud-based real-time analytics pipeline** that:  
- Ingests and processes live crypto market data.  
- Provides **actionable insights** for traders/analysts.  
- Showcases **Azure Databricks + PySpark** for real-time big data analytics.  

It can be extended to include **predictive analytics and machine learning models** for advanced trading strategies.  
