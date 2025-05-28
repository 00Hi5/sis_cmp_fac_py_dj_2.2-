FROM python:3.7-slim



#ENV PIP_DISABLE_PIP_VERISON_CHECK 1
#ENV PYTHONDONTWRITEBYTECODE 1
#ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    postgresql \
    postgresql-contrib \
    git \
    curl \
    bash \
    nano \
    vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /code

COPY ./requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . .

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
#CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]

#-- crear a image  docker build --no-cache -t djcmpfc22img .
#-- correr a image docker run -d --rm --name djcmpfc22cnt -p 8007:8000 djcmpfc22img
#-- correr a image docker run -d --name djcmpfc22cnt -p 8007:8000 djcmpfc22img
#-- entrar a la imagen docker exec -it djcmpfc22cnt bash

#-- docker logs djcmpfc22cnt
#--accede al contenedor docker exec -it docker logs djcmpfc22cnt bash
#--ver varibles de entorno docker exec -it djcmpfc22cnt env


#-- para contenedor  docker stop djcmpfc22cnt   [si esta en modo detach (-d) elimina el contenedor al detenerlo]
#- -para eliminar contenedor docker rm djcmpfc22cnt [si no  esta en modo detach (-d) elimina el contenedor después de detenerlo]
#--para eliminar imagen docker rmi -f djcmpfc22img


#--accede al contenedor docker exec -it djcmpfc22cnt bash