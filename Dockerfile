# Use the official Alpine Linux as a base image
FROM alpine:latest

# Install Python and pip
RUN apk --no-cache add python3

# Create a virtual environment
RUN python3 -m venv /venv

# Set environment variables for Python and add virtual environment to PATH
ENV PATH="/venv/bin:$PATH"

# Upgrade pip within the virtual environment
RUN pip install --upgrade pip

# Install Python modules needed by the Python app
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# Copy files required for the app to run
COPY 	 /usr/src/app/

# Tell the port number the container should expose
EXPOSE 80

# Run the application
CMD ["python3", "/usr/src/app/app.py"]