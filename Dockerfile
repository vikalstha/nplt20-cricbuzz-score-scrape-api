# Use a lightweight Python base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy application code
COPY api /app


RUN apt-get update -y && apt-get install libpcap-dev libpq-dev build-essential -y
# Install dependencies
RUN pip install --no-cache-dir -r /app/requirements.txt

# Expose Flask app port
EXPOSE 5000

# Start the application using Gunicorn
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "index:app"]
