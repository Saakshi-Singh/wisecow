FROM ubuntu:latest
LABEL Name=wisecow

# Install necessary tools and dependencies
RUN apt-get update && apt-get install -y software-properties-common git && \
    add-apt-repository universe && \
    apt-get update && apt-get install -y fortune-mod cowsay netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

# Clone the repository and copy the script
WORKDIR /app
RUN git clone https://github.com/nyrahul/wisecow.git /tmp/repo && \
    cp /tmp/repo/wisecow.sh /app/wisecow.sh && \
    rm -rf /tmp/repo

# Ensure the /usr/games directory is in PATH
ENV PATH="/usr/games:$PATH"

EXPOSE 4499
CMD ["bash", "./wisecow.sh"]