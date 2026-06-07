## 🚀 Project Overview & Architecture
The primary objective of this project is to convert unstructured and raw call logs into highly actionable business insights. The architecture follows a classic modern data pipeline:
1. **Data Ingestion & ETL (Python):** Cleansed raw data, handled missing values, converted data types, and dynamically loaded the staging data using `Pandas` and `SQLAlchemy`.
2. **Data Warehousing & Business Logic (MySQL):** Engineered automated `SQL Views` to process complex business metrics including SLA adherence, agent performance leaderboards, customer sentiment scoring, and peak traffic hours.
3. **Business Intelligence & Analytics (Power BI):** Developed a dynamic, fully-interactive 3-page dashboard utilizing standard analytical dimensions, custom KPIs, and cross-filtering.

---

## 🛠️ Tech Stack & Tools Used
* **Language:** Python 3.x
* **ETL Libraries:** Pandas, NumPy, SQLAlchemy, PyMySQL
* **Database Management:** MySQL Server & MySQL Workbench
* **Business Intelligence:** Power BI Desktop

---

## 📊 Database Architecture & Engineered SQL Views
Instead of loading massive raw tables into Power BI, business logic was pushed down to the database tier using **Optimized MySQL Views** to ensure high performance and scalability:

1. `view_sentiment_insights`: Tracks customer sentiment distribution and maps it against employee speech tones (`agent_tone`) to evaluate emotional containment strategies.
2. `view_sla_insights`: Measures Average, Minimum, and Maximum wait times partitioned across different customer loyalty tiers (`Elite Level Codes` like Diamond, Platinum, Gold, Standard).
3. `view_agent_performance`: A comprehensive agent leaderboard tracking total handled calls, average talk duration (converted to minutes), average silence percentage, and overall satisfaction score.
4. `view_call_reason_insights`: Groups call volumes by primary intent (e.g., Billing, Technical Support) and identifies customer friction points.
5. `view_hourly_traffic`: Extracts hourly call timestamps to isolate peak load distributions and optimize call center workforce scheduling.

---

## 🎨 Power BI Dashboard Implementation
The final report consists of **3 dedicated pages**, intentionally structured following professional UI/UX and dashboard design best practices (3 Cards + 3 Charts per page to avoid visual clutter):

### 📄 Page 1: Overview & Traffic (Operational Metrics)
* **KPI Cards:** Total Calls (Sum), Avg Wait Time (Average), Peak Hour Volume (Max).
* **Line Chart:** `Hourly Call Traffic & Distribution` — Visualizes operational loads throughout the 24-hour cycle.
* **Donut Chart:** `Call Volume by Primary Reason` — Highlights the main drivers behind customer incoming traffic.
* **Horizontal Bar Chart:** `Average Wait Time per Call Reason` — Uncovers which service categories suffer from system bottlenecks.
* **Slicer:** Interactivity driven by `Call Reason`.
* <img width="1215" height="686" alt="Screenshot 2026-06-07 205234" src="https://github.com/user-attachments/assets/d361f72b-cdfb-45d4-9a7b-079f850bd48f" />


### 📄 Page 2: Agent Performance (Workforce Evaluation)
* **KPI Cards:** Team Avg Sentiment (Average), Avg Talk Duration (Average), Avg Silence % (Average).
* **Scatter Chart:** `Agent Efficiency: Talk Duration vs Wait Time` — Maps individual agents across performance quadrants.
* **Horizontal Bar Chart:** `Top Agents by Total Handled Calls` — Isolates high-volume operational contributors.
* **Table Grid:** `Agents Performance Leaderboard` — Tabular summary ranking agents dynamically by their satisfaction rating.
* **Slicer:** Searchable filtering driven by `Agent ID`.
* <img width="1214" height="686" alt="Screenshot 2026-06-07 205255" src="https://github.com/user-attachments/assets/8b4483cc-5b87-4554-8cfc-2cae6f22d2a3" />


### 📄 Page 3: Customer Sentiment & SLA (Customer Experience & Quality Assurance)
* **KPI Cards:** Total Angry Calls (Sum), VIP Avg Wait Time (Filtered Average), Standard Avg Wait Time (Filtered Average).
* **Clustered Bar Chart:** `Agent Tone Effectiveness on Customer Sentiment` — Measures which agent communication style drives the highest sentiment recovery.
* **Clustered Column Chart:** `Average Wait Time by Customer Tier` — Verifies VIP queue prioritization.
* **Pie Chart:** `Customer Base Breakdown (SLA Tiers)` — Represents company client segments.
* **Slicer:** Analytical filtering driven by `Elite Level Code`.
<img width="1216" height="686" alt="Screenshot 2026-06-07 205312" src="https://github.com/user-attachments/assets/89ebb2d2-054b-4a8a-9c7e-6aeac21c0748" />

---

## 📈 Key Business Insights Discovered
* **Staffing Optimization:** Isolated a definitive surge in call volume during specific peak hours, allowing leadership to implement precision-based shift planning.
* **SLA Verification:** Proved that customers in high-tier segments (Diamond/Platinum) experience significantly lower waiting times, validating operational alignment with corporate SLA targets.
* **Communication Coaching:** Identified that a specific `agent_tone` (e.g., Calm/Polite) yields a net-positive shift in customer sentiment scores, defining a benchmark for future agent training modules.

---

## ⚙️ How to Run This Project
1. **ETL Pipeline:** Run the Python script to ingest, clean, and pipe the source dataset directly into your local MySQL instance.
2. **Database Schema:** Execute the provided SQL script containing the `CREATE OR REPLACE VIEW` statements within your MySQL Workbench.
3. **BI Interface:** Open the `.pbix` file using Power BI Desktop, navigate to `Get Data` -> `MySQL Database`, input your database credentials, and refresh to synchronize data.
