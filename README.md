# ROBOTFRAMEWORK API FOR STUDIES
-----------------------

[![SERVREST API](https://img.shields.io/badge/API-ServeRest-brightgreen)](https://github.com/PauloGoncalvesBH/ServeRest/)
[![CI](https://github.com/uLucasFraga/robot_api_for_studies/actions/workflows/ci.yml/badge.svg)](https://github.com/uLucasFraga/robot_api_for_studies/actions/workflows/ci.yml)

Repository with examples of automated tests for API (Rest) using the **robotframeworks** and others libs:
- robot
- requests
- faker

> The **RobotFramework** is a generic open source automation framework. It can be used for test automation and robotic process automation: [GET TO KNOW ROBOT](https://robotframework.org/)

**Note:** The other libs included are for API testing and using fake data:

- [GET TO KNOW ROBOT-REQUESTS](https://github.com/MarketSquare/robotframework-requests#readme)

- [GET TO KNOW FAKER](https://github.com/guykisel/robotframework-faker/blob/master/README.rst)

-----------------------

## Context table

> Index `README`.

  - [Prerequisites](#prerequisites)
  - [Configurations](#configurations)
  - [Installation](#installation)
  - [How to test](#how-to-test)
  - [Tested endpoints](#tested-endpoints)
  - [Report](#report)
  - [Support](#support)
  - [License](#license)

-----------------------

### Prerequisites

- [python and pip](https://www.python.org/downloads)
- [vscode or other IDE](https://code.visualstudio.com/download)
- [robotframework](https://github.com/robotframework/robotframework)

-----------------------

### Configurations

- Use __makefile__ commands, for example:

```js
    $ make clean
    $ make install
```

-----------------------

### Installation

> Clone project

- Clone this project using _ssh_ or _https_.

> example:

```js
$ git clone https://github.com/uLucasFraga/robot_api_for_studies.git
```

- Install all dependencies via **requirements.txt**:

> example:

```js
$ cd /robot_api_for_studies && make install
```

> Tips

- Use your _requirements.txt_ to add or remove libs

-----------------------

### How to test

> To install repo dependencies:

```js
$ make install
```

> To run all the tests

```js
$ make run
```

-----------------------

### Tested endpoints

> All features tested:
- [x] Login
- [x] Usuários
- [x] Produtos
- [ ] Carrinhos

-----------------------

### Report

> To generate reports:

```js
$ make run
```

> To generate reports without the _makefile_ command:

```js
$ robot -d ./log .
```

> To delete logs and other files considered temporary:

```js
$ make clean
```

-----------------------


### Support

- Linkedin: <a href="https://www.linkedin.com/in/ulucasfraga/" target="_blank">**Lucas Fraga**</a>

- E-mail: **lucass.fragaa@gmail.com**


-----------------------

### License

[![License](https://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
- Copyright 2022 © <a href="https://www.linkedin.com/in/ulucasfraga" target="_blank">Lucas Fraga</a>
