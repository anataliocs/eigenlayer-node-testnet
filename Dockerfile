FROM golang:bookworm

RUN apt-get update && apt-get install -y curl less

#
RUN curl -sSfL https://raw.githubusercontent.com/layr-labs/eigenlayer-cli/master/scripts/install.sh | sh -s

ENV PATH="${PATH}:~/bin"
ENV GOBIN="${GOPATH}/bin"
ENV PATH="${GOBIN}:${PATH}"

RUN go install github.com/Layr-Labs/eigenlayer-cli/cmd/eigenlayer@latest

RUN privateKey=$(echo "password" | eigenlayer operator keys create --insecure --key-type ecdsa testkey  \
    | grep -wE '[a-z0-9]{64}' | tr -d '[:space:]' | tr -d '\/' )  \
    && echo $privateKey \
    && echo "password" | eigenlayer operator keys import --insecure --key-type ecdsa testkey1 "$privateKey"

RUN privateKey2=$(echo "password" | eigenlayer operator keys create --insecure --key-type bls testkey2  \
    | grep -wE '// +[0-9]{77}' | tr -d '[:space:]' | tr -d '\/'  )  \
    && echo $privateKey2 \
    && echo "password" | eigenlayer operator keys import --insecure --key-type bls testkey3 "$privateKey2"


RUN eigenlayer operator config create | echo "N"

EXPOSE 8002

# Start the application using PM2
CMD bash -c "eigenlayer operator register operator.yaml"