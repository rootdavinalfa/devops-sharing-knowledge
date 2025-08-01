## Example Project to utilize Docker and Docker Compose

This is a simple application using Express

## How to run

1. Make sure you have Docker and Docker Compose installed on your machine.
2. Run the following command in the terminal to build the Docker image:

   ```bash
   docker build -t docker-example-kit:latest .
   ```

3. After build run the following command to start the application:

   ```bash
   docker run -p 3000:3000 -e HOST=0.0.0.0 docker-example-kit:latest
   ```

4. Open your web browser and navigate to `http://localhost:3000` to see the application running.
