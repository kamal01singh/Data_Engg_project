
# Azure Data Pipeline for End-to-End ETL Solution

This project demonstrates a full-scale ETL (Extract, Transform, Load) pipeline built on Azure using modern data tools to enable efficient data ingestion, transformation, and reporting. Designed for large-scale data operations, it ingests data from an on-premise SQL Server database, stores raw data in Azure Data Lake, transforms the data in Azure Databricks, loads the clean data into Azure Synapse Analytics, and generates interactive visualizations with Power BI. Secure access and monitoring are implemented using Azure Key Vault and Microsoft Entra ID.

## Key Components:

* Data Ingestion: Utilizes Azure Data Factory to transfer data from on-premise SQL Server to Azure Data Lake Storage Gen2 (ADLS Gen2).
* Data Transformation: Data transformation is conducted in Azure Databricks, organized into Bronze, Silver, and Gold layers for incremental refinement and storage in Delta format.
* Data Loading: Azure Synapse Analytics processes and loads cleaned data into a dedicated SQL pool, creating views for easy access.
* Data Reporting: Power BI connects to Azure Synapse Analytics for real-time visualizations and reporting.
* Security & Governance: Microsoft Entra ID and Azure Key Vault ensure secure and governed access to resources.

## Project Architecture Overview

![image](https://github.com/kamal01singh/Data_Engg_project/blob/main/Images/Project_architecture_overview.jpg)

1. **Ingestion with Azure Data Factory (ADF)**:

    - ADF connects to the on-premises SQL Server database and ingests data into Azure Data  Lake Gen2. The data is stored in three stages: Bronze (raw data), Silver (cleaned data), and Gold (fully transformed data) layers.

2. **Data Transformation using Azure Databricks**:

    - Data from the Bronze layer is transformed and cleaned through Azure Databricks, moving it progressively from Bronze to Silver, and finally to the Gold layer for the cleanest data.

3. **Loading and Analysis in Azure Synapse Analytics**:

    - The transformed data from the Gold layer is loaded into Azure Synapse Analytics, where SQL pools enable further querying and analysis on the processed data.

4. **Data Visualization with Power BI**:

    - Power BI connects to Azure Synapse Analytics to create interactive dashboards, enabling real-time reporting and data visualization from the Gold data layer.

5. **Security & Governance**:

    - Microsoft Entra ID (Azure Active Directory) manages user access and security roles, while Azure Key Vault securely stores sensitive information, such as authentication keys and passwords, ensuring data protection and governance throughout the pipeline.
This setup enables an end-to-end data processing and analytics pipeline, providing secure and efficient data ingestion, transformation, analysis, and visualization.

## Resourse Group - "data-engineering-project"

![image](https://github.com/kamal01singh/Data_Engg_project/blob/main/Images/Resourse_groups.jpg)


The resource group named "data-engineering-project" in Azure contains several key resources essential for data engineering tasks:

1. **Data Factory (kamal-data-factory)**: This is used to orchestrate and automate data movement and transformation. It manages the ETL process, allowing for seamless data ingestion and pipeline management across various sources.

2. **Databricks (kamal-databricks)**: A collaborative data analytics and machine learning platform, Databricks is utilized here for data transformation and processing. It's instrumental in converting data across the Bronze, Silver, and Gold layers within the data lake.

3. **Key Vault (kamal-key-vault)**: This service securely stores sensitive information such as credentials, API keys, and secrets (e.g., usernames, passwords, and tokens) used in various integrations, ensuring security and governance.

4. **Data Lake (kamalsdatalake1)**: Azure Data Lake Gen2 is the storage solution for this project, providing structured storage for the Bronze, Silver, and Gold layers. This data is stored, cleaned, and transformed as it progresses through the layers, making it ready for analytical tasks.

5. **Synapse Workspace (synapse-workspace-kamal)**: Azure Synapse Analytics provides a unified platform for big data and data warehousing needs, supporting data querying, aggregation, and integration with Power BI for visualization.

These resources together form a comprehensive data engineering ecosystem in Azure, supporting data ingestion, transformation, storage, security, and analytics.

# Screenshots

## On premise SQL Server

![image](https://github.com/kamal01singh/Data_Engg_project/blob/main/Images/SSMS_Schema.jpg)


1. **SQL Server Database Setup**:
   - The project uses Microsoft SQL Server as the on-premises database to store the initial data. SQL Server Management Studio (SSMS) was used to manage, restore, and connect to the database.

2. **AdventureWorks Sample Data**:
   - The AdventureWorksLT2022.bak file, a sample lightweight database provided by Microsoft, was restored in SSMS. This sample dataset offers a realistic schema and data structure for testing data ingestion and transformation workflows.

3. **Secure Connection with Azure Data Factory (ADF)**:
   - To enable data ingestion from the on-premises SQL Server to Azure, a secure connection was established using ADF. A Self-Hosted Integration Runtime was set up to connect ADF with the SQL Server.

4. **Credential Management**:
   - Sensitive information, such as the SQL Server login credentials, was stored securely in Azure Key Vault. This approach ensured that ADF could connect securely without exposing credentials.

5. **Data Extraction and Transfer**:
   - ADF pipelines were configured to read data from SQL Server tables and transfer it to Azure Data Lake Gen2 in a structured format (parquet).


## Azure Key Vault

![image](https://github.com/kamal01singh/Data_Engg_project/blob/main/Images/Key_vault.jpg)


1. **Storing SQL Server Credentials**:
   - The Azure Key Vault was configured to securely store the SQL Server database credentials (username and password) as secrets. This allows the Azure Data Factory (ADF) pipelines to retrieve the credentials securely during the data ingestion process without hardcoding sensitive information.

2. **Token Management**:
   - Access tokens required for secure connections, such as for Azure Databricks and other services, were also stored in the Key Vault. This ensures that tokens are readily available for authentication in the pipeline workflows while maintaining strict security controls.

3. **Integration with ADF and Databricks**:
   - Key Vault was linked to both ADF and Databricks to facilitate secure connections. ADF uses the Key Vault to fetch the SQL Server login details, while Databricks retrieves the stored tokens for secure access to Azure resources.

4. **Enhanced Security and Governance**:
   - By centralizing secrets in Key Vault, the project ensures compliance with security best practices. The Key Vault offers monitoring and access control, which enhances governance and provides detailed logs of access to secrets. 

This setup ensures a secure, streamlined connection process across different Azure components while safeguarding sensitive information.

## Azure Data Factory Pipeline Overview

![image](https://github.com/kamal01singh/Data_Engg_project/blob/main/Images/Data_factory_pipelines.jpg)

This ADF pipeline orchestrates the end-to-end data flow by:

- **Lookup Activity**: Identifies and retrieves a list of tables to process.
- **ForEach Activity**: Iterates through each table schema, enabling dynamic processing for all tables in the source.
- **Bronze to Silver Notebook**: Transforms raw ingested data (Bronze layer) to a cleaner format in the Silver layer.
- **Silver to Gold Notebook**: Further refines the Silver data, transforming it into a final, highly cleaned state in the Gold layer.

## Azure Data Lake Gen2 Containers: Bronze, Silver, and Gold

![image](https://github.com/kamal01singh/Data_Engg_project/blob/main/Images/Datalake_containers.jpg)
![image](https://github.com/kamal01singh/Data_Engg_project/blob/main/Images/Datalake_Bronze.jpg)

In this project, Azure Data Lake Gen2 is organized into three containers representing different stages of data processing:

1. **Bronze Layer**: 
   - This container stores raw data ingested directly from the source (on-premise SQL Server) without any transformations. It captures the original data structure and format, allowing for data traceability and troubleshooting if needed.

2. **Silver Layer**:
   - This container holds cleaned and refined data. Here, initial transformations are applied to the raw data, such as data type adjustments, filtering out irrelevant fields, and preliminary aggregations. The Silver layer prepares data for more detailed transformations and enables streamlined querying for insights.

3. **Gold Layer**:
   - This container stores the final, fully transformed data in a highly structured format optimized for analysis and reporting. The data in the Gold layer is ready for loading into analytics services like Azure Synapse Analytics and integration with tools like Power BI for dashboards and visualization.

Using these structured layers in Data Lake Gen2 enables efficient, step-by-step data processing and ensures data integrity across each stage of transformation.

## Azure Databricks Transformation

### Code Snippet:

![image](https://github.com/kamal01singh/Data_Engg_project/blob/main/Images/Azure_databricks.jpg)


* Purpose: This transformation reads tables from the Bronze layer, performs necessary data cleaning (like date formatting), and writes the processed data to the Silver layer.

* Table Looping: The code iterates over each table in the specified path (/mnt/bronze/SalesLT/), dynamically loading each table's data for transformation.

* Date Formatting: It detects columns with "Date" or "date" in the name and standardizes the format to "yyyy-MM-dd" in UTC timezone, ensuring consistency across date fields.

* Output Format: Transformed data is saved in Delta Lake format in the Silver layer (/mnt/silver/SalesLT/), which supports ACID transactions and efficient querying.

* Code Modularity: This structure makes the code modular and adaptable for applying similar transformations across multiple tables, optimizing it for scalable data processing.

