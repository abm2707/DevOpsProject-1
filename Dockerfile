# Use Python slim image
FROM python:3.10-slim

# Install required system dependencies
RUN apt-get update && apt-get install -y build-essential

# Set working directory
WORKDIR /app

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY . .

# Expose default Streamlit port
EXPOSE 8501

# Run Streamlit
ENTRYPOINT ["streamlit"]
CMD ["run", "stock_streamlit_sql.py", "--server.enableCORS=false"]
