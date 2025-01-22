# Use a lightweight Python image
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the script and requirements
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the script and Excel file into the container
COPY main.py ./
COPY hostnames_and_scripts.xlsx ./

# Ensure rsync is installed
RUN apt-get update && apt-get install -y rsync && apt-get install -y ssh && apt-get install sshpass && rm -rf /var/lib/apt/lists/*

# Command to run the script
CMD ["python", "main.py"]