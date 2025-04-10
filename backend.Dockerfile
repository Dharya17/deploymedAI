FROM continuumio/miniconda3

# Set working directory
WORKDIR /app

# Copy environment file and install dependencies
COPY backend/environment.yml .
RUN conda env create -f environment.yml
SHELL ["conda", "run", "-n", "backend-env", "/bin/bash", "-c"]

# Copy app code
COPY backend/ .

# Expose FastAPI port
EXPOSE 8000

# Start the backend API
CMD ["conda", "run", "--no-capture-output", "-n", "backend-env", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
