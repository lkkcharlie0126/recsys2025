# Use official Python image
FROM pytorch/pytorch:2.4.1-cuda12.4-cudnn9-devel

# Set the working directory
WORKDIR /app

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Install basic tools
RUN apt-get update && apt-get install -y \
    git \
    tmux \
    vim \
    && rm -rf /var/lib/apt/lists/*


# setup git
RUN git config --global --add safe.directory /app
RUN git config --global user.email "$GIT_USER_EMAIL"
RUN git config --global user.name "$GIT_USER_NAME"


# Default command to keep the container running
CMD ["tail", "-f", "/dev/null"]

