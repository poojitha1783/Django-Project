# Use an official Python runtime as a parent image
FROM python:3.9-slim 

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
#WORKDIR /app
WORKDIR /var/www/myprojectdir/


# Copy the requirements file into the container
#COPY requirements.txt /app/
COPY requirements.txt /var/www/myprojectdir/


# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install gunicorn


# Copy the Django project into the container
COPY . /var/www/myprojectdir/

# Expose the port the app runs on
EXPOSE 8080

# Run Gunicorn with your Django application
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "task3.wsgi:application"]

