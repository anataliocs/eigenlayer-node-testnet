FROM golang:alpine

#
RUN git clone https://github.com/Layr-Labs/eigenlayer-cli.git




RUN go build -o build/eigenlayer cmd/eigenlayer/main.go

# Copy the rest of the application's files
COPY . .



EXPOSE 8002

# Start the application using PM2
CMD bash -c ""