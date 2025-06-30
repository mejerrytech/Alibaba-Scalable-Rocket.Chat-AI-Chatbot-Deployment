FROM python:3.8-slim

# Set the working directory
WORKDIR /app

# Copy the requirements.txt to the container
COPY requirements.txt /app/

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application files to the container
COPY . /app/

# Expose the port for the Flask app
EXPOSE 5005

# Run the Flask app
CMD ["python", "app.py"]
