# Use an official Python runtime as base
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies: FFmpeg, wget (optional), and pip requirements
RUN apt-get update && apt-get install -y \
    ffmpeg \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy bot code
COPY . .

# Set environment variables (use actual secrets in deployment or CI/CD)
ENV BOT_TOKEN=your-telegram-bot-token-here

# Start the bot
CMD ["python", "bot.py"]
