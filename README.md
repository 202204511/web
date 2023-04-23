# Mat/Fys-Tutorgruppen Web
This is the webproject for the Mat/Fys-Tutorgruppen.
The webserver is a Django webserver. The Django project is in the `mftutor/` folder and the Django app is in the `tutor/` folder.

## Table of Contents

- [Setup](#setup)
- [Usage](#usage)
- [Linting](#linting)

## Setup

First clone the repository to a project folder of your choice:

    git clone https://github.com/matfystutor/web.git tutorweb

Then create a `mftutor/settings/local.py` based on `local.py.example` in the `mftutor/settings` folder:

    cp mftutor/settings/local.py.example mftutor/settings/local.py

You can choose to run the server locally with either docker or directly on the OS.

### Docker
The project has a Dockerfile, which can be used to run the project locally. To run this first make sure you have Docker installed locally on your machine and have the engine running. See: https://docs.docker.com/get-docker/

Now navigate to the project folder `tutorweb` and build the Docker file:

    docker build -t tutorweb-app .

This may take a while. When it is done you can run the server with docker with the command:

    docker run -p 8000:8000 tutorweb-app

The server is now running locally and can be accessed on 127.0.0.1:8000. 

Note that the Dockerfile only runs `manage.py runserver`. If there is a need for migrating you have to add `manage.py migrate` as well.

### Running directly on OS
If you do not want to run Docker you can run it directly on the OS instead. We recommend running the app in a virtual environment. Download the virtual environment package for python:

    python -m install virtualenv

Navigate to your project folder and create a new virtual environment:

    virtualenv web-venv

On **Windows** now source the folder with:

    ./web-venv/scripts/activate

If you're running a **Unix-system** (Linux/Mac) instead do:

    source web-venv/bin/activate

You should now be able to install the requirements for the app with:

    pip install -r requirements.txt

We use `wheel` to build `Pillow`, but sometimes this might fail and therefore we cannot install the requirements. This is commonly caused by outdated/missing packes. See https://stackoverflow.com/questions/69624327/failed-building-wheel-for-pillow for help if the issue arises.

Migrate and run the server:

    python manage.py migrate
    python manage.py runserver

The server now runs on 127.0.0.1:8000. Note that it is in form of developer mode for Django, so there is a yellow top bar and an extra side panel.

## Usage
Set up the server as described above. Note that this local development environment runs on SQLite, while the main server uses MySQL, so be mindful of this when migrating from Dev to Production.

The SQLite database is empty by default. The server contains various scripts that will populate the database with groups, tutors and rus'. 


## Linting
Please indent Python code with 4 spaces and follow PEP8 as much as possible.

In Vim, you may wish to add the following to your .vimrc:

    autocmd FileType python set shiftwidth=4 softtabstop=4 expandtab
    filetype indent plugin on
