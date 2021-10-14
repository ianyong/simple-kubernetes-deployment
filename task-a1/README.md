# Introduction to Docker

A web application using NGINX running in a Docker container.

Created for CS3219 Software Engineering Principles and Patterns Own Time Own Target (OTOT) Task A1.

Note that this makes use of the Todo application created for OTOT Task B:
* Frontend: https://github.com/ianyong/todo-frontend
* Backend: https://github.com/ianyong/todo-backend

## Getting Started

1. Install Docker by following the instructions [here](https://docs.docker.com/engine/install/).
1. Install Docker Compose by following the instructions [here](https://docs.docker.com/compose/install/).

## Running the Web Application

1. Ensure that the repository is cloned with Git submodules.
1. Make a copy of `.env.template` as `.env`, then specify the `DB_USER` and `DB_PASSWORD`.
1. Start the Docker containers. The Docker Compose configuration is configured to build the backend and frontend Docker images if necessary.
   ```sh
   $ docker-compose up
   ```
   * Note that a volume will be created at `./db_data` in order to persist the database across runs.
1. Navigate to [http://localhost](http://localhost) on a web browser.
